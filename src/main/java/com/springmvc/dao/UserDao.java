package com.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springmvc.model.UserVo;

@Mapper
public interface UserDao {

	// ��� ����� ���� ��ȸ
    List<UserVo> findAll(); 
    // Ư�� ����� ��ȸ
    UserVo findById(String id);
    
    // ����� �߰�
    int addUser(UserVo vo);
    
    // ����� ���� ����
    int updateUser(UserVo vo);
    
    // ����� ����
    int deleteUser(String id);
	
    List<UserVo> findPn(@Param("StartRow")int StartRow,@Param("endRow")int endRow);
    
    int CountUser();
    
    //id �ߺ�Ȯ��
	boolean checkIdExists(String id); 
}

