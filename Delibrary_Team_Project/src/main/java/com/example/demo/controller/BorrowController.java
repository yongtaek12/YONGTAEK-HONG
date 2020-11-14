package com.example.demo.controller;


import java.awt.print.Book;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Message;
import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.FolderDAO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.FolderVO;
import com.google.gson.Gson;

@RestController
public class BorrowController {
	private static final String String = null;
	@Autowired
	private BorrowDAO dao;
	
	
	
	public void setDao(BorrowDAO dao) {
		this.dao = dao;
	}
	@Autowired
	private BookDAO	bookdao;
	
	
	public void setBookdao(BookDAO bookdao) {
		this.bookdao = bookdao;
	}
	
	//책대여
	@RequestMapping(value = "/insertBorrow", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertBorrow(HttpSession session, HttpServletRequest request)  {
		
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		int b_no = 20;//bookdao.getNextNo();
		String String_BOR_DATE = request.getParameter("BOR_DATE");
		java.sql.Date BOR_DATE = java.sql.Date.valueOf(String_BOR_DATE);
		Calendar cal = Calendar.getInstance();
		System.out.println(String_BOR_DATE);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			cal.setTime(sdf.parse(String_BOR_DATE));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cal.add(Calendar.DATE,15);
        java.sql.Date return_date = new java.sql.Date(cal.getTimeInMillis());



		System.out.println(return_date);
		//java.sql.Date return_date = java.sql.Date.valueOf(String_BOR_DATE);
		BorrowVO b = new BorrowVO();
		int bor_no = dao.getNextNo();
		String return_ok ="Y";
		//현재날짜꺼내기.
       // java.util.Calendar cal = java.util.Calendar.getInstance();      
        //java.util.Calendar cal2 = java.util.Calendar.getInstance();
		//util.date �옄諛� �떆媛� �뜑�븯湲�
        //cal2.add(Calendar.DATE,15);
		//return_date.add(Calendar.DATE,15);

        //java.sql.Date borrow_date = new java.sql.Date(cal.getTimeInMillis());
        //java.sql.Date return_date = new java.sql.Date(cal2.getTimeInMillis());
		b.setBOR_NO(bor_no);
		b.setBOR_DATE(BOR_DATE);
		b.setRETURN_DATE(return_date);
		b.setRETURN_OK(return_ok);
		b.setCUST_NO(cust_no);
		b.setB_NO(b_no);
		//int re2 = bookdao.update(b_no);
		//System.out.println("ddd"+re2);

		int re = dao.insertBorrow(b);
		//梨낆옱怨좉컧�냼
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
}
