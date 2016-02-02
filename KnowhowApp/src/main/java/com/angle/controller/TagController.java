package com.angle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.angle.service.PostService;

@Controller
public class TagController {

	@Autowired
	private PostService postService;

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	// 
	@RequestMapping
	public String recommendTag(HttpServletRequest request, HttpSession session) {
		
		// 

		return null;	// 어디로 가야하오
	}
	
	@RequestMapping(value="/myknowhow")
	public String myKnowhow(){
		
		return "knowhow/myKnowhow";
	}

}