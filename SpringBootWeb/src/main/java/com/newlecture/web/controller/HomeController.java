package com.newlecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//@RestController
//@RequestMapping("/")	// list, detail,edit, reg, del
@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String root(Model model) {
		model.addAttribute("test", "root~");
		System.out.printf("root~\n");

		return "root.index";		// tiles에서 구분가능하게 하기 위해서 "root."을 가상으로 부여한다.
	}
	
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("test", "Hello~");
//		return "/WEB-INF/view/index.jsp";
		return "home.index";		// tiles에서 구분가능하게 하기 위해서 "home."을 가상으로 부여한다.
	}
	
	@RequestMapping("/help")
	public String help() {
		
		return "home.help";
	}
}
