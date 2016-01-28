package com.angle.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.dao.MemberDao;
import com.angle.domain.Member;
import com.angle.domain.Post;
import com.angle.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public Member getMember(String id) {
		
		return memberDao.getMember(id);
	}
	// 내가 최근에 작성한 포인트
	@Override
	public Post getMyLatelyPost(String id) {
		
		return memberDao.getMyLatelyPost(id);
	}
	
	@Override
	public void modifyMember(MultipartHttpServletRequest req) {
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");
		String image = req.getParameter("image");
		String comment = req.getParameter("pComment");
		
		if(!image.isEmpty()){
			m.setImage(image);
		}
		if(!comment.isEmpty()){
			m.setpComment(comment);
		}
		
		memberDao.modifyMember(m);
		
		
	}
}