package com.springmvc.foodattach;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.attach.AttachVo;


@Mapper
public interface FoodAttachDao {
	
	FoodAttachVo findAttach(int foodAttNo); //������ ÷������ ��ȣ �ѱ��
	
	int add(FoodAttachVo vo);
	
	int delete(int foodAttNo);

	void added(FoodAttachVo avo);

	void adfoodatt(FoodAttachVo avo);
	

	
}
