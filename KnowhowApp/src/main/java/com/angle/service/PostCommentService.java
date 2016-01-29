package com.angle.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface PostCommentService {

	public void addPostComment(HttpServletRequest request, HttpSession session);

	public void modifyPostComment(HttpServletRequest request, HttpSession session);

	public void delPostComment(HttpServletRequest request, HttpSession session);
	
}