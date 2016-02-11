package com.angle.dao;

import java.util.ArrayList;

import com.angle.domain.Post;
import com.angle.domain.PostContent;
import com.angle.domain.PostTag;

public interface PostDao {

	public void addPost(Post p);
	
	public void addPostPage(PostContent pCon);

	public void modifyPostPage(PostContent pCon);

	public Post getPost(int pNo);

	public ArrayList<PostContent> getPostPage(int pNo);

	public void delPostPage(int pNo, int pageNum);

	public void delPost(int pNo);

	public ArrayList<Post> getTempPostList(String id);

	public boolean setRecommendPost(int pNo, String id);

	public ArrayList<PostTag> completePosting(ArrayList<PostTag> pTagList);

	public void addPostPage(ArrayList<PostContent> pConList);

	public void setPostState(int pNo);

	void modifyTitle(int pNo, String title);

	public void setMaxPostPage(int pNo, int mPage);

	public void setViewInfo(String id, int pNo);

	public int getPostRecommendationCount(int pNo);

	public Post getPostInfo(int no);

	public Post getBestPostInfo(int no);

}