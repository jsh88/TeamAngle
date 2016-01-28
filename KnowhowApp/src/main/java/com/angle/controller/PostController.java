package com.angle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

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

		postService.modifyPost(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 삭제
	@RequestMapping(value = "delPost", method = RequestMethod.GET)
	public String delPost(HttpServletRequest request, HttpSession session) {

		postService.delPost(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 페이지 삭제
	@RequestMapping(value = "delPostPage", method = RequestMethod.GET)
	public String delPostPage(HttpServletRequest request, HttpSession session) {

		postService.delPostPage(request, session);

		return null; // 어디로 가야하오
	}

	// 포스트 작성 취소
		@RequestMapping(value = "canclePosting")
		public String canclePosting(HttpServletRequest request, HttpSession session) {

			postService.canclePosting(request, session);

			return null; // 어디로 가야하오
		}
		
		// 임시 포스트 유무 체크
		@RequestMapping(value = "getTempPost")
		public String getTempPost(HttpServletRequest request, HttpSession session) {

			postService.getTempPost(request, session);

			return null; // 어디로 가야하오
		}

}