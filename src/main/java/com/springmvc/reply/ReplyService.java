package com.springmvc.reply;

import java.util.List;

import org.springframework.stereotype.Service;


public interface ReplyService {
	
	int add(ReplyVo vo);

	List<ReplyVo> findAll(int repBbsNo);

	int del(int repNo);

	int edit(int repNo, String repContent);
	


}
