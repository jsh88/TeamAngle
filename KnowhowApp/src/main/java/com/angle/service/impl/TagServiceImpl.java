package com.angle.service.impl;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angle.dao.TagDao;
import com.angle.domain.Member;
import com.angle.domain.MemberTag;
import com.angle.domain.Post;
import com.angle.domain.PostTag;
import com.angle.env.LuceneKoreanAnalyzer;
import com.angle.service.TagService;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;

	@Autowired
	private LuceneKoreanAnalyzer luceneKoreanAnalyzer;

	public void setTagDao(TagDao tagDao) {
		this.tagDao = tagDao;
	}

	public void setLuceneKoreanAnalyzer(LuceneKoreanAnalyzer luceneKoreanAnalyzer) {
		this.luceneKoreanAnalyzer = luceneKoreanAnalyzer;
	}

	@Override
	public void addPostAndMemberTag(HttpServletRequest request, HttpSession session) {

		Post p = (Post) session.getAttribute("post");

		// tag를 받아욧
		String[] oTags = null;
		String[] tags = null;

		// 태그 insert를 위한 정보에욧
		int pNo = p.getpNo();
		String id = p.getId();

		// 사용자가 추가한 태그가 없으면, 태그가 없다는 것과 같다.
		if ((oTags = request.getParameter("oTags").split(",")) != null) {

			// 포스트에 의하여 추가되었던 태그 + 사용자가 추가한 태그
			tags = request.getParameter("tags").split(",");

			ArrayList<PostTag> pTagList = new ArrayList<>();
			ArrayList<MemberTag> mTagList = new ArrayList<>();

			for (int i = 0; i < tags.length; i++) {

				MemberTag mTag = new MemberTag();

				if (i < oTags.length) {

					// 사용자가 추가한 태그
					PostTag pTag = new PostTag();
					pTag.setpNo(pNo);
					pTag.setTag(oTags[i]);
					pTagList.add(pTag);

				}

				// 추가된 모든 태그
				mTag.setId(id);
				mTag.setTag(tags[i]);
				mTagList.add(mTag);

			}

			tagDao.addRootTag(pTagList);
			// tagDao.addPostTag(pTagList);
			tagDao.addMemberTag(mTagList);

			session.removeAttribute("pTagList");
			session.removeAttribute("post");

		} else {
		}
	}

	@Override
	public void introTagList(HttpServletRequest request) {

		request.setAttribute("iTagList", tagDao.getIntroTagList());

	}

	@Override
	public void getPostTag(HttpServletRequest request, HttpSession session) {

		session.setAttribute("pTagList", tagDao.getPostTag(Integer.parseInt(request.getParameter("pno"))));

	}

	@SuppressWarnings("unchecked")
	@Override
	public void addMemberTag(HttpServletRequest request, HttpSession session) {

		ArrayList<PostTag> pTagList = (ArrayList<PostTag>) session.getAttribute("pTagList");

		ArrayList<MemberTag> mTagList = new ArrayList<>();
		String id = ((Member) session.getAttribute("member")).getId();

		if (pTagList.size() < 20)
			for (int i = 0; i < pTagList.size(); i++) {

				MemberTag mTag = new MemberTag();

				mTag.setId(id);
				mTag.setTag(pTagList.get(i).getTag());

			}
		else
			for (int i = 0; i < 20; i++) {

				MemberTag mTag = new MemberTag();

				mTag.setId(id);
				mTag.setTag(pTagList.get(i).getTag());

			}

		// tagDao.updateRootTag(mTagList);
		if (!mTagList.isEmpty())
			tagDao.addMemberTag(mTagList);

	}

	@Override
	public void getRecommendationTag(HttpServletRequest request) {

		request.setAttribute("tList", tagDao.getIntroTagList());

	}

	@SuppressWarnings("unchecked")
	@Override
	public void addSearchTag(HttpServletRequest request, HttpSession session) {

		Member m = null;
		int searchCount = Integer.parseInt(request.getParameter("searchCount"));

		ArrayList<MemberTag> mTagList = (ArrayList<MemberTag>) luceneKoreanAnalyzer
				.getTags(request.getParameter("word"));

		if (!mTagList.isEmpty()) {

			if ((m = (Member) session.getAttribute("member")) != null) {

				mTagList.get(0).setId(m.getId());

				if (searchCount == 1) {
					tagDao.addMemberTag(mTagList);
					request.setAttribute("mTagList", mTagList);
				}
			}

			request.setAttribute("mTagList", mTagList);

		}
	}

	@Override
	public void autoSearch(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		String keyword = request.getParameter("keyword");
		List<String> tagList = tagDao.getTagList(keyword);
		
		response.setContentType("text/html;charset=UTF-8");
		
        try {
			response.setHeader("Cache-Control", "no-cache");
		} catch (Exception e) {
			e.printStackTrace();
		}
        PrintWriter out = response.getWriter();
        for(int i = 0; i < tagList.size(); i++) {
    		String key = (String)tagList.get(i);
    		out.print("<li class='searchList'>" + key + "</li>");
    		// 자동완성 리스트를 15개로 한정
    		if(i >= 14) {
    			break;
    		}		
    	}
        out.close();
	}
}