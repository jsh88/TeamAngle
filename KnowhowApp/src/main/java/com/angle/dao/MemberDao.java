package com.angle.dao;

import java.util.List;

import com.angle.domain.Member;
import com.angle.domain.Post;

public interface MemberDao {

	public void insertMemberJoin(Member member);

	public int checkId(String id);

	public int checkNickName(String nickname);

	public int checkPw(String id, String pw);

	public void deleteMember(String id);

	public Member getMember(String id);

	//	public Boolean memberLoginCheck(String id, String pw);

	public Member memberLogin(String id);

	public int getVcount(String id);

	public void updateVcount(Member member);

	//	public void updateMemberInfo(Member member);

	public void updateMemberInfoId(Member member, String idModify);

	public void updateMemberInfoNickName(Member member, String nickNameModify);

	public void updateMemberInfoPw(Member member);

	public void updateLdate(Member member);
	
	public List<Post> getMyLatelyPost(String id);

	public Integer modifyMember(Member m);

	public List<Post> getMyConcernPost(String id);

	public List<Post> getMyLatelyLookupPost(String id);

	public List<Post> getMyMostLookupPost(String id);

	public List<Post> getMyPostByViews(String id);

	public List<Post> getMyPostByRecommand(String id);

	public List<Post> getMyPostByComments(String id);

}
