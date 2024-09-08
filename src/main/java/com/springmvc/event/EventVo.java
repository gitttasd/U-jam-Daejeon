package com.springmvc.event;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.springmvc.attach.AttachVo;

public class EventVo {
	
	private int eventBbsNo;
	private String eventBbsId;
	private String eventBbsUser;
	private String eventBbsTitle;
	private String eventBbsCon;
	private Date eventBbsRegdate;
	private int eventBbsCnt;
	
	public int getEventBbsNo() {
		return eventBbsNo;
	}
	public void setEventBbsNo(int eventBbsNo) {
		this.eventBbsNo = eventBbsNo;
	}
	public String getEventBbsId() {
		return eventBbsId;
	}
	public void setEventBbsId(String eventBbsId) {
		this.eventBbsId = eventBbsId;
	}
	public String getEventBbsUser() {
		return eventBbsUser;
	}
	public void setEventBbsUser(String eventBbsUser) {
		this.eventBbsUser = eventBbsUser;
	}
	public String getEventBbsTitle() {
		return eventBbsTitle;
	}
	public void setEventBbsTitle(String eventBbsTitle) {
		this.eventBbsTitle = eventBbsTitle;
	}
	public String getEventBbsCon() {
		return eventBbsCon;
	}
	public void setEventBbsCon(String eventBbsCon) {
		this.eventBbsCon = eventBbsCon;
	}
	
	
	public Date getEventBbsRegdate() {
		return eventBbsRegdate;
	}
	public void setEventBbsRegdate(Date eventBbsRegdate) {
		this.eventBbsRegdate = eventBbsRegdate;
	}
	public int getEventBbsCnt() {
		return eventBbsCnt;
	}
	public void setEventBbsCnt(int eventBbsCnt) {
		this.eventBbsCnt = eventBbsCnt;
	}
	
	
	
	
	
}
