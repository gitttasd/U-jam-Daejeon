package com.springmvc.foodreply;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FoodReplyVo {
	private int foodRepNo; //댓글번호
	private String foodRepContent; //댓글 내용
	private String foodRepWriter;// 작성자 아이디
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss")
	private Date foodRepDate;// 등록일시
	private int foodRepBbsNo;//게시글번호
	private int rating;
	
	public int getFoodRepNo() {
		return foodRepNo;
	}
	public void setFoodRepNo(int foodRepNo) {
		this.foodRepNo = foodRepNo;
	}
	public String getFoodRepContent() {
		return foodRepContent;
	}
	public void setFoodRepContent(String foodRepContent) {
		this.foodRepContent = foodRepContent;
	}
	public String getFoodRepWriter() {
		return foodRepWriter;
	}
	public void setFoodRepWriter(String foodRepWriter) {
		this.foodRepWriter = foodRepWriter;
	}
	public Date getFoodRepDate() {
		return foodRepDate;
	}
	public void setFoodRepDate(Date foodRepDate) {
		this.foodRepDate = foodRepDate;
	}
	public int getFoodRepBbsNo() {
		return foodRepBbsNo;
	}
	public void setFoodRepBbsNo(int foodRepBbsNo) {
		this.foodRepBbsNo = foodRepBbsNo;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
	
	
}
