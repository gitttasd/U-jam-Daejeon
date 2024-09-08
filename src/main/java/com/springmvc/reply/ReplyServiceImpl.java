package com.springmvc.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

@Autowired
private ReplyDao replyDao;
	
	@Override
	public int add(ReplyVo vo) {
		return replyDao.add(vo);
	}
	@Override
	public List<ReplyVo> findAll(int repBbsNo) {
		return replyDao.findAll(repBbsNo);
		}
	@Override
	public int del(int repNo) {
		return replyDao.del(repNo);
	}
	@Override
	public int edit(int repNo, String repContent) {
		return replyDao.edit(repNo,repContent);
	}
	
}
