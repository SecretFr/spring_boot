package com.study.bbs;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBbsApplicationTests {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Test
	void contextLoads() {
	}

	@Test
	public void testSqlSession() throws Exception {
		System.out.println("test : "+sqlSession.toString());
	}
}