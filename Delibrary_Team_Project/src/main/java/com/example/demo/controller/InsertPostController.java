package com.example.demo.controller;

import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Message;
import com.example.demo.dao.BookDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.PostVO;
import com.google.gson.Gson;

@Controller
public class InsertPostController {
	//���� ajax - insert post and book
	@Autowired
	private PostDAO pdao;
		
	public void setPdao(PostDAO pdao) {
		this.pdao = pdao;
	}
	@Autowired
	private BookDAO bdao;
	
	
	
	public void setBdao(BookDAO bdao) {
		this.bdao = bdao;
	}



	@RequestMapping(value = "/insertPost", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertPost(HttpSession session, HttpServletRequest request) {
		int group=50;
		int fol_no=Integer.parseInt(request.getParameter("FOL_NO"));
		
		int p_id=pdao.getNextId(group);
		int p_no = pdao.getNextNo(group);
		
		//String p_title = request.getParameter("P_TITLE");
		String p_title = "������"+fol_no+"�� ��";  
		String p_writer="����";
		String fname="";

        int p_hit = 0;
		String p_content = "������ �Է����ּ���";
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		
		
		
		PostVO p = new PostVO();
		p.setP_id(p_id);
		p.setP_no(p_no);
		p.setP_title(p_title);
		p.setP_writer(p_writer);
		p.setP_content(p_content);
		p.setP_hit(p_hit);
		p.setFname(fname);
		p.setCust_no(cust_no);
		p.setFol_no(fol_no);
		//		(#{p_id},#{p_no},#{p_title},#{p_writer},#{p_content},#{p_hit},sysdate,#{fname},#{cust_no})



		int re =pdao.insert2(p);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
	
	
	@RequestMapping(value = "/insertBook", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertBook(HttpSession session, HttpServletRequest request) {
		
		int b_no = bdao.getNextNo();
		String b_title = request.getParameter("b_title");
		String b_publisher = "�̻�";
		String b_writer = request.getParameter("b_writer");
		String String_b_year = request.getParameter("b_year");
		//DATE ȭ
		java.sql.Date b_year = java.sql.Date.valueOf(String_b_year);

		
		int b_price = Integer.parseInt(request.getParameter("b_price"));
		String b_image = request.getParameter("b_image");
		String b_detail = request.getParameter("b_detail");
		String b_index = "����";
		int b_count = 10;
		int c_no = 1;
		//int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		
		
		
		BookVO b = new BookVO();
		b.setB_no(b_no);
		b.setB_title(b_title);
		b.setB_publisher(b_publisher);
		b.setB_writer(b_writer);
		b.setB_year(b_year);
		b.setB_price(b_price);
		b.setB_image(b_image);
		b.setB_index(b_index);
		b.setB_count(b_count);
		b.setB_no(b_no);
		//		(#{p_id},#{p_no},#{p_title},#{p_writer},#{p_content},#{p_hit},sysdate,#{fname},#{cust_no})



		int re =bdao.insertBook(b);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	
	@RequestMapping(value = "/insertMy_Library", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertMy_Library(HttpSession session, HttpServletRequest request) {
		int ML_NO = dao.getNextNo();
		int cust_no = Integer.parseInt(request.getParameter("CUST_NO"));
		int fol_no = Integer.parseInt(request.getParameter("FOL_NO"));
		String ML_TITLE = request.getParameter("ML_TITLE");
		//?��?��?���? �??��?���?
	    java.util.Calendar cal = java.util.Calendar.getInstance(); 
		//?���??�� �??��?���?
        java.sql.Date ML_REGDATE = new java.sql.Date(cal.getTimeInMillis());
        //?��?��링을 sql.Date ?���??��
		//java.sql.Date ML_REGDATE2 = java.sql.Date.valueOf(ML_REGDATE);
		String ML_CONTENT = "?��?��?�� ?��?��?��?��?��";
		String ML_FILE = "";
		My_libraryVO m = new My_libraryVO();
		m.setML_NO(ML_NO);
		m.setCUST_NO(cust_no);
		m.setML_TITLE(ML_TITLE);
		m.setML_CONTENT(ML_CONTENT);
		m.setML_REGDATE(ML_REGDATE);
		m.setML_FILE(ML_FILE);	
		m.setFol_no(fol_no);
		System.out.println("?��?��?�� ?��?��?��:"+m);
		int re =dao.insertMy_Library(m);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
	//?��?��?�� 출력
	@RequestMapping(value = "/listMy_Library", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String listMy_Library(HttpSession session, HttpServletRequest request) {
		Gson gson = new Gson();
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		//System.out.println("?��?��?�� ?��?��?��:"+cust_no);	
		return gson.toJson(dao.findByCust_No(cust_no));
	}
	*/

}
