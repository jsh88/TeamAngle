package com.angle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import com.angle.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	private static final String filePath = "/resources/images/";

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
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
	}

	// 회원가입 서비스콜 부분
	@RequestMapping(value = { "/memberJoinProc" }, method = RequestMethod.POST)
	public String MemberJoinProc(HttpServletRequest request) throws IOException {

		memberService.insertMemberJoin(request);
		return "redirect:memberJoinForm";
	}
	
	// 회원탈퇴 처리 부분
	@RequestMapping(value = { "/deleteMemberJoin" }, method = RequestMethod.GET)
	public String deleteMemberJoin(Model model, HttpServletRequest request) {

		memberService.deleteMember(request);
		model.addAttribute("body", "member/맴버삭제후 이동할 파일이름");
		return "main";
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
	public String updateMemberInfoForm(Model model, HttpServletRequest request) {

		memberService.getMember(request);
		model.addAttribute("body", "member/memModify");

		return "main";
	}

	/*// 회원정보 수정 콜 부분
	@RequestMapping(value = { "/updateMemberInfo" }, method = RequestMethod.POST)
	public String updateMemberInfo(Model model, HttpServletRequest request) throws IOException {

		memberService.updateMemberInfo(request);
		return "main";
	}*/
	
	// 회원정보ID 수정 콜 부분
	//버튼 누르면 계속 수정되게 되어 있었음 수정함. 아이디 검색하면서 수정이 되어버림.
	@RequestMapping(value = { "/updateMemberInfoIdCheck.ajax" })
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
		return "template/header";
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
		return "template/header";
	}
	
	// 회원정보Pw 수정 콜 부분
	//뷰단에서 이미 PW체크를 했는데 또하는게 이상하여 수정함.
	@RequestMapping(value = { "/updateMemberInfoPw" })
	public String updateMemberInfoPw(Model model, HttpServletRequest request, HttpSession session) throws IOException {
		
//		int result = memberService.checkPw(request);
//		model.addAttribute("result", result);
		memberService.updateMemberInfoPw(request, session);
		return "template/header";
	}
	
	// 회원 로그아웃 콜 부분
	@RequestMapping(value = { "/logoutMember" }, method=RequestMethod.GET)
	public String logoutMemberProc(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		return "intro";
	}
	
	// 회원 로그인창 콜 부분
	@RequestMapping(value = { "/loginMemberForm" })
	public String loginMemberForm(Model model)	{
		
		model.addAttribute("body", "login/login");
		return "login/login";
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
		
		return mav;		
		
	}
	
	/*// 회원 로그인 콜 부분
	@RequestMapping(value = { "/loginMemberProc" }, method=RequestMethod.POST)
	public String loginMemberProc(HttpSession session, HttpServletRequest request) throws IOException {
		memberService.memberLoginCheck(session, request);
		return "redirect:main";
	}*/
	
	
	@RequestMapping("/profileModify.ajax")
	@ResponseBody
	public String modifyProfile(MultipartHttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException{
		String path = request.getServletContext().getRealPath(filePath);
		memberService.modifyMember(request, path, session);
		model.addAttribute("member/memberAjax");
		return path;
	}
	
	// 마이페이지 
	@RequestMapping("/myPage")
	public String getMyPage(HttpServletRequest req, HttpSession session, Model model){
		// 마이 페이지 그냥 session 받아서 jsp 에서 뿌리자
		model.addAttribute("title", "/member/myPage");
		return "redirect:myPage";		// include 한다길래 그냥 title로 써서 index 보냄
	}
	// 내가 최근에 작성한 포인트
	@RequestMapping("/getMyLatelyPost") // 뭘로 받지???
	public String getMyLatelyPost(HttpServletRequest req, HttpSession session){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		memberService.getMyLatelyPost(id);
		return "redirect:/";   // 어디로 보내지?
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
	// 내가 최근 조회한 포스트
	@RequestMapping("/login/*") // 어디?
	public void getMyLatelyLookupPost(HttpServletRequest req, HttpSession session, Model model){
		System.out.println("My lately lookup");
		List<Post> lately = (List<Post>)memberService.getMyLatelyLookupPost(session.getId());
		session.setAttribute("latelyPost", lately) ;
		model.addAttribute("title", "어디로갈까나?");
	}
	
	@RequestMapping("/getMyMostLookupPost")
	public String getMyMostLookupPost(HttpServletRequest req, HttpSession session, Model model){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		memberService.getMyMostLookupPost(id);
		model.addAttribute("title", "어디로갈까나?");
		return "index";
		
	}
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
		
}