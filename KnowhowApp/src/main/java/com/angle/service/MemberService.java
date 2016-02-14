package com.angle.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.domain.Member;
import com.angle.domain.Post;

public interface MemberService {

	public void insertMemberJoin(HttpServletRequest request) throws IOException;

	public int checkId(HttpServletRequest request);

	public int checkNickName(HttpServletRequest request);

	public int modifyCheckPw(String pass, HttpSession session);
	
	public int checkPw(HttpServletRequest request);

	public void deleteMember(String id);

	//	public void memberLoginCheck(HttpSession session, HttpServletRequest request) throws IOException;

	public int memberLoginCheck(String id, String pw, HttpServletRequest request, HttpSession session);

	public Member getMember(HttpServletRequest request);

	//	public void updateMemberInfo(HttpServletRequest request) throws IOException;

	public void updateMemberInfoId(HttpServletRequest request, HttpSession session) throws IOException;

	public void updateMemberInfoNickName(HttpServletRequest request, HttpSession session) throws IOException;

	public void updateMemberInfoPw(HttpServletRequest request, HttpSession session) throws IOException;

	public Member getMember(String id);

	public void getMyLatelyPost(String id);

	public String modifyMember(MultipartHttpServletRequest req, String path, HttpSession session) throws IllegalStateException, IOException;

	public void getMyConcernPost(String id);

	public List<Post> getMyLatelyLookupPost(String id);

	public List<Post> getMyMostLookupPost(String id);

	public void emailCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;

	public int getSendCodeCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception;

	public void getMyPostByViews(HttpServletRequest req, HttpSession session);

	public void getMyPostByRecommand(HttpServletRequest req, HttpSession session);

	public void getMyPostByComments(HttpServletRequest req, HttpSession session);
	
	public String getId(HttpServletRequest request);
	
	public String getPw(HttpServletRequest request);
	
	public String getEmail(HttpServletRequest request);

}