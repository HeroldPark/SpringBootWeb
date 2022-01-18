package com.newlecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//@RestController
//@RequestMapping("/")	// list, detail,edit, reg, del
@Controller
public class HomeController {
	
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("test", "Hello~");
//		return "/WEB-INF/view/index.jsp";
		return "home.index";
	}
	
	@RequestMapping("/help")
	public String help() {
		
		return "home.help";
	}
}
