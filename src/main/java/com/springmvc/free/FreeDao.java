package com.springmvc.free;

import java.io.File;
import java.util.List;
import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;

@Mapper
public interface FreeDao {

	 List<FreeVo> findPn(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int countBbs();

	int incrementViewCount(int freeBbsNo);

	FreeVo findByNo(int freeBbsNo);

	int addBbs(FreeVo vo);

	int updateBbs(FreeVo vo);

	int deleteBbs(int freeBbsNo);	 
}
