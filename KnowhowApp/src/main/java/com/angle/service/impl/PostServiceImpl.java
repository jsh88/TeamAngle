package com.angle.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.dao.PostDao;
import com.angle.domain.Member;
import com.angle.domain.Post;
import com.angle.domain.PostContent;
import com.angle.service.PostCommentService;
import com.angle.service.PostService;

@Service
public class PostServiceImpl implements PostService, PostCommentService {

	private final static String path = "/resources/images";

	@Autowired
	private PostDao postDao;

	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}

	@Override
	public void addPost(HttpServletRequest request, HttpSession session) {

		Post p = new Post();
		ArrayList<PostContent> pConList = new ArrayList<>();

		p.setId(((Member) session.getAttribute("member")).getId());
		p.setNickName(((Member) session.getAttribute("member")).getNickName());
		p.setTitle(request.getParameter("title"));

		p = postDao.addPost(p);

		session.setAttribute("post", p);
		session.setAttribute("pConList", pConList);

	}

	@Override
	public void addPostPage(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		@SuppressWarnings("unchecked")
		ArrayList<PostContent> pConList = (ArrayList<PostContent>) session.getAttribute("pConList");

		PostContent pCon = new PostContent();

		Post p = (Post) session.getAttribute("post");

		if (request.getFile("media") != null) {

			MultipartFile multipartFile = request.getFile("media");

			File file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);

			pCon.setMedia(multipartFile.getOriginalFilename());

		} else {

			pCon.setMedia("none");

		}

		int pageCount = pConList.size();

		// 페이지가 없으면 0, 페이지가 있으면 페이지 + 1
		pCon.setPage(pageCount == 0 ? 0 : ++pageCount);

		pCon.setpNo(p.getpNo());
		pCon.setContent(request.getParameter("content"));

		postDao.addPostPage(pCon);

		pConList.add(pCon);

	}

	@Override
	public void modifyPostPage(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		@SuppressWarnings("unchecked")
		ArrayList<PostContent> pConList = (ArrayList<PostContent>) session.getAttribute("pConList");

		PostContent pCon = pConList.get(Integer.parseInt(request.getParameter("pageNum")));

		if (request.getFile("media") != null) {

			MultipartFile multipartFile = request.getFile("media");

			File file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);

			pCon.setMedia(multipartFile.getOriginalFilename());

		} else {

			pCon.setMedia("none");

		}

		pCon.setContent(request.getParameter("content"));

		postDao.modifyPostPage(pCon);

	}

	@Override
	public void modifyPost(HttpServletRequest request, HttpSession session) {

		int pNo = Integer.parseInt(request.getParameter("pno"));

		session.setAttribute("post", postDao.getPost(pNo));
		session.setAttribute("pConList", postDao.getPostPage(pNo));

	}

	@Override
	public void delPostPage(HttpServletRequest request, HttpSession session) {

		@SuppressWarnings("unchecked")
		ArrayList<PostContent> pConList = (ArrayList<PostContent>) session.getAttribute("pConList");		
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		int pNo= pConList.get(pageNum).getpNo();

		pConList.remove(pageNum);
		
		postDao.delPostPage(pNo, pageNum);

	}

	@Override
	public void delPost(HttpServletRequest request) {
		
		postDao.delPost(Integer.parseInt(request.getParameter("pno")));
		
	}

	@Override
	public void canclePosting(HttpServletRequest request, HttpSession session) {

		session.removeAttribute("post");
		session.removeAttribute("pConList");

	}

	@Override
	public void getTempPostList(HttpServletRequest request, HttpSession session) {
		
		request.setAttribute("pList", postDao.getTempPostList(((Member)session.getAttribute("member")).getId()));
		
	}

	@Override
	public void completePosting(HttpServletRequest request, HttpSession session) {
		
		// 포스트 작업 완료

	}

	@Override
	public void getMorePost(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addPostComment(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyPostComment(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delPostComment(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		
	}
}