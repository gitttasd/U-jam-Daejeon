package com.springmvc.foodreply;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FoodReplyVo {
	private int foodRepNo; //��۹�ȣ
	private String foodRepContent; //��� ����
	private String foodRepWriter;// �ۼ��� ���̵�
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss")
	private Date foodRepDate;// ����Ͻ�
	private int foodRepBbsNo;//�Խñ۹�ȣ
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
