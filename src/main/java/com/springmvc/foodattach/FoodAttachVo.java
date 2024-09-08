package com.springmvc.foodattach;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FoodAttachVo {
	private int foodAttNo;
	private String  foodAttName;
	private String foodAttNewName;
	private int foodAttBbsNo ;
	private List<FoodAttachVo> attList;

	private List<MultipartFile> deleteAttIds;
	public int getFoodAttNo() {
		return foodAttNo;
	}
	public void setFoodAttNo(int foodAttNo) {
		this.foodAttNo = foodAttNo;
	}
	public String getFoodAttName() {
		return foodAttName;
	}
	public void setFoodAttName(String foodAttName) {
		this.foodAttName = foodAttName;
	}
	public String getFoodAttNewName() {
		return foodAttNewName;
	}
	public void setFoodAttNewName(String foodAttNewName) {
		this.foodAttNewName = foodAttNewName;
	}
	public int getFoodAttBbsNo() {
		return foodAttBbsNo;
	}
	public void setFoodAttBbsNo(int foodAttBbsNo) {
		this.foodAttBbsNo = foodAttBbsNo;
	}
	public List<FoodAttachVo> getAttList() {
		return attList;
	}
	public void setAttList(List<FoodAttachVo> attList) {
		this.attList = attList;
	}
	
	public List<MultipartFile> getDeleteAttIds() {
		return deleteAttIds;
	}
	public void setDeleteAttIds(List<MultipartFile> deleteAttIds) {
		this.deleteAttIds = deleteAttIds;
	}
	
	
	
	
}

