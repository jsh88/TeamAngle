package com.angle.dao;

import java.util.ArrayList;

import com.angle.domain.MemberTag;
import com.angle.domain.PostTag;
import com.angle.domain.Tag;

public interface TagDao {

	public void addRootTag(ArrayList<PostTag> pTagList);

	public void addPostTag(ArrayList<PostTag> pTagList);

	public void addMemberTag(ArrayList<MemberTag> mTagList);

	public ArrayList<Tag> getIntroTagList();

}