package com.springmvc.service;

import java.util.List;

import com.springmvc.model.UserVo;


public interface UserService {

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

	List<UserVo> findPn(int page, int size);

	int CountUser();

	boolean checkIdExists(String id);
}
