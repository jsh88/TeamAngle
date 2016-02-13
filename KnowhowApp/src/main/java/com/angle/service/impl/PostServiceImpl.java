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
import com.angle.domain.MemberTag;
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

		if (session.getAttribute("pComListMap") != null)
			session.removeAttribute("pComListMap");

	}

	@Override
	public void getTempPostList(HttpServletRequest request, HttpSession session) {

		request.setAttribute("pList", postDao.getTempPostList(((Member) session.getAttribute("member")).getId()));

	}

	@SuppressWarnings("unchecked")
	@Override
	public void completeWrite(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		int mPage = Integer.parseInt(request.getParameter("mpage"));
		String[] urlArr = request.getParameter("urlArr").split("q1z,");
		String[] conArr = request.getParameter("conArr").split("q1z,");

		conArr[mPage - 1] = conArr[mPage - 1].replace("q1z", "");
		urlArr[mPage - 1] = urlArr[mPage - 1].replace("q1z", "");

		Post p = (Post) session.getAttribute("post");
		p.setmPage(mPage);

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
		postDao.setMaxPostPage(p.getpNo(), mPage);

		session.setAttribute("pTagList", (ArrayList<PostTag>) postDao
				.completePosting((ArrayList<PostTag>) luceneKoreanAnalyzer.getTags(pConList)));

	}

	@Override
	public void addPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

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
		pCom.setId(m.getId());
		pCom.setPage(Integer.parseInt(request.getParameter("page")));
		pCom.setContent(request.getParameter("content"));
		pCom.setImage(m.getImage());
		pCom.setNickName(m.getNickName());

		postCommentDao.addPostComment(pCom);

	}

	@Override
	public void modifyPostComment(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		PostComment pCom = new PostComment();

		if (request.getFile("media") != null) {

			MultipartFile multipartFile = request.getFile("media");

			File file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);

			pCom.setMedia(multipartFile.getOriginalFilename());

		} else {

			pCom.setMedia("none");

		}

		pCom.setcNo(Integer.parseInt(request.getParameter("cno")));
		pCom.setContent(request.getParameter("content"));

		postCommentDao.modifyPostComment(pCom);

	}

	@Override
	public void delPostComment(HttpServletRequest request, HttpSession session) {

		postCommentDao.delPostComment(Integer.parseInt(request.getParameter("cno")));

	}

	@Override
	public void getPostCommentList(HttpServletRequest request, HttpSession session) {

		Post p = (Post) session.getAttribute("post");

		int page = Integer.parseInt(request.getParameter("page"));

		session.setAttribute("pComList", postCommentDao.getPostCommentList(p.getpNo(), page));

	}

	@Override
	public void recommendPost(HttpServletRequest request, HttpSession session) {

		request.setAttribute("isState", postDao.setRecommendPost(Integer.parseInt(request.getParameter("pno")),
				((Member) session.getAttribute("member")).getId()));

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

	@SuppressWarnings("unchecked")
	@Override
	public void completeModify(MultipartHttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		int mPage = Integer.parseInt(request.getParameter("mpage"));
		String[] urlArr = request.getParameter("urlArr").split("q1z,");
		String[] conArr = request.getParameter("conArr").split("q1z,");

		conArr[mPage - 1] = conArr[mPage - 1].replace("q1z", "");
		urlArr[mPage - 1] = urlArr[mPage - 1].replace("q1z", "");

		Post p = (Post) session.getAttribute("post");
		p.setmPage(mPage);

		ArrayList<PostContent> pConList = new ArrayList<>();
		MultipartFile multipartFile = null;
		File file = null;

		for (int i = 0; i < mPage; i++) {

			PostContent pCon = new PostContent();

			if (!urlArr[i].equals("undefined")) {

				pCon.setMedia(urlArr[i]); // 동영상 URL

			} else if (request.getFile("imgArr" + i) != null || request.getParameter("imgArr" + i) != null) {

				multipartFile = request.getFile("imgArr" + i);

				if (multipartFile != null) {

					file = new File(request.getServletContext().getRealPath(path), multipartFile.getOriginalFilename());

					multipartFile.transferTo(file);

					pCon.setMedia(multipartFile.getOriginalFilename());

				} else if (request.getParameter("imgArr" + i).indexOf(".") > -1) {

					String str = request.getParameter("imgArr" + i).substring(path.length());

					if (str.equals("null"))
						pCon.setMedia("none");
					else
						pCon.setMedia(str);

				} else {

					pCon.setMedia("none");

				}
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
		postDao.setMaxPostPage(p.getpNo(), mPage);

		session.setAttribute("pTagList", (ArrayList<PostTag>) postDao
				.completePosting((ArrayList<PostTag>) luceneKoreanAnalyzer.getTags(pConList)));

	}

	@Override
	public void setViewInfo(HttpServletRequest request, HttpSession session) {

		postDao.setViewInfo(((Member) session.getAttribute("member")).getId(),
				Integer.parseInt(request.getParameter("pno")));

	}

	@Override
	public void getCommentList(HttpServletRequest request) {
		
		request.setAttribute("pComList", postCommentDao.getPostCommentList(
				Integer.parseInt(request.getParameter("pno")), Integer.parseInt(request.getParameter("page"))));

	}

	@Override
	public void getRecommendCount(HttpServletRequest request) {

		request.setAttribute("postRecommendationCount",
				postDao.getPostRecommendationCount(Integer.parseInt(request.getParameter("pno"))));

	}

	@Override
	public void getPostView(HttpServletRequest request) {

		request.setAttribute("postView", postDao.getPostInfo(Integer.parseInt(request.getParameter("no"))));

	}

	@Override
	public void getBestPostView(HttpServletRequest request) {

		request.setAttribute("postView", postDao.getBestPostInfo(Integer.parseInt(request.getParameter("no"))));

	}

	@SuppressWarnings("unchecked")
	public void getSearchPostView(HttpServletRequest request, HttpSession session) {

		ArrayList<MemberTag> mTagList = (ArrayList<MemberTag>) request.getAttribute("mTagList");
		MemberTag mTag = new MemberTag();
		mTag.setTag(request.getParameter("word"));
//		mTagList.add(mTag);

//		postDao.getSearchPostView(mTagList, Integer.parseInt(request.getParameter("searchCount")));
	}
}