package com.boardspring.example;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BoardspringApplicationTests {
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void contextLoads() {
	}
	
	@Test
	public void testConnection() throws Exception{
		System.out.println("ds : " + ds);
		Connection conn = ds.getConnection();
		System.out.println("con : " + conn);
		conn.close();
	}

}
