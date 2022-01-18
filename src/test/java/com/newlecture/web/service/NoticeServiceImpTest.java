package com.newlecture.web.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class NoticeServiceImpTest {

	@Autowired
	private NoticeService service;
	
	@Test
	void test() {
		System.out.println(service.getCount(false));
	}

}
