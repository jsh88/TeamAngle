package com.angle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.angle.domain.Member;
import com.angle.domain.Post;
import com.angle.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@RequestMapping("/myPage")
	public String myPage(Model model) {
		model.addAttribute("title", "/member/myPage");
		return "index";
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
		return "member/memJoin";
	}

	// 회원가입 서비스콜 부분
	@RequestMapping(value = { "/memberJoinProc" }, method = RequestMethod.POST)
	public String MemberJoinProc(HttpServletRequest request) throws IOException {

		memberService.insertMemberJoin(request);
		return "main";
	}
	
	// 회원탈퇴 처리 부분
	@RequestMapping(value = { "deleteMemberJoin" }, method = RequestMethod.GET)
	public String deleteMemberJoin(Model model, HttpServletRequest request) {

		memberService.deleteMember(request);
		model.addAttribute("body", "member/맴버삭제후 이동할 파일이름");
		return "main";
	}

	// 회원가입 아이디 중복체크 ajax 메시지처리 부분
	@RequestMapping(value = { "/checkId.ajax" })
	public ModelAndView checkId(HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		model.setViewName("ajax/memberAjax");
		int result = memberService.checkId(request);
		model.addObject("result", result);

		return model;
	}

	// 회원가입 닉네임 중복체크 ajax 메시지처리 부분
	@RequestMapping(value = { "/checkNickName.ajax" })
	public String checkNickName(Model model, HttpServletRequest request) {

		int result = memberService.checkNickName(request);
		model.addAttribute("result", result);

		return "ajax/memberAjax";
	}

	// 회원정보 수정창 전 비밀번호 확인창 콜부분
	@RequestMapping(value = { "/memberUpdatePassCheckForm" }, method = RequestMethod.GET)
	public String memberUpdatePassCheckForm(Model model, HttpServletRequest request) {

		model.addAttribute("body", "member/회원정보수정전비밀번호확인폼이름");
		return "main";
	}

	// 회원정보 수정창 전 비밀번호 확인창 서비스콜 부분
	@RequestMapping(value = { "/memberUpdatePassCheck.ajax" })
	public String memeberUpdatePassCheck(Model model, HttpServletRequest request) {

		int result = memberService.checkPw(request);
		model.addAttribute("result", result);

		return "ajax/memberAjax";
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
	@RequestMapping(value = { "/updateMemberInfoId.ajax" })
	public String updateMemberInfoId(Model model, HttpServletRequest request) throws IOException {
		
		int result = memberService.checkId(request);
		model.addAttribute("result", result);
		memberService.updateMemberInfoId(request);
		return "main";
	}
	
	// 회원정보NickName 수정 콜 부분
	@RequestMapping(value = { "/updateMemberInfoNickName.ajax" })
	public String updateMemberInfoNickName(Model model, HttpServletRequest request) throws IOException {
		
		int result = memberService.checkNickName(request);
		model.addAttribute("result", result);
		memberService.updateMemberInfoNickName(request);
		return "main";
	}
	
	// 회원정보Pw 수정 콜 부분
	@RequestMapping(value = { "/updateMemberInfoPw" })
	public String updateMemberInfoPw(Model model, HttpServletRequest request) throws IOException {
		
		int result = memberService.checkPw(request);
		model.addAttribute("result", result);
		memberService.updateMemberInfoPw(request);
		return "main";
	}
	
	// 회원 로그아웃 콜 부분
	@RequestMapping(value = { "/logoutMember" }, method=RequestMethod.GET)
	public String logoutMemberProc(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main";
	}
	
	// 회원 로그인창 콜 부분
	@RequestMapping(value = { "/loginMemberForm" })
	public String loginMemberForm(Model model)	{
		
		model.addAttribute("body", "member/회원로그인폼이름");
		return "main";
	}
	
	// 회원 로그인 서비스 콜 부분 
	@RequestMapping("/loginAjax")
	public ModelAndView loginProc(HttpServletRequest request) {
		
		int result = memberService.memberLoginCheck(request);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", result);
		mav.setViewName("ajax/memberAjax");
		
		return mav;
	}
	
	/*// 회원 로그인 콜 부분
	@RequestMapping(value = { "/loginMemberProc" }, method=RequestMethod.POST)
	public String loginMemberProc(HttpSession session, HttpServletRequest request) throws IOException {
		memberService.memberLoginCheck(session, request);
		return "redirect:main";
	}*/
	
	
	@RequestMapping("/memModify")
	public String modifyProfile(MultipartHttpServletRequest req){
		/*Member m = memberService.getMember(req.getParameter("id"));
		HttpSession session = req.getSession();
		session.setAttribute("member", m);*/
		
		memberService.modifyMember(req);
		return "redirect:/";
	}
	// 마이페이지 
	@RequestMapping("/myPage")
	public String getMyPage(Model model){
		// 마이 페이지 그냥 session 받아서 jsp 에서 뿌리자
		model.addAttribute("title", "/member/myPage");
		return "index";		// include 한다길래 그냥 title로 써서 index 보냄
	}
	// 내가 최근에 작성한 포인트
	@RequestMapping("/member/") // 뭘로 받지???
	public String getMyLatelyPost(HttpServletRequest req, HttpSession session){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = memberService.getMyLatelyPost(id);
		return "redirect:/";   // 어디로 보내지?
	}
	// 취향저걱 
	@RequestMapping("/getMyConcertPost")
	public String getMyConcernPost(HttpServletRequest req, HttpSession session, Model model){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = memberService.getMyConcernPost(id);
		model.addAttribute("title", "어디로 가야하오");
		return "index"; // 어디로 가야하오
	}
	// 내가 최근 조회한 포스트
	@RequestMapping("/getMyLatelyLookupPost") // 어디?
	public String getMyLatelyLookupPost(HttpServletRequest req, HttpSession session, Model model){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = memberService.getMyLatelyLookupPost(id);
		model.addAttribute("title", "어디로갈까나?");
		return "index";
	}
	
	@RequestMapping("/getMyMostLookupPost")
	public String getMyMostLookupPost(HttpServletRequest req, HttpSession session, Model model){
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = memberService.getMyMostLookupPost(id);
		model.addAttribute("title", "어디로갈까나?");
		return "index";
		
	}
	

	
	
}