package com.angle.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.angle.domain.PostComment;

public interface PostCommentDao {

	public HashMap<Integer, ArrayList<PostComment>> getPostCommentListAll(int pNo, int mPage);
	
	public ArrayList<PostComment> getPostCommentList(int pNo, int page);

	public void modifyPostComment(PostComment pCom);

	public void addPostComment(PostComment pCom);

	public void delPostComment(int cNo);

}