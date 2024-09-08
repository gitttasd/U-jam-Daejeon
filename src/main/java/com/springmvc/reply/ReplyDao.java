package com.springmvc.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReplyDao {

		int add(ReplyVo vo);

		List<ReplyVo> findAll(int repBbsNo);

		int del(int repNo);

		int edit(@Param("repNo") int repNo,@Param("repContent") String repContent);

		Float avgByNo(int bbsNo);

		Float avgRatingForBbs(int bbsNo);
		

}
