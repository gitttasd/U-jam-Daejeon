package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.dao.UserDao;
import com.springmvc.model.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public List<UserVo> findAll() {
		
		return userDao.findAll();
	}

	@Override
	public UserVo findById(String id) {
		
		return userDao.findById(id);
	}

	@Override
	public int addUser(UserVo vo) {
		
		return userDao.addUser(vo);
	}

	@Override
	public int updateUser(UserVo vo) {
		
		return userDao.updateUser(vo);
	}

	@Override
	public int deleteUser(String id) {

		return userDao.deleteUser(id);
	}

	@Override
	public List<UserVo> findPn(int page, int size) {
	   int StartRow=(page-1)*size+1;
	   int endRow=page*size;
		return userDao.findPn(StartRow,endRow);
	}

	@Override
	public int CountUser() {
		
		return userDao.CountUser();
	}

	@Override
	public boolean checkIdExists(String id) {
		return userDao.checkIdExists(id);
	}
}
	
