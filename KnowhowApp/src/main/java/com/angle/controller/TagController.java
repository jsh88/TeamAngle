package com.angle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "getPostTag", method = RequestMethod.POST)
	public String getPostTag(HttpServletRequest request, HttpSession session) {

		tagService.getPostTag(request, session);
		tagService.addMemberTag(request, session);

		return "knowhow/innerKnowhowDetail";
	}

	// forward:addSearchTag
	public String addSearchTag(HttpServletRequest request, HttpSession session) {

		tagService.getPostTag(request, session);
		tagService.addMemberTag(request, session);

		return "main/innerMainPost";
	}

	// introTagList
	@RequestMapping(value = "introTagList")
	public String introTagList(HttpServletRequest request) {

		tagService.introTagList(request);

		return "intro";
	}

	// 검색 추천 태그
	@RequestMapping(value = "getRecommendationTag")
	public String getRecommendationTag(HttpServletRequest request) {

		tagService.getRecommendationTag(request);

		return "index";
	}

	// 검색 start
	@RequestMapping(value = "searchView", method = RequestMethod.POST)
	public String addMemberTag(HttpServletRequest request, HttpSession session) {

		if (!Boolean.parseBoolean(request.getParameter("isSearch")))
			tagService.addSearchTag(request, session);

		return "forward:doSearch";

	}

	// autoSearch
	@RequestMapping(value = "autoSearch", method = RequestMethod.POST)
	public void autoSearch(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		tagService.autoSearch(request, response, session);
	}
}