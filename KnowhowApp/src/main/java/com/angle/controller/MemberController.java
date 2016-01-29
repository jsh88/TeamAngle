package com.angle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.angle.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping
	public String test(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {		
		
		return null;
	}
	
	// 회원가입 폼 콜 부분
	@RequestMapping(value={"/memberJoinForm"}, method=RequestMethod.GET)
	public String MemberJoin(Model model) {
		
		model.addAttribute("body", "member/memJoin");
		return "main";
	}
	
	// 회원가입 서비스콜 부분
	@RequestMapping(value={"/memberJoinProc"}, method=RequestMethod.POST)
	public String MemberJoinProc(HttpServletRequest request) throws IOException {
		
		memberService.insertMemberJoin(request);
		return "main";
	}
	
	// 회원탈퇴 처리 부분
	@RequestMapping(value={"deleteMemberJoin"}, method=RequestMethod.GET)
	public String deleteMemberJoin(Model model, HttpServletRequest request) {
		
		memberService.deleteMember(request);
		model.addAttribute("body", "member/맴버삭제후 이동할 파일이름");
		return "main";
	}
	
	// 회원가입 아이디 중복체크 ajax 메시지처리 부분
	@RequestMapping(value={"/checkId.ajax"}, method=RequestMethod.GET)
	public ModelAndView checkId(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("ajax/memberAjax");
		int result = memberService.checkId(request);
		model.addObject("result", result);
		
		return model;		
	}
	
	// 회원가입 닉네임 중복체크 ajax 메시지처리 부분
	@RequestMapping(value={"/checkNickName.ajax"}, method=RequestMethod.GET)
	public String checkNickName(Model model, HttpServletRequest request) {
		
		int result = memberService.checkNickName(request);
		model.addAttribute("result", result);
		
		return "ajax/memberAjax";
	}
	
	// 회원정보 수정창 전 비밀번호 확인 폼 콜부분
	@RequestMapping(value={"/memberUpdatePassCheckForm"}, method=RequestMethod.GET)
	public String memberUpdatePassCheckForm(Model model, HttpServletRequest request) {
		
		model.addAttribute("body", "member/회원정보수정전비밀번호확인폼이름");
		return "main";
	}	
	
	// 회원정보 수정창 전 비밀번호 확인창 서비스콜 부분
	@RequestMapping(value={"/memeberUpdatePassCheck.ajax"}, method=RequestMethod.GET)
	public String memeberUpdatePassCheck(Model model, HttpServletRequest request) {
		
		int result = memberService.checkPw(request);
		model.addAttribute("result", result);
		
		return "ajax/memberAjax";
	}
	
	// 회원정보 수정창 콜 부분 - 수정창 콜과 동시에 기본정보(아이디, 닉네임) 가져옴.
	@RequestMapping(value={"/updateMemberInfoForm"}, method=RequestMethod.GET)
	public String updateMemberInfoForm(Model model, HttpServletRequest request) {
		
		memberService.getMember(request);
		model.addAttribute("body", "member/memModify");
		
		return "main";
	}
	
	// 회원정보 수정 콜 부분
	@RequestMapping(value={"/updateMemberInfo"}, method=RequestMethod.POST)
	public String updateMemberInfo(Model model, HttpServletRequest request) throws IOException {
		
		memberService.updateMemberInfo(request);		
		return "main";
	}
	
	
	
	
	
	
	
}