package com.angle.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface TagService {

	void addPostAndMemberTag(HttpServletRequest request, HttpSession session);

	void introTagList(HttpServletRequest request);

	void getPostTag(HttpServletRequest request, HttpSession session);

	void addMemberTag(HttpServletRequest request, HttpSession session);

	void getRecommendationTag(HttpServletRequest request);

	void addSearchTag(HttpServletRequest request, HttpSession session);

	void autoSearch(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;

	void getMemberTag(HttpServletRequest request, HttpSession session);

}