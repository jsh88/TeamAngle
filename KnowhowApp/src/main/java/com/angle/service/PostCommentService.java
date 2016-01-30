package com.angle.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PostCommentService {

	public void addPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException;

	public void modifyPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException;

	public void delPostComment(HttpServletRequest request, HttpSession session);

	public void getPostCommentList(HttpServletRequest request, HttpSession session);

}