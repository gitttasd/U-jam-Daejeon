package com.springmvc.event;

import java.io.File;
import java.util.List;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.food.FoodVo;

public interface EventService {

	List<EventVo> findPn(int page, int size); /* 페이지 네이션 게시글 조회 */
	 
	int countBbs(); /* 총 게시글 개수  */


	EventVo findByNo(int eventBbsNo); /* 게시글 번호로 게시글 정보 조회하기 */

	int addBbs(EventVo vo);  /* 게시글 추가 */

	void incrementViewCount(int eventBbsNo); /* 게시글 조회수 증가 */

	int updateBbs(EventVo vo); /* 게시글 업데이트 */

	int deleteBbs(int eventBbsNo);  /* 게시글 삭제*/
	 	
}
