package com.newlecture.web.controller.user;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.newlecture.web.entity.UserView;
import com.newlecture.web.service.UserService;

//@RestController	// 이렇게 하면 리턴값으로 String만을 반환한다.
@Controller
@RequestMapping("/user/")	// list, detail,edit, reg, del
public class UserController {
		
	@Autowired
	private UserService service;
	
	@RequestMapping("login")
	public String login(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
//			List<UserView> list = service.getViewList(page, field, query, pub);
//			model.addAttribute("login", list);
			System.out.printf("login\n");
			
//			model.addAttribute("test", "login");
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "user.login";	// TilesViewResolver
	}
	
	@RequestMapping("agree")
	public String agree(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
//			List<UserView> list = service.getViewList(page, field, query, pub);
//			model.addAttribute("agree", list);
			System.out.printf("agree\n");
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "user.agree";	// TilesViewResolver
	}
	
	@RequestMapping("join")
	public String join(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
//			List<UserView> list = service.getViewList(page, field, query, pub);
//			model.addAttribute("join", list);
		System.out.printf("join\n");
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "user.join";	// TilesViewResolver
	}

	@RequestMapping("register")
	public String register(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
//			List<UserView> list = service.getViewList(page, field, query, pub);
//			model.addAttribute("join", list);
		System.out.printf("register\n");
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "user.join";	// TilesViewResolver
	}
	
	@RequestMapping("confirm")
	public String confirm(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
			List<UserView> list = service.getViewList(page, field, query, pub);
			model.addAttribute("confirm", list);
			System.out.printf("confirm=%s\n", list);
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "user.confirm";	// TilesViewResolver
	}
	
	@RequestMapping("home")
	public String list(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
//			List<UserView> list = service.getViewList(page, field, query, pub);
//			model.addAttribute("list", list);
//			System.out.printf("list=%s\n", list);
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "user.login";	// TilesViewResolver
	}
	
	@RequestMapping("detail")
	public String detail() {
			
			return "user.detail";
	}
}
