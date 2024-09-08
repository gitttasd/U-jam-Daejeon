package com.springmvc.attach;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;


@Mapper
public interface AttachDao {
	
	AttachVo findAttach(int attNo);
	
	int add(AttachVo vo);
	
	int adfoodatt(AttachVo vo);

	int delete(int attNo);

	void added(AttachVo avo);

	List<AttachVo> findHomeAtt(@Param("start")int start, @Param("end") int end);

	List<AttachVo> findattName(int bbsNo);
	
}
