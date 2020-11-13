package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.PostVO;

import jdk.jfr.SettingDefinition;
import lombok.Setter;

@Controller
public class QnaController {
	
	public static int pageSIZE =  5;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	public static int updateHit = 0;
	public static int nextId;
	public static int nextNo;
	
	@Autowired
	@Setter
	private QnaDAO dao;
	
	@Autowired
	@Setter
	private ReplyDAO re_dao;
	
	@Autowired
	@Setter
	private CustomerDAO c_dao;
	
	
		//전체목록
		@RequestMapping("/QnaList.do")
		public void list(Model model, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM, String search, String option, HttpSession session) {
			
			System.out.println("search::::"+search);
			System.out.println("option::::"+option);
			
			if( search == null && session.getAttribute("search") != null) {
				search = (String)session.getAttribute("search");
				option = (String)session.getAttribute("option");
			}

			 HashMap map=new HashMap();
			
			totalCount = dao.getTotalCount(map);
			totalPage = (int)Math.ceil( (double)totalCount/pageSIZE ) ;
			int start = (pageNUM-1)*pageSIZE + 1;
			int end = start + pageSIZE -1;
			if(end > totalCount) {
				end = totalCount;
			}
			
			map.put("start",start);
			map.put("end",end);
			map.put("search", search);
			map.put("option", option);
			
		
			model.addAttribute("list", dao.findAll(map));
			model.addAttribute("start", start-1);
			model.addAttribute("end", end-1);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalPage", totalPage);
			
			if(search != null) {
				session.setAttribute("search", search);
				session.setAttribute("option", option);
			}

		}
	
		//상세보기
		@RequestMapping("/QnaDetail.do")
		public void detail(int p_id, Model model) {
			
			updateHit = dao.updateHit(p_id);
			
			HashMap map=new HashMap();
		    map.put("p_id", p_id);
			
			model.addAttribute("a", dao.getQna(map));
			model.addAttribute("listReply",re_dao.findAll(map));
		}
	
	
	   //새글 작성
	   @RequestMapping(value="/QnaInsert.do", method = RequestMethod.GET)
	   public void insertForm(Model model, String nickname, int cust_no , PostVO post) {
		    nextId=dao.getNextId();
			post.setP_id(nextId);
			nextNo=dao.getNextNo();
			post.setP_no(nextNo);
			
			model.addAttribute("p_id", nextId);
			model.addAttribute("p_no", nextNo);
			model.addAttribute("c", c_dao.findByCust_No(cust_no));
	   }
	   @RequestMapping(value="/QnaInsert.do", method = RequestMethod.POST)
	   public ModelAndView insertSubmit(PostVO pvo,int cust_no, int p_id, int p_no, String p_title,String p_content, HttpServletRequest request) {
	      
		    String path=request.getRealPath("img");
			System.out.println("path : "+path);
			
			MultipartFile uploadFile = pvo.getUploadFile();
			String fname = uploadFile.getOriginalFilename();
			
			if(fname != null && !fname.equals("")) {
				try {
					byte[] data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + fname);
					fos.write(data);
					fos.close();
				}catch (Exception e) {
					System.out.println("예외발생 : " + e.getMessage());
				}
				pvo.setFname(fname);
	        } else{
	        	pvo.setFname("");
	        }
			
			
		    CustomerVO c = new CustomerVO();
			String p_writer = c_dao.findByCust_No(cust_no).getNickname();
			int p_hit=0;
			
			HashMap map=new HashMap();
			map.put("p_id", p_id);
			map.put("p_no", p_no);
			map.put("cust_no", cust_no);
			map.put("p_title", p_title);
			map.put("p_writer", p_writer);
			map.put("p_content", p_content);
			map.put("p_hit", p_hit);
			map.put("fname", fname);
	      
			ModelAndView mav = new ModelAndView("redirect:/QnaList.do");
			int re=dao.insert(map);	
		     if(re<=0) {
		        mav.addObject("msg", "게시글 작성 실패");
		        mav.setViewName("error");
		     }
		     
		     return mav;
	   }
	   
	   //게시글 수정
	   @RequestMapping(value="QnaUpdate.do", method = RequestMethod.GET)
	   public void update(int p_id, int cust_no, String nickname, Model model) {
		   HashMap map = new HashMap();
		   map.put("p_id", p_id);
		   map.put("cust_no", cust_no);
		      
		   model.addAttribute("c", c_dao.findByCust_No(cust_no));
		   model.addAttribute("f", dao.getQna(map));
	   }
	   @RequestMapping(value="QnaUpdate.do", method = RequestMethod.POST)
	   public ModelAndView update(HttpServletRequest request, PostVO m, MultipartFile uploadFile) {
		  
		   	String path = request.getRealPath("img");
			System.out.println("path: "+path);
			String oldFname = m.getFname();
			String fname = uploadFile.getOriginalFilename();
			if(fname != null && !fname.equals("")) {
				m.setFname(fname);
				try {
					byte[] data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + fname);
					fos.write(data);
					fos.close();
				}catch (Exception e) {
					System.out.println("예외발생 updateCustomer : " + e.getMessage());
				}
				m.setFname(fname);
	        } else{
	           m.setFname(oldFname);
	        }  
		   
	      ModelAndView mav=new ModelAndView("redirect:/QnaDetail.do?p_id="+m.getP_id());
	      int re = dao.update(m);
	      if(re<=0) {
	         mav.addObject("msg", "게시글 수정 실패");
	         mav.setViewName("error");
	      }else {
				if(fname != null && !fname.equals("") && !m.getFname().equals("")) {
					File file = new File(path + "/" + oldFname);
													// oldFname으로 변경
					file.delete();
				}
	  	  }
	      return mav;
	   }	   
	   
	   //게시글 삭제
	   @RequestMapping(value = "QnaDelete.do", method = RequestMethod.GET)
	   public void delete(int p_id, int cust_no, Model model) {
	      model.addAttribute("p_id", p_id);
	      
	   }
	   @RequestMapping(value = "QnaDelete.do", method = RequestMethod.POST)
	   public ModelAndView delete(HttpServletRequest request, int p_id, int cust_no) {
	      
	      System.out.println(p_id+", "+cust_no);
	      
	      HashMap map=new HashMap();
	      map.put("p_id", p_id);
	      map.put("cust_no", cust_no);
	      
	      ModelAndView mav = new ModelAndView("redirect:/QnaList.do");
	      int re=dao.delete(map);
	      if(re<=0) {
	         mav.addObject("msg", "게시글 삭제 실패");
	         mav.setViewName("error");
	      }
	      return mav;
	   }
}
