package com.angle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angle.dao.TagDao;
import com.angle.service.TagService;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;

	public void setTagDao(TagDao tagDao) {
		this.tagDao = tagDao;
	}

}