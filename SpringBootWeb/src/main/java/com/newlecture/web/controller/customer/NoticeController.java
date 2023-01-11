package com.newlecture.web.controller.customer;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;
import com.newlecture.web.service.NoticeService;

//@RestController	// 이렇게 하면 리턴값으로 String만을 반환한다.
@Controller
@RequestMapping("/customer/notice/")	// list, detail,edit, reg, del
public class NoticeController {
		
	@Autowired
	private NoticeService service;
	
	@RequestMapping("list")
	public String list(Model model) throws ClassNotFoundException, SQLException {
		int page = 1;
		String field= "title";
		String query = "";
		boolean pub = true;
		
			List<NoticeView> list = service.getViewList(page, field, query, pub);
			model.addAttribute("list", list);
			System.out.printf("list=%s\n", list);
			
//			return "customer/notice/list";	// ResourceViewResolver
			return "customer.notice.list";	// TilesViewResolver
	}
	
	@RequestMapping("detail")
	public String detail() {
			
			return "customer.notice.detail";
	}
}
