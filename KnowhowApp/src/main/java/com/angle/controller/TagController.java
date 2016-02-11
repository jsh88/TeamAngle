package com.angle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.angle.service.TagService;

@Controller
public class TagController {

	@Autowired
	private TagService tagService;

	public void setTagService(TagService tagService) {
		this.tagService = tagService;
	}

	// addTagPage 접근
	@RequestMapping(value = "addTagPage")
	public String addTagPage() {

		return "knowhow/addTag";
	}

	// addTag, ajax
	@RequestMapping(value = "addTag")
	@ResponseBody
	public String addTag(HttpServletRequest request, HttpSession session) {

		tagService.addPostAndMemberTag(request, session);

		return "success";
	}

	// addTag
	@RequestMapping(value = "getPostTag")
	public String getPostTag(HttpServletRequest request, HttpSession session) {

		tagService.getPostTag(request, session);
		tagService.addMemberTag(request, session);

		return "knowhow/knowhowDetail";
	}

	// forward:addSearchTag
	public String addSearchTag(HttpServletRequest request, HttpSession session) {

		tagService.getPostTag(request, session);
		tagService.addMemberTag(request, session);

		return "knowhow/postList";
	}

	// introTagList
	@RequestMapping(value = "introTagList")
	@ResponseBody
	public String introTagList(HttpServletRequest request) {

		tagService.introTagList(request);

		return "success";
	}

}