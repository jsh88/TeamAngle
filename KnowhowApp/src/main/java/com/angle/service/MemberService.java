package com.angle.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.domain.Member;
import com.angle.domain.Post;

public interface MemberService {

	public void insertMemberJoin(HttpServletRequest request) throws IOException;

	public int checkId(HttpServletRequest request);

	public int checkNickName(HttpServletRequest request);

	public int checkPw(HttpServletRequest request);

	public void deleteMember(HttpServletRequest request);

	public void memberLoginCheck(HttpSession session, HttpServletRequest request) throws IOException;

	public Member getMember(HttpServletRequest request);

	public void updateMemberInfo(HttpServletRequest request) throws IOException;
	
	public void modifyMember(MultipartHttpServletRequest req);

	public Post getMyLatelyPost(String id);

	public Member getMember(String id);
	
}