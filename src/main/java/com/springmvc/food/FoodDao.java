package com.springmvc.food;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;
import com.springmvc.comm.SearchVo;
import com.springmvc.foodattach.FoodAttachVo;

@Mapper
public interface FoodDao {
	
	
	List<FoodVo> findPn(SearchVo searchVo);
	 
	int countBbs();

	List<FoodAttachVo> findattName(int FoodBbsNo);
	  
	int addBbs(FoodVo vo);

	int incrementViewCount(int foodBbsNo);

	FoodVo findByNo(int foodBbsNo);

	int updateBbs(FoodVo vo); // 게시글 수정

	int deleteBbs(int foodBbsNo); //게시글 삭제

	List<FoodVo> findHomeBbs(int end);

	FoodAttachVo findFirstAttachmentByBbsNo(int foodBbsNo);
	

	}
	

