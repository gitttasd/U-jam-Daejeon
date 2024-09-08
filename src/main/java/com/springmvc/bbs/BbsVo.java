package com.springmvc.bbs;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.springmvc.attach.AttachVo;

public class BbsVo {
	private int BbsNo;
	private String BbsId;
	private String BbsUser;
	private String BbsTitle;
	private String BbsCon;
	private String BbsAddress;
	private String BbsStatus;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss")
	private Date BbsRegdate;
	private int BbsCnt;
	private List<MultipartFile> upfilelist;
	private  List<Integer>  deleteAttIds;
	private List<AttachVo> attList;
	private List<AttachVo> findattName;
	private Float rating;
	private int attNo;
	


	public int getBbsNo() {
		return BbsNo;
	}

	public void setBbsNo(int bbsNo) {
		BbsNo = bbsNo;
	}

	public String getBbsId() {
		return BbsId;
	}

	public void setBbsId(String bbsId) {
		BbsId = bbsId;
	}

	public String getBbsUser() {
		return BbsUser;
	}

	public void setBbsUser(String bbsUser) {
		BbsUser = bbsUser;
	}

	public String getBbsTitle() {
		return BbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		BbsTitle = bbsTitle;
	}

	public String getBbsCon() {
		return BbsCon;
	}

	public void setBbsCon(String bbsCon) {
		BbsCon = bbsCon;
	}

	

	public Date getBbsRegdate() {
		return BbsRegdate;
	}

	public void setBbsRegdate(Date bbsRegdate) {
		BbsRegdate = bbsRegdate;
	}

	public int getBbsCnt() {
		return BbsCnt;
	}

	public void setBbsCnt(int bbsCnt) {
		BbsCnt = bbsCnt;
	}

	public List<MultipartFile> getUpfilelist() {
		return upfilelist;
	}

	public void setUpfilelist(List<MultipartFile> upfilelist) {
		this.upfilelist = upfilelist;
	}

	public List<AttachVo> getAttList() {
		return attList;
	}

	public void setAttList(List<AttachVo> attList) {
		this.attList = attList;
	}

	public List<AttachVo> getFindattName() {
		return findattName;
	}

	public void setFindattName(List<AttachVo> findattName) {
		this.findattName = findattName;
	}

	public List<Integer> getDeleteAttIds() {
		return deleteAttIds;
	}

	public void setDeleteAttIds(List<Integer> deleteAttIds) {
		this.deleteAttIds = deleteAttIds;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float rating) {
		this.rating = rating;
	}

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public String getBbsAddress() {
		return BbsAddress;
	}

	public void setBbsAddress(String bbsAddress) {
		BbsAddress = bbsAddress;
	}

	public String getBbsStatus() {
		return BbsStatus;
	}

	public void setBbsStatus(String bbsStatus) {
		BbsStatus = bbsStatus;
	}

	
	
	

	
}
