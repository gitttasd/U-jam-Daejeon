package com.springmvc.bbs;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;
import com.springmvc.comm.SearchVo;

@Mapper
public interface BbsDao {
	
	/* List<BbsVo> findAll(); */

	
	 List<BbsVo> findPn(SearchVo searchvo);
	 
	  int countBbs();
	

    BbsVo findByNo(int bbsNo);
    
    int addBbs(BbsVo vo);
    
    int updateBbs(BbsVo vo);
    
    int deleteBbs(int bbsNo);

	int incrementViewCount(int bbsNo);

	List<AttachVo> findattName(int bbsNo);

	List<BbsVo> findHomeBbs(int end);

	AttachVo findFirstAttachmentByBbsNo(int bbsNo);

	List<BbsVo> findAll(SearchVo searchVo);
	

	/* BbsVo findById(String id); */
}
