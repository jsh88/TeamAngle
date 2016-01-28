package com.angle.dao;

import java.util.ArrayList;

import com.angle.domain.Post;
import com.angle.domain.PostContent;

public interface PostDao {

	public Post addPost(Post p);
	
	public void addPostPage(PostContent pCon);

	public void modifyPostPage(PostContent pCon);

	public Post getPost(int pNo);

	public ArrayList<PostContent> getPostPage(int pNo);

}