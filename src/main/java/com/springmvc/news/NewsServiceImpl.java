package com.springmvc.news;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.springmvc.attach.AttachDao;
import com.springmvc.attach.AttachVo;
import com.springmvc.food.FoodVo;
import com.springmvc.reply.ReplyDao;




@Service

public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsDao newsDao;
	

	 @Override public List<NewsVo> findPn(int page, int size) { 
	 
	 int startRow =(page - 1)*size+1; 
	 int endRow = page * size; 
	 List<NewsVo> pn = newsDao.findPn(startRow,endRow); 

	 	return pn;
	 }


	@Override
	public int countBbs() {
		return newsDao.countBbs();
	}


	@Override
	public void incrementViewCount(int newsBbsNo) {
		newsDao.incrementViewCount(newsBbsNo);
		
	}


	@Override
	public NewsVo findByNo(int newsBbsNo) {
		return newsDao.findByNo(newsBbsNo);
	}


	@Override
	public int addBbs(NewsVo vo) {
		return newsDao.addBbs(vo);
	}


	@Override
	public int updateBbs(NewsVo vo) {
		return newsDao.updateBbs(vo);
	}


	@Override
	public int deleteBbs(int newsBbsNo) {
		return newsDao.deleteBbs(newsBbsNo);
	}
	
	
}
