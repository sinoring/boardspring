package com.boardspring.example.domain;

import java.util.Date;

import org.springframework.stereotype.Component;


public class Comment {
	private int cNum;
	private int bNum;
	private String cContent;
	private String u_id;
	private Date cDate;
	private Date cDate_edit;

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Date getcDate_edit() {
		return cDate_edit;
	}
	public void setcDate_edit(Date cDate_edit) {
		this.cDate_edit = cDate_edit;
	}
	
}
