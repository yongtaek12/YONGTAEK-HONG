package com.example.demo.controller;

import java.io.FileOutputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.HomeDAO;
import com.example.demo.service.UserSha256;
import com.example.demo.vo.CustomerVO;

@Controller
public class CustomerController {
	@Autowired
	private CustomerDAO dao;

	@Autowired
	private HomeDAO dao2;

	public void setDao(CustomerDAO dao) {
		this.dao = dao;
	}

	//홈화면
	@RequestMapping("/Home.do")
	public void home(Model model, CustomerVO
			custVO, String loginOk, HttpServletRequest request) {

		if (request.getParameter("loginOk") != null) {
			HashMap map = new HashMap();
			String email = request.getParameter("email");
			String password = request.getParameter("pw");
			map.put("email",email);
			map.put("pw",password);
			custVO = dao.getLoginInfo(map);

			if (email.equals(custVO.getEmail()) && password.equals(custVO.getPw())) {
				HttpSession session = request.getSession();
				session.setAttribute("cust_no", custVO.getCust_no());
				request.setAttribute("cust_no", custVO.getCust_no());
			}
		}

		model.addAttribute("SRlist", dao2.getStaffRecommend());
		model.addAttribute("Newlist", dao2.getNewRecommend());
		model.addAttribute("HNlist", dao2.getHomePost(10));
		model.addAttribute("HMakinglist", dao2.getHomePost(20));
		model.addAttribute("HMarketlist", dao2.getHomePost(30));

		HttpSession session = request.getSession();
		request.setAttribute("cust_no", session.getAttribute("cust_no"));
	}

	//회원가입FORM
	@RequestMapping(value="/insertCustomer.do", method=RequestMethod.GET)
	public void insertCustomer() {

	}

	//회원가입 ok
	@RequestMapping(value="/insertCustomer.do", method=RequestMethod.POST)
	public ModelAndView insertCustomerOk(CustomerVO c, HttpServletRequest request, MultipartFile uploadFile) {
		ModelAndView mav = new ModelAndView("redirect:/LoginPage.do");

		// 파일 업로드
		String path = request.getRealPath("img");
		System.out.println(path);
		MultipartFile multipartFile = c.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		if(fname != null && !fname.equals("")) {
			try {
				byte[] data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println("예외발생 insertCustomer 파일 : " + e.getMessage());
			}
		}else {
			fname= "no file";
		}
		c.setFname(fname);
		System.out.println("fname : " + c.getFname());
		
		//비밀번호 암호화:SHA-256
		System.out.println("원래암호: " + c.getPw());
		String encPW = UserSha256.encrypt(c.getPw());
		c.setPw(encPW);
		System.out.println("바뀐암호: " + c.getPw());

		//주소
		String addr1 = request.getParameter("addr1_a") + "," + request.getParameter("addr1_b");
		c.setAddr(addr1);
		c.setName(request.getParameter("name"));
		c.setAddr2(request.getParameter("addr2"));
		c.setNickname(request.getParameter("nickname"));
		c.setM_phone(request.getParameter("m_phone"));
		
		//생년월일
		String birthday = "20/11/11";
		c.setBirthday(birthday);
		
		//장르선택
		String[] values = request.getParameterValues("genre");
		String interest = "";
		for (int i = 0; i < values.length; i++) {
			if (i == values.length-1) {
				interest += values[i];
			} else {
				interest += (values[i] + ",");
			}
		}
		c.setInterest(interest);

		int re = dao.insertCustomer(c);
		if(re<0) {
			mav.setViewName("/error");
		}
		return mav;
	}

	//로그인 FORM
	@RequestMapping(value="/LoginPage.do", method=RequestMethod.GET)
	public void logInForm() {

	}

	//로그인 OK
	@RequestMapping(value="/LoginPage.do", method=RequestMethod.POST)
	public ModelAndView logInOk(String email, String pw, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/Home.do");
		CustomerVO c = null;
		HashMap map = new HashMap();
		map.put("pw",pw);
		map.put("email",email);
		c = dao.logIn(map);
		if(c !=null) {
			//세션유지파트
			session = request.getSession();
			request.setAttribute("cust_no",c.getCust_no());         
		} else {
			mav.setViewName("/LoginPage.do");
		}
		return mav;
	}

	//로그아웃
	@RequestMapping(value="/logout.do")
	public ModelAndView logOut(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/LoginPage.do");
		HttpSession session = request.getSession();
		session.removeAttribute("cust_no");
		return mav;
	}

	//회원탈퇴
	@RequestMapping(value="/optOutCustomer.do", method=RequestMethod.GET)
	public void deleteCustomerForm() {

	}

	//회원탈퇴ok
	@RequestMapping(value="/optOutCustomer.do", method=RequestMethod.POST)
	public ModelAndView deleteCustomerOk(String email, String pw, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/Home.do");
		HashMap map = new  HashMap();
		map.put("email",email);
		map.put("pw",pw);
		dao.deleteCustomer(map);
		return mav;   
	}
	
	// 회원수정
	@RequestMapping("/MyPage_Info.do")
	public void detail(Model model, HttpServletRequest request) {
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		CustomerVO c = dao.findByCust_No(cust_no);

		request.setAttribute("c", c);
		String Email = c.getEmail();
		String id = Email.substring(0, Email.indexOf("@"));
		String email = Email.substring(Email.indexOf("@")+1);
		request.setAttribute("id", id);
		request.setAttribute("email", email);

		// 현왕 주소 유지되게끔 설정 ==================================================================================
		String addr2 = c.getAddr2();
		String addr_num = addr2.substring(0, addr2.indexOf(","));
		String addr_ref = addr2.substring(addr2.indexOf(",")+1);

		String addr = c.getAddr();
		String addr_1 = addr.substring(0, addr.indexOf(","))+addr_ref;
		String addr_2 = addr.substring(addr.indexOf(",")+1);

		request.setAttribute("addr_1", addr_1);
		request.setAttribute("addr_2", addr_2);
		request.setAttribute("addr_num", addr_num);
		request.setAttribute("addr_ref", addr_ref);
		// =====================================================================================================>

		model.addAttribute("c",dao.findByCust_No(cust_no));
	}
	

}