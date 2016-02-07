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

import com.angle.dao.PostCommentDao;
import com.angle.dao.PostDao;
import com.angle.domain.Member;
import com.angle.domain.Post;
import com.angle.domain.PostComment;
import com.angle.domain.PostContent;
import com.angle.domain.PostTag;
import com.angle.env.LuceneKoreanAnalyzer;
import com.angle.service.PostCommentService;
import com.angle.service.PostService;

@Service
public class PostServiceImpl implements PostService, PostCommentService {

	private final static String path = "/resources/images";

	@Autowired
	private PostDao postDao;

	@Autowired
	private PostCommentDao postCommentDao;

	@Autowired
	private LuceneKoreanAnalyzer luceneKoreanAnalyzer;

	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}

	public void setPostCommentDao(PostCommentDao postCommentDao) {
		this.postCommentDao = postCommentDao;
	}

	public void setLuceneKoreanAnalyzer(LuceneKoreanAnalyzer luceneKoreanAnalyzer) {
		this.luceneKoreanAnalyzer = luceneKoreanAnalyzer;
	}

	@Override
	public void addPost(HttpServletRequest request, HttpSession session) {

		Member m = new Member();
		m.setId("test");
		m.setPw("1");
		m.setNickName("test");
		m.setjDate("88/05/17");
		m.setlDate("88/05/17");
		m.setpComment("테스트 접속");
		m.setImage("test.gif");
		m.setvCount(1);
		m.setState(false);

		session.setAttribute("member", m);

		Post p = new Post();
		ArrayList<PostContent> pConList = new ArrayList<>();

		p.setId(((Member) session.getAttribute("member")).getId());
		p.setNickName(((Member) session.getAttribute("member")).getNickName());
		p.setImage(((Member) session.getAttribute("member")).getImage());
		p.setTitle(request.getParameter("title"));

		postDao.addPost(p);

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
	public void getPost(HttpServletRequest request, HttpSession session) {

		int pNo = Integer.parseInt(request.getParameter("pno"));

		session.setAttribute("post", postDao.getPost(pNo));
		session.setAttribute("pConList", postDao.getPostPage(pNo));

	}

	@Override
	public void delPostPage(HttpServletRequest request, HttpSession session) {

		@SuppressWarnings("unchecked")
		ArrayList<PostContent> pConList = (ArrayList<PostContent>) session.getAttribute("pConList");

		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		int pNo = pConList.get(pageNum).getpNo();

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

		if (session.getAttribute("pComList") != null)
			session.removeAttribute("pComList");

	}

	@Override
	public void getTempPostList(HttpServletRequest request, HttpSession session) {

		request.setAttribute("pList", postDao.getTempPostList(((Member) session.getAttribute("member")).getId()));

	}

	@Override
	public void completeWrite(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		int mPage = Integer.parseInt(request.getParameter("mpage"));
		String[] urlArr = request.getParameter("urlArr").split("q1z,");
		String[] conArr = request.getParameter("conArr").split("q1z,");

		conArr[mPage - 1] = conArr[mPage - 1].replace("q1z", "");
		urlArr[mPage - 1] = urlArr[mPage - 1].replace("q1z", "");

		Post p = (Post) session.getAttribute("post");

		ArrayList<PostContent> pConList = new ArrayList<>();
		MultipartFile multipartFile = null;
		File file = null;

		for (int i = 0; i < mPage; i++) {

			PostContent pCon = new PostContent();

			if (request.getFile("imgArr" + i) != null) {

				multipartFile = request.getFile("imgArr" + i);

				file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

				multipartFile.transferTo(file);

				pCon.setMedia(multipartFile.getOriginalFilename()); // 이미지 이름

			} else if (!urlArr[i].equals("undefined")) {

				pCon.setMedia(urlArr[i]); // 동영상 URL

			} else {

				pCon.setMedia("none");

			}

			pCon.setPage(i);
			pCon.setpNo(p.getpNo());
			pCon.setContent(conArr[i]);

			pConList.add(pCon);

		}

		// 포스트 페이지들 추가
		postDao.addPostPage(pConList);

		session.setAttribute("pTagList",
				postDao.completePosting((ArrayList<PostTag>) luceneKoreanAnalyzer.getTags(pConList)));

	}

	@Override
	public void addPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		@SuppressWarnings("unchecked")
		ArrayList<PostComment> pComList = (ArrayList<PostComment>) session.getAttribute("pConList");
		Member m = (Member) session.getAttribute("member");

		PostComment pCom = new PostComment();

		Post p = (Post) session.getAttribute("post");

		if (request.getFile("media") != null) {

			MultipartFile multipartFile = request.getFile("media");

			File file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);

			pCom.setMedia(multipartFile.getOriginalFilename());

		} else {

			pCom.setMedia("none");

		}

		pCom.setpNo(p.getpNo());
		pCom.setPage(Integer.parseInt(request.getParameter("pageNum")));
		pCom.setContent(request.getParameter("content"));
		pCom.setImage(m.getImage());
		pCom.setNickName(m.getNickName());

		postCommentDao.addPostComment(pCom);

		pComList.add(pCom);

	}

	@Override
	public void modifyPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		@SuppressWarnings("unchecked")
		ArrayList<PostComment> pComList = (ArrayList<PostComment>) session.getAttribute("pComList");
		PostComment pCom = null;

		for (int i = 0; i < pComList.size(); i++)
			if (pComList.get(i).getcNo() == Integer.parseInt(request.getParameter("cno")))
				pCom = pComList.get(Integer.parseInt(request.getParameter("cno")));

		if (request.getFile("media") != null) {

			MultipartFile multipartFile = request.getFile("media");

			File file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);

			pCom.setMedia(multipartFile.getOriginalFilename());

		} else {

			pCom.setMedia("none");

		}

		pCom.setContent(request.getParameter("content"));

		postCommentDao.modifyPostComment(pCom);

	}

	@Override
	public void delPostComment(HttpServletRequest request, HttpSession session) {

		postCommentDao.delPostComment(Integer.parseInt(request.getParameter("cno")));

	}

	@Override
	public void getPostCommentList(HttpServletRequest request, HttpSession session) {

		session.setAttribute("pComList",
				postCommentDao.getPostCommentList(Integer.parseInt(request.getParameter("pno"))));

	}

	@Override
	public void recommendPost(HttpServletRequest request, HttpSession session) {

		postDao.setRecommendPost(Integer.parseInt(request.getParameter("pno")),
				((Member) session.getAttribute("member")).getId());

	}

	@Override
	public void getPostList(HttpServletRequest request) {

	}

	@Override
	public void completePosting(HttpSession session) {

		postDao.setPostState(((Post) session.getAttribute("post")).getpNo());

	}

	@Override
	public void modifyTitle(HttpServletRequest request, HttpSession session) {
		
		Post p = (Post) session.getAttribute("post");
		
		p.setTitle(request.getParameter("title"));

		postDao.modifyTitle(p.getpNo(), p.getTitle());

	}
}