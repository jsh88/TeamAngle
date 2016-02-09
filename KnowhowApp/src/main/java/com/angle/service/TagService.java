package com.angle.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface TagService {

	void addPostAndMemberTag(HttpServletRequest request, HttpSession session);

	void introTagList(HttpServletRequest request);

	void getPostTag(HttpServletRequest request, HttpSession session);

}