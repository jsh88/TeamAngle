package com.angle.dao;

import java.util.ArrayList;

import com.angle.domain.Post;
import com.angle.domain.PostContent;
import com.angle.domain.PostTag;

public interface PostDao {

	public Post addPost(Post p);
	
	public void addPostPage(PostContent pCon);

	public void modifyPostPage(PostContent pCon);

	public Post getPost(int pNo);

	public ArrayList<PostContent> getPostPage(int pNo);

	public void delPostPage(int pNo, int pageNum);

	public void delPost(int pNo);

	public ArrayList<Post> getTempPostList(String id);

	public void setRecommendPost(int pNo, String id);

	public void completePosting(ArrayList<PostTag> pTagList);

}