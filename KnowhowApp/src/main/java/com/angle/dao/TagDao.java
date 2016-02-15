package com.angle.dao;

import java.util.ArrayList;
import java.util.List;

import com.angle.domain.MemberTag;
import com.angle.domain.PostTag;
import com.angle.domain.Tag;

public interface TagDao {

	public void addRootTag(ArrayList<PostTag> pTagList);

	public void addPostTag(ArrayList<PostTag> pTagList);

	public void addMemberTag(ArrayList<MemberTag> mTagList);

	public ArrayList<Tag> getIntroTagList();

	public ArrayList<PostTag> getPostTag(int pNo);

	public void updateRootTag(ArrayList<MemberTag> mTagList);

	public List<String> getTagList(String keyword);

}