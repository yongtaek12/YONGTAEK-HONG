package com.example.demo.vo;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class CustomerVO {
	private int cust_no;
	private String email;
	private String pw;
	private String addr;
	private String addr2;
	private String nickname;
	private String interest;
	private String name;
	private String m_phone;
	private String fname;
	private String birthday;
	private MultipartFile uploadFile;
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public CustomerVO(int cust_no, String email, String pw, String addr, String addr2, String nickname, String interest,
			String name, String m_phone, String fname, String birthday, MultipartFile uploadFile) {
		super();
		this.cust_no = cust_no;
		this.email = email;
		this.pw = pw;
		this.addr = addr;
		this.addr2 = addr2;
		this.nickname = nickname;
		this.interest = interest;
		this.name = name;
		this.m_phone = m_phone;
		this.fname = fname;
		this.birthday = birthday;
		this.uploadFile = uploadFile;
	}
	public CustomerVO() {
		super();
	}
	
	
}

