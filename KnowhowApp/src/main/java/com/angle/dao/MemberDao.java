package com.angle.dao;

import com.angle.domain.Member;
import com.angle.domain.Post;

public interface MemberDao {

	public Member getMember(String id);

	public Post getMyLatelyPost(String id);
	
	public void modifyMember(Member m);
}
