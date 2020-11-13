package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Message;
import com.example.demo.dao.PostDAO;
import com.example.demo.vo.PostVO;
import com.google.gson.Gson;

@Controller
public class InsertPostController {

	@Autowired
	private PostDAO pdao;
		
	public void setPdao(PostDAO pdao) {
		this.pdao = pdao;
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
		String p_title = "?è¥?çî"+fol_no+"?ùò Í∏?";  
		String p_writer="?ïÑÎ¨¥Í∞ú";
		String fname="";

        int p_hit = 0;
		String p_content = "?Ç¥?ö©?ùÑ ?ûÖ?†•?ïò?Ñ∏?öî";
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
	
	
	
	
	
	
	/*
	
	@RequestMapping(value = "/insertMy_Library", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertMy_Library(HttpSession session, HttpServletRequest request) {
		int ML_NO = dao.getNextNo();
		int cust_no = Integer.parseInt(request.getParameter("CUST_NO"));
		int fol_no = Integer.parseInt(request.getParameter("FOL_NO"));
		String ML_TITLE = request.getParameter("ML_TITLE");
		//?òÑ?û¨?ãúÍ∞? Í∞??†∏?ò§Í∏?
	    java.util.Calendar cal = java.util.Calendar.getInstance(); 
		//?òïÎ≥??ôò Í∞??†∏?ò§Í∏?
        java.sql.Date ML_REGDATE = new java.sql.Date(cal.getTimeInMillis());
        //?ä§?ä∏ÎßÅÏùÑ sql.Date ?òïÎ≥??ôò
		//java.sql.Date ML_REGDATE2 = java.sql.Date.valueOf(ML_REGDATE);
		String ML_CONTENT = "?Ç¥?ö©?ùÑ ?ûÖ?†•?ïò?Ñ∏?öî";
		String ML_FILE = "";
		My_libraryVO m = new My_libraryVO();
		m.setML_NO(ML_NO);
		m.setCUST_NO(cust_no);
		m.setML_TITLE(ML_TITLE);
		m.setML_CONTENT(ML_CONTENT);
		m.setML_REGDATE(ML_REGDATE);
		m.setML_FILE(ML_FILE);	
		m.setFol_no(fol_no);
		System.out.println("?àò?ã†?êú ?ç∞?ù¥?Ñ∞:"+m);
		int re =dao.insertMy_Library(m);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
	//?Ç¥?Ñú?û¨ Ï∂úÎ†•
	@RequestMapping(value = "/listMy_Library", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String listMy_Library(HttpSession session, HttpServletRequest request) {
		Gson gson = new Gson();
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		//System.out.println("?àò?ã†?êú ?ç∞?ù¥?Ñ∞:"+cust_no);	
		return gson.toJson(dao.findByCust_No(cust_no));
	}
	*/

}
