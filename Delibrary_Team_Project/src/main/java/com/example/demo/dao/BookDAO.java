package com.example.demo.dao;


import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.db.BorrowManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;

@Repository
public class BookDAO {
	public BookVO findByNo(int b_no) {
		return BookManager.findByNo(b_no);
	}
	//대여하면 책재고량 감소
	public int update(int b_no) {
		return BookManager.update(b_no);
	}
	 public int insertBook(BookVO b) {
		return BookManager.insertBook(b);
	}
	public int getNextNo() {
		return BookManager.getNextNo();
	}
}

