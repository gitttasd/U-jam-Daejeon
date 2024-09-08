package com.springmvc.news;

import java.io.File;
import java.util.List;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.food.FoodVo;

public interface NewsService {

	List<NewsVo> findPn(int page, int size); /* ������ ���̼� �Խñ� ��ȸ */
	 
	int countBbs(); /* �� �Խñ� ����  */


	NewsVo findByNo(int newsBbsNo); /* �Խñ� ��ȣ�� �Խñ� ���� ��ȸ�ϱ� */

	int addBbs(NewsVo vo);  /* �Խñ� �߰� */

	void incrementViewCount(int newsBbsNo); /* �Խñ� ��ȸ�� ���� */

	int updateBbs(NewsVo vo); /* �Խñ� ������Ʈ */

	int deleteBbs(int newsBbsNo);  /* �Խñ� ����*/
	 	
}
