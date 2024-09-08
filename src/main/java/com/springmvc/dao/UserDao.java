package com.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.model.UserVo;

@Mapper
public interface UserDao {

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
	
    List<UserVo> findPn(@Param("StartRow")int StartRow,@Param("endRow")int endRow);
    
    int CountUser();
    
    //id 중복확인
	boolean checkIdExists(String id); 
}

