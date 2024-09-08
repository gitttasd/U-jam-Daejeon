package com.springmvc.food;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.springmvc.attach.AttachVo;
import com.springmvc.foodattach.FoodAttachVo;

public class FoodVo {
	private int foodBbsNo;
	private String foodBbsId;
	private String foodBbsUser;
	private String foodBbsTitle;
	private String foodBbsCon;
	private String foodBbsAddress;
	private String foodBbsStatus;
	private LocalDateTime foodBbsRegdate;
	private int foodBbsCnt;
	private List<MultipartFile> upfilelist;
	private List<FoodAttachVo> attList;
	private  List<Integer>  deleteAttIds;
	private Float rating;
	private int foodAttNo;
	
	
	public int getFoodBbsNo() {
		return foodBbsNo;
	}
	public void setFoodBbsNo(int foodBbsNo) {
		this.foodBbsNo = foodBbsNo;
	}
	public String getFoodBbsId() {
		return foodBbsId;
	}
	public void setFoodBbsId(String foodBbsId) {
		this.foodBbsId = foodBbsId;
	}
	public String getFoodBbsUser() {
		return foodBbsUser;
	}
	public void setFoodBbsUser(String foodBbsUser) {
		this.foodBbsUser = foodBbsUser;
	}
	public String getFoodBbsTitle() {
		return foodBbsTitle;
	}
	public void setFoodBbsTitle(String foodBbsTitle) {
		this.foodBbsTitle = foodBbsTitle;
	}
	public String getFoodBbsCon() {
		return foodBbsCon;
	}
	public void setFoodBbsCon(String foodBbsCon) {
		this.foodBbsCon = foodBbsCon;
	}
	public LocalDateTime getFoodBbsRegdate() {
		return foodBbsRegdate;
	}
	public void setFoodBbsRegdate(LocalDateTime foodBbsRegdate) {
		this.foodBbsRegdate = foodBbsRegdate;
	}
	public int getFoodBbsCnt() {
		return foodBbsCnt;
	}
	public void setFoodBbsCnt(int foodBbsCnt) {
		this.foodBbsCnt = foodBbsCnt;
	}
	public List<MultipartFile> getUpfilelist() {
		return upfilelist;
	}
	public void setUpfilelist(List<MultipartFile> upfilelist) {
		this.upfilelist = upfilelist;
	}
	public List<FoodAttachVo> getAttList() {
		return attList;
	}
	public void setAttList(List<FoodAttachVo> attList) {
		this.attList = attList;
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
	public int getFoodAttNo() {
		return foodAttNo;
	}
	public void setFoodAttNo(int foodAttNo) {
		this.foodAttNo = foodAttNo;
	}
	public String getFoodBbsAddress() {
		return foodBbsAddress;
	}
	public void setFoodBbsAddress(String foodBbsAddress) {
		this.foodBbsAddress = foodBbsAddress;
	}
	public String getFoodBbsStatus() {
		return foodBbsStatus;
	}
	public void setFoodBbsStatus(String foodBbsStatus) {
		this.foodBbsStatus = foodBbsStatus;
	}
	
	
	
	
	
	
	
	
}
