package com.springmvc.free;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.sql.Date;

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

public class FreeServiceImpl implements FreeService {

	@Autowired
	private FreeDao freeDao;
	

	 @Override public List<FreeVo> findPn(int page, int size) { 
	 
	 int startRow =(page - 1)*size+1; 
	 int endRow = page * size; 
	 List<FreeVo> pn = freeDao.findPn(startRow,endRow); 

	 	return pn;
	 }


	@Override
	public int countBbs() {
		return freeDao.countBbs();
	}


	@Override
	public void incrementViewCount(int freeBbsNo) {
		freeDao.incrementViewCount(freeBbsNo);
		
	}


	@Override
	public FreeVo findByNo(int freeBbsNo) {
		return freeDao.findByNo(freeBbsNo);
	}


	@Override
	public int addBbs(FreeVo vo) {
		return freeDao.addBbs(vo);
	}


	@Override
	public int updateBbs(FreeVo vo) {
		return freeDao.updateBbs(vo);
	}


	@Override
	public int deleteBbs(int freeBbsNo) {
		return freeDao.deleteBbs(freeBbsNo);
	}
	
	
}
