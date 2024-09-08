package com.springmvc.foodreply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodReplyServiceImpl implements FoodReplyService {

@Autowired
private FoodReplyDao replyDao;
	
	@Override
	public int add(FoodReplyVo vo) {
		return replyDao.add(vo);
	}
	@Override
	public List<FoodReplyVo> findAll(int foodRepNo) {
		return replyDao.findAll(foodRepNo);
		}
	@Override
	public int del(int foodRepNo) {
		return replyDao.del(foodRepNo);
	}
	@Override
	public int edit(int foodRepNo, String foodRepContent) {
		return replyDao.edit(foodRepNo,foodRepContent);
	}
	
}
