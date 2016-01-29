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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.angle.domain.Post;
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
	
	@RequestMapping("/memModify")
	public String modifyProfile(MultipartHttpServletRequest req){
		/*Member m = memberService.getMember(req.getParameter("id"));
		HttpSession session = req.getSession();
		session.setAttribute("member", m);*/
		
		memberService.modifyMember(req);
		return "redirect:/";
	}
	
	@RequestMapping("/myPage")
	public String myPage(Model model){
		model.addAttribute("title", "/member/myPage");
		return "index";
	}
	// 내가 최근에 작성한 포인트
	@RequestMapping
	public String getMyLatelyPost(String id){
		Post p = memberService.getMyLatelyPost(id);
		return "redirect:/";
	}
	
	// ȸ������ �� �� �κ�
	@RequestMapping(value={"/memberJoinForm"}, method=RequestMethod.GET)
	public String MemberJoin(Model model) {
		
		model.addAttribute("body", "member/memJoin");
		return "main";
	}
	
	// ȸ������ ������ �κ�
	@RequestMapping(value={"/memberJoinProc"}, method=RequestMethod.POST)
	public String MemberJoinProc(HttpServletRequest request) throws IOException {
		
		memberService.insertMemberJoin(request);
		return "main";
	}
	
	// ȸ��Ż�� ó�� �κ�
	@RequestMapping(value={"deleteMemberJoin"}, method=RequestMethod.GET)
	public String deleteMemberJoin(Model model, HttpServletRequest request) {
		
		memberService.deleteMember(request);
		model.addAttribute("body", "member/�ɹ������� �̵��� �����̸�");
		return "main";
	}
	
	// ȸ������ ���̵� �ߺ�üũ ajax �޽���ó�� �κ�
	@RequestMapping(value={"/checkId.ajax"}, method=RequestMethod.GET)
	public ModelAndView checkId(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("ajax/memberAjax");
		int result = memberService.checkId(request);
		model.addObject("result", result);
		
		return model;		
	}
	
	// ȸ������ �г��� �ߺ�üũ ajax �޽���ó�� �κ�
	@RequestMapping(value={"/checkNickName.ajax"}, method=RequestMethod.GET)
	public String checkNickName(Model model, HttpServletRequest request) {
		
		int result = memberService.checkNickName(request);
		model.addAttribute("result", result);
		
		return "ajax/memberAjax";
	}
	
	// ȸ������ ����â �� ��й�ȣ Ȯ�� �� �ݺκ�
	@RequestMapping(value={"/memberUpdatePassCheckForm"}, method=RequestMethod.GET)
	public String memberUpdatePassCheckForm(Model model, HttpServletRequest request) {
		
		model.addAttribute("body", "member/ȸ��������������й�ȣȮ�����̸�");
		return "main";
	}	
	
	// ȸ������ ����â �� ��й�ȣ Ȯ��â ������ �κ�
	@RequestMapping(value={"/memeberUpdatePassCheck.ajax"}, method=RequestMethod.GET)
	public String memeberUpdatePassCheck(Model model, HttpServletRequest request) {
		
		int result = memberService.checkPw(request);
		model.addAttribute("result", result);
		
		return "ajax/memberAjax";
	}
	
	// ȸ������ ����â �� �κ� - ����â �ݰ� ���ÿ� �⺻����(���̵�, �г���) ������.
	@RequestMapping(value={"/updateMemberInfoForm"}, method=RequestMethod.GET)
	public String updateMemberInfoForm(Model model, HttpServletRequest request) {
		
		memberService.getMember(request);
		model.addAttribute("body", "member/memModify");
		
		return "main";
	}
	
	// ȸ������ ���� �� �κ�
	@RequestMapping(value={"/updateMemberInfo"}, method=RequestMethod.POST)
	public String updateMemberInfo(Model model, HttpServletRequest request) throws IOException {
		
		memberService.updateMemberInfo(request);		
		return "main";
	}
}