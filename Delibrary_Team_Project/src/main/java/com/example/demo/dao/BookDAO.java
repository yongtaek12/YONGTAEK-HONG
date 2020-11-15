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
	//�뿩�ϸ� å��� ����
	public int update(int b_no) {
		return BookManager.update(b_no);
	}
	 public int insertBook(BookVO b) {
		return BookManager.insertBook(b);
	}
	 //대여시 post 번호삽입
	public int getNextNo() {
		return BookManager.getNextNo();
	}
	//대여시 대여 책번호 삽입
	public int getNextNo2() {
		return BookManager.getNextNo2();
	}
}

