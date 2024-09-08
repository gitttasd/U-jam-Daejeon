package com.springmvc.news;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;

@Mapper
public interface NewsDao {

	 List<NewsVo> findPn(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int countBbs();

	int incrementViewCount(int newsBbsNo);

	NewsVo findByNo(int newsBbsNo);

	int addBbs(NewsVo vo);

	int updateBbs(NewsVo vo);

	int deleteBbs(int newsBbsNo);	 
}
