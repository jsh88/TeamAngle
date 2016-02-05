package com.angle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.angle.service.TagService;

@Controller
public class TagController {

	@Autowired
	private TagService tagService;

	public void setTagService(TagService tagService) {
		this.tagService = tagService;
	}

	// addTag 접근
	@RequestMapping(value = "addTag")
	public String addTag() {
		
		return "knowhow/addTag";
	}
}