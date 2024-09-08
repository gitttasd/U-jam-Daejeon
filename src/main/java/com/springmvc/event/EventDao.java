package com.springmvc.event;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;

@Mapper
public interface EventDao {

	 List<EventVo> findPn(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int countBbs();

	int incrementViewCount(int freeBbsNo);

	EventVo findByNo(int freeBbsNo);

	int addBbs(EventVo vo);

	int updateBbs(EventVo vo);

	int deleteBbs(int freeBbsNo);	 
}
