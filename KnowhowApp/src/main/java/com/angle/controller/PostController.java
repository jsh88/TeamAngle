package com.angle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// 포스트 작성 페이지로
	@RequestMapping(value = "startPosting")
	public String startPosting(HttpServletRequest request, HttpSession session) {

		return "knowhow/startPosting";
	}

	// 포스트 작성 시작
	@RequestMapping(value = "addPost")
	public String addPost(HttpServletRequest request, HttpSession session) {

		postService.addPost(request, session);

		return "knowhow/addKnowhow"; // 어디로 가야하오
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
	@RequestMapping(value = "modifyStart", method = RequestMethod.GET)
	public String modifyStart(HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.getPost(request, session);

		return "knowhow/modifyStart";
	}

	// 포스트 수정 페이지로
	@RequestMapping(value = "modifyPost")
	public String modifyPost(HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		return "knowhow/modifyKnowhow";
	}

	// 포스트 타이틀 수정
	@RequestMapping(value = "modifyTitle")
	@ResponseBody
	public String modifyTitle(HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.modifyTitle(request, session);

		return "success"; // ajax
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

	// 포스트 작성 완료, ajax
	@RequestMapping(value = "completeWrite", method = RequestMethod.POST)
	@ResponseBody
	public String completeWrite(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.completeWrite(request, session);

		return "success"; // ajax
	}

	// 포스트 수정 완료, ajax
	@RequestMapping(value = "completeModify", method = RequestMethod.POST)
	@ResponseBody
	public String completeModify(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postService.completeModify(request, session);

		return "success"; // ajax
	}

	// 포스트 작성 완료, ajax
	@RequestMapping(value = "completePosting", method = RequestMethod.POST)
	public String completePosting(HttpSession session) throws IllegalStateException, IOException {

		postService.completePosting(session);

		return "forward:addTag";
	}

	/**
	 * 댓글 조회, 추가, 수정, 삭제
	 */

	// 댓글 페이징 조회, ajax
	@RequestMapping(value = "getCommentList", method = RequestMethod.POST)
	public String getCommentList(HttpServletRequest request) throws IllegalStateException, IOException {

		postCommentService.getCommentList(request);

		return "knowhow/comment"; // ajax
	}

	// 댓글 추가, ajax
	@RequestMapping(value = "addPostComment", method = RequestMethod.POST)
	@ResponseBody
	public String addPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postCommentService.addPostComment(request, session);

		return "success";
	}

	// 댓글 수정, ajax
	@RequestMapping(value = "modifyPostComment", method = RequestMethod.POST)
	@ResponseBody
	public String modifyPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		postCommentService.modifyPostComment(request, session);

		return "success";
	}

	// 댓글 삭제, ajax
	@RequestMapping(value = "delPostComment")
	@ResponseBody
	public String delPostComment(HttpServletRequest request, HttpSession session) {

		postCommentService.delPostComment(request, session);

		return "success";
	}

	/**
	 * 포스트 조회, 검색
	 */

	// 포스트 페이지, 댓글 일반 조회, 디테일
	@RequestMapping(value = "morePost", method = RequestMethod.GET)
	public String morePost(HttpServletRequest request, HttpSession session) {

		postService.addViewCount(request);
		postService.getPost(request, session);
		postService.getRecommendCount(request);
		// postCommentService.getPostCommentList(request, session);

		return "forward:getPostTag";
	}

	// 포스트 리스트
	@RequestMapping(value = "searchPostList")
	public String searchPostList(HttpServletRequest request) {

		postService.getPostList(request);

		return null; // 어디로 가야하오
	}

	// 포스트 추천, ajax
	@RequestMapping(value = "recommendPost")
	@ResponseBody
	public String recommendPost(HttpServletRequest request, HttpSession session) {

		postService.recommendPost(request, session);

		return String.valueOf((boolean) request.getAttribute("isState"));
	}

}