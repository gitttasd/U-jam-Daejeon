package com.springmvc.event;

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

public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	

	 @Override public List<EventVo> findPn(int page, int size) { 
	 
	 int startRow =(page - 1)*size+1; 
	 int endRow = page * size; 
	 List<EventVo> pn = eventDao.findPn(startRow,endRow); 

	 	return pn;
	 }


	@Override
	public int countBbs() {
		return eventDao.countBbs();
	}


	@Override
	public void incrementViewCount(int eventBbsNo) {
		eventDao.incrementViewCount(eventBbsNo);
		
	}


	@Override
	public EventVo findByNo(int eventBbsNo) {
		return eventDao.findByNo(eventBbsNo);
	}


	@Override
	public int addBbs(EventVo vo) {
		return eventDao.addBbs(vo);
	}


	@Override
	public int updateBbs(EventVo vo) {
		return eventDao.updateBbs(vo);
	}


	@Override
	public int deleteBbs(int eventBbsNo) {
		return eventDao.deleteBbs(eventBbsNo);
	}
	
	
}
