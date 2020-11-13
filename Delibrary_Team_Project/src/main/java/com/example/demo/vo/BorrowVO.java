package com.example.demo.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class BorrowVO {
	private int BOR_NO;
	private Date BOR_DATE;
	private Date RETURN_DATE;
	private String RETURN_OK;
	private int CUST_NO;
	private int B_NO;
	public int getBOR_NO() {
		return BOR_NO;
	}
	public void setBOR_NO(int bOR_NO) {
		BOR_NO = bOR_NO;
	}
	public Date getBOR_DATE() {
		return BOR_DATE;
	}
	public void setBOR_DATE(Date bOR_DATE) {
		BOR_DATE = bOR_DATE;
	}
	public Date getRETURN_DATE() {
		return RETURN_DATE;
	}
	public void setRETURN_DATE(Date rETURN_DATE) {
		RETURN_DATE = rETURN_DATE;
	}
	public String getRETURN_OK() {
		return RETURN_OK;
	}
	public void setRETURN_OK(String rETURN_OK) {
		RETURN_OK = rETURN_OK;
	}
	public int getCUST_NO() {
		return CUST_NO;
	}
	public void setCUST_NO(int cUST_NO) {
		CUST_NO = cUST_NO;
	}
	public int getB_NO() {
		return B_NO;
	}
	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}
	public BorrowVO(int bOR_NO, Date bOR_DATE, Date rETURN_DATE, String rETURN_OK, int cUST_NO, int b_NO) {
		super();
		BOR_NO = bOR_NO;
		BOR_DATE = bOR_DATE;
		RETURN_DATE = rETURN_DATE;
		RETURN_OK = rETURN_OK;
		CUST_NO = cUST_NO;
		B_NO = b_NO;
	}
	public BorrowVO() {
		super();
	}
	
}

