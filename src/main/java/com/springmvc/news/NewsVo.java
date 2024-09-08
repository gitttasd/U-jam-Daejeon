package com.springmvc.news;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.springmvc.attach.AttachVo;

public class NewsVo {
	
	private int newsBbsNo;
	private String newsBbsId;
	private String newsBbsUser;
	private String newsBbsTitle;
	private String newsBbsCon;
	private Date newsBbsRegdate;
	private int newsBbsCnt;
	public int getNewsBbsNo() {
		return newsBbsNo;
	}
	public void setNewsBbsNo(int newsBbsNo) {
		this.newsBbsNo = newsBbsNo;
	}
	public String getNewsBbsId() {
		return newsBbsId;
	}
	public void setNewsBbsId(String newsBbsId) {
		this.newsBbsId = newsBbsId;
	}
	public String getNewsBbsUser() {
		return newsBbsUser;
	}
	public void setNewsBbsUser(String newsBbsUser) {
		this.newsBbsUser = newsBbsUser;
	}
	public String getNewsBbsTitle() {
		return newsBbsTitle;
	}
	public void setNewsBbsTitle(String newsBbsTitle) {
		this.newsBbsTitle = newsBbsTitle;
	}
	public String getNewsBbsCon() {
		return newsBbsCon;
	}
	public void setNewsBbsCon(String newsBbsCon) {
		this.newsBbsCon = newsBbsCon;
	}
	
	public Date getNewsBbsRegdate() {
		return newsBbsRegdate;
	}
	public void setNewsBbsRegdate(Date newsBbsRegdate) {
		this.newsBbsRegdate = newsBbsRegdate;
	}
	public int getNewsBbsCnt() {
		return newsBbsCnt;
	}
	public void setNewsBbsCnt(int newsBbsCnt) {
		this.newsBbsCnt = newsBbsCnt;
	}
	
	
	
	
}
