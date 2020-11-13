package com.example.demo.db;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BookVO;
import com.example.demo.vo.BookstoreVO;
import com.example.demo.vo.BorrowVO;



public class BookManager {
	
public static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory =
		  new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	
	
	
	public static BookVO findByNo(int b_no) {
		BookVO b = null;
		SqlSession session
		= sqlSessionFactory.openSession();
		b = session.selectOne("book.selectByNo", b_no);
		session.close();
		return b;
	}
	
	public static BookstoreVO findByNo2() {
		BookstoreVO bs = null;
		SqlSession session
		= sqlSessionFactory.openSession();
		bs = session.selectOne("bookstore.selectByNo");
		System.out.println(bs);
		session.close();
		return bs;
	}
	//책재고 감소
	public static int update(int b_no) {
		int re = -1;
		SqlSession session
		= sqlSessionFactory.openSession(true);
		re= session.update("book.updateBook", b_no);
		session.close();
		return re;
	}
	
	public static int insertBook(BookVO b) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.insert("book.insertBook",b);
		session.close();
		return re;
	}
	public static int getNextNo() {
		int n = -1;
		SqlSession session = sqlSessionFactory.openSession();
		n = session.selectOne("book.getNextNo");
		session.close();
		return n;
	}



}