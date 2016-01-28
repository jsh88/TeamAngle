package com.angle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
}