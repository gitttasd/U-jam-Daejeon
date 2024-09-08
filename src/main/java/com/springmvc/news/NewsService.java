package com.springmvc.news;

import java.io.File;
import java.util.List;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.food.FoodVo;

public interface NewsService {

	List<NewsVo> findPn(int page, int size); /* 페이지 네이션 게시글 조회 */
	 
	int countBbs(); /* 총 게시글 개수  */


	NewsVo findByNo(int newsBbsNo); /* 게시글 번호로 게시글 정보 조회하기 */

	int addBbs(NewsVo vo);  /* 게시글 추가 */

	void incrementViewCount(int newsBbsNo); /* 게시글 조회수 증가 */

	int updateBbs(NewsVo vo); /* 게시글 업데이트 */

	int deleteBbs(int newsBbsNo);  /* 게시글 삭제*/
	 	
}
