package com.springmvc.foodreply;

import java.util.List;

import org.springframework.stereotype.Service;


public interface FoodReplyService {
	
	int add(FoodReplyVo vo);

	List<FoodReplyVo> findAll(int foodRepBbsNo);

	int del(int foodRepNo);

	int edit(int foodRepNo, String foodRepContent);
	


}
