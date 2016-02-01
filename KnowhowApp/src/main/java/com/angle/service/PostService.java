package com.angle.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PostService {

	public void addPost(HttpServletRequest request, HttpSession session);

	public void addPostPage(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException;

	public void modifyPostPage(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException;

	public void delPostPage(HttpServletRequest request, HttpSession session);

	public void delPost(HttpServletRequest request);

	public void getPost(HttpServletRequest request, HttpSession session);

	public void canclePosting(HttpServletRequest request, HttpSession session);

	public void getTempPostList(HttpServletRequest request, HttpSession session);

	public void recommendPost(HttpServletRequest request, HttpSession session);

	public void completePosting(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException;

	public void getPostList(HttpServletRequest request);

}