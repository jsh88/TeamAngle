package com.angle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.angle.domain.Member;
import com.angle.domain.Post;
import com.angle.mail.Email;
import com.angle.mail.EmailSender;
import com.angle.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	private static final String filePath = "/resources/images/";

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Autowired
	private EmailSender emailSender;

	public void setEmailSender(EmailSender emailSender) {
		this.emailSender = emailSender;
	}

	//	// 내가 최근에 작성한 포인트
	//	@RequestMapping
	//	public String getMyLatelyPost(String id) {
	//		Post p = memberService.getMyLatelyPost(id);
	//		return "redirect:/";
	//	}

	// 회원가입 폼 콜 부분
	@RequestMapping(value = { "/memberJoinForm" }, method = RequestMethod.GET)
	public String MemberJoin(Model model) {

		model.addAttribute("body", "member/memJoin");
		return "template/header";
		//		return "index";
	}

	// 회원가입 서비스콜 부분
	@RequestMapping(value = { "/memberJoinProc" }, method = RequestMethod.POST)
	@ResponseBody
	public String MemberJoinProc(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		memberService.insertMemberJoin(request);
		memberService.emailCheck(request, response, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberAjax");
		return (String) request.getParameter("id");
	}

	// 회원탈퇴 처리 부분
	@RequestMapping(value = { "/deleteMemberJoin.do" })
	public String deleteMemberJoin(Model model, HttpServletRequest request, HttpSession session) {

		/*Member m = (Member) session.getAttribute("member");
		String id = m.getId();*/

		String id = request.getParameter("id");
		memberService.deleteMember(id);
		model.addAttribute("body", "index");
		session.invalidate();
		//		return "template/header";
		return "index";
	}

	// 회원가입 아이디 중복체크 ajax 메시지처리 부분
	@RequestMapping(value = { "/checkId.ajax" }, method=RequestMethod.POST)
	public ModelAndView checkId(HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		model.setViewName("member/memberAjax");
		int result = memberService.checkId(request);
		model.addObject("result", result);
		System.out.println(result + " : 0 이면 True");
		return model;
	}

	// 회원가입 닉네임 중복체크 ajax 메시지처리 부분
	@RequestMapping(value = { "/checkNickName.ajax" })
	public String checkNickName(Model model, HttpServletRequest request) {

		int result = memberService.checkNickName(request);
		model.addAttribute("result", result);

		return "member/memberAjax";
	}

	// 회원정보 수정창 전 비밀번호 확인창 서비스콜 부분
	@RequestMapping(value = { "/memberUpdatePassCheck.ajax" })
	public String memeberUpdatePassCheck(@RequestParam("passCheck") String pass, Model model, HttpSession session) {

		int result = memberService.modifyCheckPw(pass, session);
		model.addAttribute("result", result);

		return "member/memberAjax";
	}

	// 회원정보 수정창 콜 부분 - 수정창 콜과 동시에 기본정보(아이디, 닉네임) 가져옴.
	@RequestMapping(value = { "/updateMemberInfoForm" }, method = RequestMethod.GET)
	public String updateMemberInfoForm(Model model, HttpServletRequest request, HttpSession session) {

		Member m = memberService.getMember(request);

		/*String pw = request.getParameter("pw");
		model.addAttribute("pw", pw);*/

		session.setAttribute("member", m);

		model.addAttribute("member", m);
		model.addAttribute("body", "member/memModify");

		//		return "template/header";
		return "index";
	}


	// 회원정보ID 수정 콜 부분
	//버튼 누르면 계속 수정되게 되어 있었음 수정함. 아이디 검색하면서 수정이 되어버림.
	@RequestMapping(value = { "/updateMemberInfoId.ajax" })
	public String updateMemberInfoId(Model model, HttpServletRequest request) throws IOException {

		int result = memberService.checkId(request);
		model.addAttribute("result", result);
		//		memberService.updateMemberInfoId(request);
		return "member/memberAjax";
	}

	//아이디 적합성 판정에서 수정되던걸 때어내여 따로 수정하기를 만듬.
	@RequestMapping(value="/updateMemberIdModify")
	public String updateMemberIdModify(HttpServletRequest request, HttpSession session) throws IOException{
		memberService.updateMemberInfoId(request, session);
		session.invalidate();
		return "redirect:./";
	}

	// 회원정보NickName 수정 콜 부분
	//이메일 수정과 똑같이 해놨음 
	@RequestMapping(value = { "/updateMemberInfoNickNameCheck.ajax" })
	public String updateMemberInfoNickName(Model model, HttpServletRequest request) throws IOException {

		int result = memberService.checkNickName(request);
		model.addAttribute("result", result);
		//		memberService.updateMemberInfoNickName(request);
		return "member/memberAjax";
	}

	//그래서 나는 똑같이 수정 했지!
	@RequestMapping(value="/updateMemberNickNameModify")
	public String updateMemberNickNameModify(HttpServletRequest request, HttpSession session) throws IOException{
		memberService.updateMemberInfoNickName(request, session);
		session.invalidate();
		return "redirect:./";
	}

	// 회원정보Pw 수정 콜 부분
	//뷰단에서 이미 PW체크를 했는데 또하는게 이상하여 수정함.
	@RequestMapping(value = { "/updateMemberInfoPw" })
	public String updateMemberInfoPw(Model model, HttpServletRequest request, HttpSession session) throws IOException {

		//		int result = memberService.checkPw(request);
		//		model.addAttribute("result", result);
		memberService.updateMemberInfoPw(request, session);
		session.invalidate();
		return "redirect:./";
	}

	// 회원 로그아웃 콜 부분
	@RequestMapping(value = { "/logoutMember" }, method=RequestMethod.GET)
	public String logoutMemberProc(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		return "redirect:./";
	}

	// 회원 로그인창 콜 부분
	@RequestMapping(value = { "/loginMemberForm" })
	public String loginMemberForm(Model model)	{

		model.addAttribute("body", "login/login");
		//		return "login/login";
		return "index";
	}

	// 회원 로그인 서비스 콜 부분 
	@RequestMapping(value = {"/login/logincheck.do"}, method=RequestMethod.POST)
	public ModelAndView loginProc(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletRequest request, HttpSession session) {
		int result = memberService.memberLoginCheck(id, pw, request, session);
		System.out.println(result);
	
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);
		mav.setViewName("login/loginAjax");

		System.out.println("My lately lookup");
		List<Post> lately = (List<Post>)memberService.getMyLatelyLookupPost(id);
		session.setAttribute("lately", lately) ;
		List<Post> most = (List<Post>)memberService.getMyMostLookupPost(id);
		session.setAttribute("most", most);
		memberService.getMyPostByViews(request, session);
		memberService.getMyPostByRecommand(request, session);
		memberService.getMyPostByComments(request, session);
		memberService.getMyLatelyPost(request, session);
		return mav;

	}

	/*// 회원 로그인 콜 부분
	@RequestMapping(value = { "/loginMemberProc" }, method=RequestMethod.POST)
	public String loginMemberProc(HttpSession session, HttpServletRequest request) throws IOException {
		memberService.memberLoginCheck(session, request);
		return "redirect:main";
	}*/


	@RequestMapping(value={"/profileModify.ajax"}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String modifyProfile(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws IllegalStateException, IOException{
		response.setContentType("text/html;charset=UTF-8");
		String path = request.getServletContext().getRealPath(filePath);
		String profileInfo = memberService.modifyMember(request, path, session);
		model.addAttribute("member/memberAjax");
		return profileInfo;
	}

	// 마이페이지 
	@RequestMapping("/myPage")
	public String getMyPage(HttpServletRequest req, HttpSession session, Model model){
		// 마이 페이지 그냥 session 받아서 jsp 에서 뿌리자
		model.addAttribute("title", "/member/myPage");
		return "redirect:myPage";		// include 한다길래 그냥 title로 써서 index 보냄
	}
	// 취향저걱 
	@RequestMapping("/getMyConcertPost")
	public String getMyConcernPost(HttpServletRequest req, HttpSession session, Model model){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		memberService.getMyConcernPost(id);
		model.addAttribute("title", "어디로 가야하오");
		return "index"; // 어디로 가야하오
	}

	// 내가 최근 조회한 포스트 로그인으로 늠
	/*@RequestMapping("/login/*") // 어디?
	public void getMyLatelyLookupPost(HttpServletRequest req, HttpSession session, Model model){
		System.out.println("My lately lookup");
		List<Post> lately = (List<Post>)memberService.getMyLatelyLookupPost(session.getId());
		session.setAttribute("latelyPost", lately) ;
		model.addAttribute("title", "어디로갈까나?");
	}*/

	// 로그인으로 늠
	/*@RequestMapping("/getMyMostLookupPost")
	public String getMyMostLookupPost(HttpServletRequest req, HttpSession session, Model model){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		memberService.getMyMostLookupPost(id);
		model.addAttribute("title", "어디로갈까나?");
		return "index";

	}*/

	// 이메일 발송
	@RequestMapping("/emailCheck")
	public String emailCheck(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception{
		memberService.emailCheck(req, res, session);
		return "index";
	}
	// 이메일로 받은 인증번호 && 세션 저장한 인증번호 비교
	@RequestMapping("/sendCodeCheck")
	public String getSendCodeCheck(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception{
		memberService.getSendCodeCheck(req, res, session);
		return "index";

	}
	// 내가 작성한 포스트 조회수순
	@RequestMapping("/getMyPostByViews")
	public String getMyPostByViews(HttpServletRequest req, HttpSession session, Model model){

		memberService.getMyPostByViews(req, session);
		model.addAttribute("title","어디로가야하오");
		return "index";
	}

	// 내가 작성한 포스트 좋아요순
	@RequestMapping("/getMyPostByRecommand")
	public String getMyPostByRecommand(HttpServletRequest req, HttpSession session, Model model){

		memberService.getMyPostByRecommand(req, session);
		model.addAttribute("title","어디로가야하오");
		return "index";
	}

	// 내가 작성한 포스트 댓글순
	@RequestMapping("/getMyPostByComments")
	public String getMyPostByComments(HttpServletRequest req, HttpSession session, Model model){

		memberService.getMyPostByComments(req, session);
		model.addAttribute("title","어디로가야하오");
		return "index";
	}



	// 로그인 세션 확인 부분 동작 확인 부분 처리
	@RequestMapping(value = { "/member/loginConfrim" })
	public String loginConfirmForm(Model model, HttpSession session)	{
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		memberService.getMember(id);
		model.addAttribute("body", "member/loginConfirm");
		return "member/loginConfirm";
	}

	// 아이디 찾기 이메일 발송
	@RequestMapping("/sendId.do")
	public String sendEmailIdAction(HttpServletRequest request, Model model) throws Exception {

		Email email = new Email();
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pass");
		String rev_email = memberService.getEmail(request);  // getEmail 에서 id를 가져옴.

		System.out.println("폼에서 받은 닉네임 : " + nickname);
		System.out.println("폼에서 받은 비밀번호 : " + pw);
		System.out.println("서비스에서 받은 id(Email주소) : " + rev_email);

		int result = 0;

		if(rev_email != null) {
			email.setContent("아이디는 " + rev_email + " 입니다.");
			email.setReciver(rev_email); 
			email.setSubject(nickname + " 닉네임을 쓰시는분의 아이디 찾기 메일 입니다.");
			emailSender.sendEmail(email);
			result = 1;			
			model.addAttribute("result", result);
			return "login/loginAjax";
		} else {
			result = 0;
			model.addAttribute("result", result);
			return "login/loginAjax";
		}		

	}


	// 비밀번호 찾기 이메일 발송
	@RequestMapping("/sendPw.do")
	public String sendEmailPwAction(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		Email email = new Email();
		String id = request.getParameter("id");
		String pw = memberService.getPw(request);

		int result = 0;

		String msg = "아래 링크를 클릭하시면 비밀번호 수정페이지로 이동합니다.\nhttp://192.168.0.31:8080/KnowhowApp/updateEmailMemberInfoPwForm?id="+ id + "&check=true";
		//String msg = "아래 링크를 클릭하시면 비밀번호 수정페이지로 이동합니다.\nhttp://10.1.0.214:8080/KnowhowApp/updateEmailMemberInfoPwForm?id="+ id + "&check=true";
		
		if(pw != null) {
			email.setContent(msg);
			email.setReciver(id);
			email.setSubject(id + " 님의 이메일 인증 메일입니다.");
			emailSender.sendEmail(email);
			result = 1;
			model.addAttribute("result", result);

			return "login/loginAjax";
		} else {
			result = 0;
			model.addAttribute("result", result);
			return "login/loginAjax";
		}
	}

	/*@RequestMapping("/checkPwPage.do")
	public String checkPwPageAction(HttpServletRequest request, Model model) throws Exception {
		String id = request.getParameter("id");
		System.out.println("요청된 url : " + id);
		String pw = request.getParameter("pw");
		System.out.println("요청된 url : " + pw);
		return null;
	}*/

	// 회원탈퇴 인증 이메일 발송
	@RequestMapping("/sendMemberDelete.do")
	public String sendEmailMemberDeleteAction(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		Email email = new Email();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();

		int result = 0;

		String msg = "아래 링크를 클릭하시면 회원탈퇴처리 됩니다.\nhttp://192.168.0.31:8080/KnowhowApp/deleteMemberJoin.do?id="+ id + "&deletecheck=true";
		//String msg = "아래 링크를 클릭하시면 회원탈퇴처리 됩니다.\nhttp://10.1.0.214:8080/KnowhowApp/deleteMemberJoin.do?id="+ id + "&deletecheck=true";
		
		if(id != null) {
			email.setContent(msg);
			email.setReciver(id);
			email.setSubject(id + " 님의 회원탈퇴 확인 메일입니다.");
			emailSender.sendEmail(email);
			result = 1;
			model.addAttribute("result", result);

			return "member/memberAjax";
		} else {
			result = 0;
			model.addAttribute("result", result);
			return "member/memberAjax";
		}
	}

	// 비밀번호 찾기 받은 이메일 링크 클릭시 회원정보 담기 
	@RequestMapping(value = { "/updateEmailMemberInfoPwForm" }, method = RequestMethod.GET)
	public String updateEmilMemberInfoPwForm(Model model, HttpServletRequest request, HttpSession session) {

		Member m = memberService.getMember(request);

		session.setAttribute("member", m);

		model.addAttribute("member", m);
		model.addAttribute("body", "member/findPass");

		return "index";

	}

	// 인증 메일 확인 및 체크
	@RequestMapping("/checkMemberJoin.do")
	public ModelAndView checkMemberJoin(HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
		int result = memberService.getSendCodeCheck(request, response, session);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		System.out.println("checkMail 컨트롤러 : " + result);
		mav.setViewName("member/checkMail");
		return mav;
	}





}