package com.example.demo.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.db.CustomerManager;
import com.example.demo.db.FolderManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.FolderVO;

@Repository
public class FolderDAO {
	public List<FolderVO> findByNo(HashMap map) {
		return FolderManager.findByNo(map);
	}
}
