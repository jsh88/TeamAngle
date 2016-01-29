package com.angle.dao;

import com.angle.domain.Member;

public interface MemberDao {

	public void insertMemberJoin(Member member);
	public int checkId(String id);
	public int checkNickName(String nickname);
	public int checkPw(String id, String pw);
	public void deleteMember(String id);
	public Member getMember(String id);
	public Boolean memberLoginCheck(String id, String pw);
	
	public void updateMemberInfo(Member member);
}
