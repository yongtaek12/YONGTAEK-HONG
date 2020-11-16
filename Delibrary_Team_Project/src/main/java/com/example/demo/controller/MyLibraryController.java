package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.FolderDAO;
import com.example.demo.dao.PostDAO;


@Controller
public class MyLibraryController {
	@Autowired
	private BookDAO dao;

	public void setDao(BookDAO dao) {
		this.dao = dao;
	}
	@Autowired
	private PostDAO pdao;
	
	
	public void setPdao(PostDAO pdao) {
		this.pdao = pdao;
	}
	
	@Autowired
	private FolderDAO fdao;
	
	public void setFdao(FolderDAO fdao) {
		this.fdao = fdao;
	}


	@RequestMapping("/MyLibrary.do")
	public void list(Model model, HttpServletRequest request) {
		int cust_no = 1;
		int TotalFol_number = fdao.pageByfolder(cust_no);
		HashMap map=new HashMap();
		int fol_no = 1;
		if(request.getParameter("fol_no") != null ) {
			fol_no = Integer.parseInt(request.getParameter("fol_no"));
		}
		System.out.println("fol_no = ?"+fol_no );

		
		
		map.put("fol_no", fol_no);
		map.put("cust_no", cust_no);

		model.addAttribute("p", pdao.My_list(map));
		model.addAttribute("fol_no", fdao.pageByfolder(cust_no));
		String pageStr = "";
		for(int i=1; i<= TotalFol_number; i++) {
			pageStr +=  "<a href='MyLibrary.do?fol_no="+i+"'>"  + i + "</a> ";
		}
		model.addAttribute("pageStr", pageStr);


	}

}
