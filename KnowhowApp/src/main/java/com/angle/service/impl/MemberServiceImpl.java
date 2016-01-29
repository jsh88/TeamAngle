package com.angle.service.impl;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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

	@Override
	public void insertMemberJoin(HttpServletRequest request) throws IOException {
		
		//request.setCharacterEncoding("utf-8");
		/*GregorianCalendar now = new GregorianCalendar();
		String date = String.format("%TF", now);	// ��¥
		String time = String.format("%TT", now);	// �ð�
		String dateTime = date + " " + time;*/
		
		Date d = new Date();
		String date = d.toString();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");		
		int vcount = 0;
	
		String image = "";
		String pComment = "";
		
		Member m = new Member();
		m.setId(id);
		m.setPw(pw);
		m.setNickName(nickname);
		m.setjDate(date);
		m.setlDate(date);		
		m.setvCount(vcount);
		m.setState(true);
		m.setImage(image);
		m.setpComment(pComment);
		
		memberDao.insertMemberJoin(m);
		
	}

	@Override
	public int checkId(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		int result = memberDao.checkId(id);
		return result;
	}
	
	@Override
	public int checkNickName(HttpServletRequest request) {

		String nickname = request.getParameter("nickname");
		int result = memberDao.checkNickName(nickname);
		return result;
	}
	
	@Override
	public int checkPw(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int result = memberDao.checkPw(id, pw);
		
		return result;
	}

	@Override
	public void deleteMember(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		memberDao.deleteMember(id);		
	}

	@Override
	public void memberLoginCheck(HttpSession session, HttpServletRequest request) throws IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(memberDao.memberLoginCheck(id, pw)) {
			session.setAttribute("member", memberDao.getMember(id).getId());
		}
	}

	@Override
	public void updateMemberInfo(HttpServletRequest request) throws IOException {
		
		Member member = new Member();
		
		member.setId(request.getParameter("id"));
		member.setNickName(request.getParameter("nickname"));
		member.setPw(request.getParameter("pw"));
		
		memberDao.updateMemberInfo(member);
		
	}

	@Override
	public Member getMember(HttpServletRequest request) {
		
		Member member = new Member();
		String id = request.getParameter("id");
		member = memberDao.getMember(id);
		
		return member;
	}
}