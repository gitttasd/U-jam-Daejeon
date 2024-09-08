package com.springmvc.service;

import java.util.List;

import com.springmvc.model.UserVo;


public interface UserService {

	// 모든 사용자 정보 조회
    List<UserVo> findAll();
    
    // 특정 사용자 조회
    UserVo findById(String id);
    
    // 사용자 추가
    int addUser(UserVo vo);
    
    // 사용자 정보 수정
    int updateUser(UserVo vo);
    
    // 사용자 삭제
    int deleteUser(String id);

	List<UserVo> findPn(int page, int size);

	int CountUser();

	boolean checkIdExists(String id);
}
