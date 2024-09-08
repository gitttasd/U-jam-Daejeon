package com.springmvc.attach;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AttachVo {
	private int attNo;
	private String attName;
	private String attNewName;
	private int attBbsNo;
	private List<AttachVo> attList;
	private List<AttachVo> findattName;
	private List<MultipartFile> deleteAttIds;
	
	
	public int getAttNo() {
		return attNo;
	}
	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public String getAttNewName() {
		return attNewName;
	}
	public void setAttNewName(String attNewName) {
		this.attNewName = attNewName;
	}
	public int getAttBbsNo() {
		return attBbsNo;
	}
	public void setAttBbsNo(int attBbsNo) {
		this.attBbsNo = attBbsNo;
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
	public List<MultipartFile> getDeleteAttIds() {
		return deleteAttIds;
	}
	public void setDeleteAttIds(List<MultipartFile> deleteAttIds) {
		this.deleteAttIds = deleteAttIds;
	}

	
	
}

