package com.example.demo.dao;


import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.vo.BookVO;

@Repository
public class BookDAO {
	public BookVO findByNo(int b_no) {
		return BookManager.findByNo(b_no);
	}
	//�뿩�ϸ� å��� ����
	public int update(int b_no) {
		return BookManager.update(b_no);
	}
}
