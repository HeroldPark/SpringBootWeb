package com.newlecture.web.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;

import com.newlecture.web.entity.NoticeView;

@AutoConfigureTestDatabase(replace=Replace.NONE)	// application.properties에서 database를 replace 하지 않고 그대로 사용한다는 의미
@MybatisTest //spring boot - mybatis test
class NoticeDaoTest {

	@Autowired
	private NoticeDao noticeDao;
	
	@Test
	void test() {
//		fail("Not yet implemented");
		System.out.println("NoticeDaoTest JUnit Test");
		
//		List<NoticeView> list = noticeDao.getViewList(0, 1, "title", "", false);
		List<NoticeView> list = noticeDao.getViewList(0, 1, null, null, false);	// test case
		System.out.println(list.get(0));
		
//		list.forEach(name -> System.out.println(list.get(0)));
	}

}
