package com.springmvc.bbs;

import java.io.File;
import java.util.List;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachVo;
import com.springmvc.comm.SearchVo;

public interface BbsService {

	
	List<BbsVo> findPn(SearchVo searchVo);
	 
	int countBbs(SearchVo searchVo);
	 
	
	BbsVo findByNo(int BbsNo);
    
    int addBbs(BbsVo vo);
    
    int updateBbs(BbsVo vo);
    
	int deleteBbs(int bbsNo);
    

	void incrementViewCount(int bbsNo);

	List<AttachVo> findattName(int bbsNo);
		
    AttachVo findAttach(int attNo);
	
    File getAttachFile(String attNewName);


	//home에 사용할 게시글 정보 조회
	List<BbsVo> findHomeBbs(int end);

	AttachVo findFirstAttachmentByBbsNo(int bbsNo);

	Float avgByNo(int bbsNo);

	List<BbsVo> findAll(SearchVo searchVo);

	
}
