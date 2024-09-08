package com.springmvc.food;

import java.io.File;
import java.util.List;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;
import com.springmvc.comm.SearchVo;
import com.springmvc.foodattach.FoodAttachVo;

public interface FoodService {

	
	List<FoodVo> findPn(SearchVo searchVo);
	 
	int countBbs(SearchVo searchVo);
	
	int addBbs(FoodVo vo); // 게시글 추가

	List<FoodAttachVo> findattName(int FoodBbsNo);

	void incrementViewCount(int foodBbsNo); //조회수 증가

	FoodVo findByNo(int foodBbsNo); //게시글 번호로 게시글 정보 조회

	int updateBbs(FoodVo vo); // 게시글 수정하기

	int deleteBbs(int foodBbsNo);

	List<FoodVo> findHomeBbs(int end);

	FoodAttachVo findFirstAttachmentByBbsNo(int foodBbsNo);

	Float avgByNo(int foodBbsNo);

	FoodAttachVo findAttach(int foodAttNo);

	File getAttachFile(String foodAttNewName);
	
	
}
