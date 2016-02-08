package com.angle.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.angle.domain.PostComment;

public interface PostCommentDao {

	public HashMap<Integer, ArrayList<PostComment>> getPostCommentList(int pNo, int mPage);

	public void modifyPostComment(PostComment pCom);

	public void addPostComment(PostComment pCom);

	public void delPostComment(int cNo);

}