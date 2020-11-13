package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BookStoreDAO;
import com.example.demo.dao.FolderDAO;

@Controller
public class DetailBookController {
	@Autowired
	private BookDAO dao;

	public void setDao(BookDAO dao) {
		this.dao = dao;
	}
	@Autowired
	private BookStoreDAO dao2;

	public void setDao2(BookStoreDAO dao2) {
		this.dao2 = dao2;
	}
	@Autowired
	private FolderDAO fdao;
	
	public void setFdao2(FolderDAO fdao) {
		this.fdao = fdao;
	}
	@RequestMapping("/detailBook.do")
	public void list(int b_no, Model model, HttpServletRequest request,HttpServletRequest session) {
		//int cust_no = (int)session.getAttribute("cust_no");
		HashMap map = new HashMap();
		//int cust_no = 1;

		//map.put("cust_no",cust_no);
		model.addAttribute("b", dao.findByNo(b_no));
		model.addAttribute("bs", dao2.findByNo());
		//model.addAttribute("f",fdao.findByNo(map));		
		model.addAttribute("query", request.getParameter("query"));
		System.out.println(request.getParameter("query"));
	}
}
