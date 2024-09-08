package com.springmvc.free;

import java.io.File;
import java.util.List;

import java.sql.Date;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.food.FoodVo;

public interface FreeService {

	List<FreeVo> findPn(int page, int size); /* ������ ���̼� �Խñ� ��ȸ */
	 
	int countBbs(); /* �� �Խñ� ����  */


	FreeVo findByNo(int freeBbsNo); /* �Խñ� ��ȣ�� �Խñ� ���� ��ȸ�ϱ� */

	int addBbs(FreeVo vo);  /* �Խñ� �߰� */

	void incrementViewCount(int freeBbsNo); /* �Խñ� ��ȸ�� ���� */

	int updateBbs(FreeVo vo); /* �Խñ� ������Ʈ */

	int deleteBbs(int freeBbsNo);  /* �Խñ� ����*/
	 	
}
