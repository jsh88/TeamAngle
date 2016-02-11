package com.angle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = { "index", "/" })
	public String index() {

		return "index";
	}
	
	@RequestMapping(value = { "main", "a" })
	public String main() {

		return "main/main";
	}

}