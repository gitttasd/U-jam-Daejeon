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
	
	int addBbs(FoodVo vo); // �Խñ� �߰�

	List<FoodAttachVo> findattName(int FoodBbsNo);

	void incrementViewCount(int foodBbsNo); //��ȸ�� ����

	FoodVo findByNo(int foodBbsNo); //�Խñ� ��ȣ�� �Խñ� ���� ��ȸ

	int updateBbs(FoodVo vo); // �Խñ� �����ϱ�

	int deleteBbs(int foodBbsNo);

	List<FoodVo> findHomeBbs(int end);

	FoodAttachVo findFirstAttachmentByBbsNo(int foodBbsNo);

	Float avgByNo(int foodBbsNo);

	FoodAttachVo findAttach(int foodAttNo);

	File getAttachFile(String foodAttNewName);
	
	
}
