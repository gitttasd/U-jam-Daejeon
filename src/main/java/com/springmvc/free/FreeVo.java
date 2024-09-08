package com.springmvc.free;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.springmvc.attach.AttachVo;

public class FreeVo {
	
	private int freeBbsNo;
	private String freeBbsId;
	private String freeBbsUser;
	private String freeBbsTitle;
	private String freeBbsCon;
	private Date freeBbsRegdate;
	private int freeBbsCnt;
	
	
	
	public int getFreeBbsNo() {
		return freeBbsNo;
	}
	public void setFreeBbsNo(int freeBbsNo) {
		this.freeBbsNo = freeBbsNo;
	}
	public String getFreeBbsId() {
		return freeBbsId;
	}
	public void setFreeBbsId(String freeBbsId) {
		this.freeBbsId = freeBbsId;
	}
	

	public String getFreeBbsUser() {
		return freeBbsUser;
	}
	public void setFreeBbsUser(String freeBbsUser) {
		this.freeBbsUser = freeBbsUser;
	}
	public String getFreeBbsTitle() {
		return freeBbsTitle;
	}
	public void setFreeBbsTitle(String freeBbsTitle) {
		this.freeBbsTitle = freeBbsTitle;
	}
	public String getFreeBbsCon() {
		return freeBbsCon;
	}
	public void setFreeBbsCon(String freeBbsCon) {
		this.freeBbsCon = freeBbsCon;
	}
	
	public Date getFreeBbsRegdate() {
		return freeBbsRegdate;
	}
	public void setFreeBbsRegdate(Date freeBbsRegdate) {
		this.freeBbsRegdate = freeBbsRegdate;
	}
	public int getFreeBbsCnt() {
		return freeBbsCnt;
	}
	public void setFreeBbsCnt(int freeBbsCnt) {
		this.freeBbsCnt = freeBbsCnt;
	}
	
	
	
}
