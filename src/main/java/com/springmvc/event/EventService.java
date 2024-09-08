package com.springmvc.event;

import java.io.File;
import java.util.List;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.food.FoodVo;

public interface EventService {

	List<EventVo> findPn(int page, int size); /* ������ ���̼� �Խñ� ��ȸ */
	 
	int countBbs(); /* �� �Խñ� ����  */


	EventVo findByNo(int eventBbsNo); /* �Խñ� ��ȣ�� �Խñ� ���� ��ȸ�ϱ� */

	int addBbs(EventVo vo);  /* �Խñ� �߰� */

	void incrementViewCount(int eventBbsNo); /* �Խñ� ��ȸ�� ���� */

	int updateBbs(EventVo vo); /* �Խñ� ������Ʈ */

	int deleteBbs(int eventBbsNo);  /* �Խñ� ����*/
	 	
}
