package com.springmvc.foodreply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FoodReplyDao {

		int add(FoodReplyVo vo);

		List<FoodReplyVo> findAll(int foodRepBbsNo);

		int del(int foodRepNo);

		int edit(@Param("foodRepNo") int foodRepNo,@Param("foodRepContent") String foodRepContent);

		Float avgRatingForFood(int foodBbsNo);

		Float avgByNo(int foodBbsNo);

}
