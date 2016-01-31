package com.angle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.service.PostCommentService;
import com.angle.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private PostCommentService postCommentService;

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	public void setPostCommentService(PostCommentService postCommentService) {
		this.postCommentService = postCommentService;
	}

	/**
	 * 포스트(페이지 포함) 추가, 수정, 삭제
	 */

	// 포스트 작성 시작
	@RequestMapping(value = "addPost")
	public String addPost(HttpServletRequest request, HttpSession session) {

		postService.addPost(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 페이지 작성
	@RequestMapping(value = "addPostPage", method = RequestMethod.POST)
	public String addPostPage(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.addPostPage(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 페이지 수정
	@RequestMapping(value = "modifyPostPage", method = RequestMethod.POST)
	public String modifyPostPage(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.modifyPostPage(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 수정 시작
	@RequestMapping(value = "modifyPost")
	public String modifyPost(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.getPost(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 삭제
	@RequestMapping(value = "delPost", method = RequestMethod.GET)
	public String delPost(HttpServletRequest request) {

		postService.delPost(request);

		return null; // 어디로 가야하오
	}

	// 포스트 페이지 삭제
	@RequestMapping(value = "delPostPage", method = RequestMethod.GET)
	public String delPostPage(HttpServletRequest request, HttpSession session) {

		postService.delPostPage(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 작성 취소 or 포스트 조회 취소
	@RequestMapping(value = "canclePosting")
	public String canclePosting(HttpServletRequest request, HttpSession session) {

		postService.canclePosting(request, session);

		return null; // 어디로 가야하오
	}

	// 임시 포스트 리스트 가져오기
	@RequestMapping(value = "getTempPost")
	public String getTempPostList(HttpServletRequest request, HttpSession session) {

		postService.getTempPostList(request, session);

		return null; // 어디로 가야하오
	}

	// 포스팅 완료
	@RequestMapping(value = "completePosting")
	public String completePosting(HttpServletRequest request, HttpSession session) {

		postService.completePosting(request, session);

		return null; // 어디로 가야하오
	}

	/**
	 * 댓글 추가, 수정, 삭제
	 */

	// 댓글 추가
	@RequestMapping(value = "addPostComment", method = RequestMethod.POST)
	public String addPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postCommentService.addPostComment(request, session);

		return null; // 어디로 가야하오
	}

	// 댓글 수정
	@RequestMapping(value = "modifyPostComment", method = RequestMethod.POST)
	public String modifyPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postCommentService.modifyPostComment(request, session);

		return null; // 어디로 가야하오
	}

	// 댓글 삭제
	@RequestMapping(value = "delPostComment")
	public String delPostComment(HttpServletRequest request, HttpSession session) {

		postCommentService.delPostComment(request, session);

		return null; // 어디로 가야하오
	}

	/**
	 * 포스트 조회, 검색
	 */

	// 포스트 페이지, 댓글 일반 조회
	@RequestMapping(value = "morePost")
	public String morePost(HttpServletRequest request, HttpSession session) {

		postService.getPost(request, session);
		postCommentService.getPostCommentList(request, session);

		return null; // 어디로 가야하오
	}

	// t
	@RequestMapping(value = "t")
	public String t(HttpServletRequest request, HttpSession session) {

		postService.getPost(request, session);

		return null; // 어디로 가야하오
	}

}