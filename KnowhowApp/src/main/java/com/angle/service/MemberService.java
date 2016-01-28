package com.angle.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.domain.Member;
import com.angle.domain.Post;

public interface MemberService {

	public Member getMember(String id);

	public Post getMyLatelyPost(String id);
	
	public void modifyMember(MultipartHttpServletRequest req);
}