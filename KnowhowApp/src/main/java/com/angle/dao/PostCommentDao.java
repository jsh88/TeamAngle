package com.angle.dao;

import java.util.ArrayList;

import com.angle.domain.PostComment;

public interface PostCommentDao {

	public ArrayList<PostComment> getPostCommentList(int pNo);

	public void modifyPostComment(PostComment pCom);

	public void addPostComment(PostComment pCom);

	public void delPostComment(int cNo);

}