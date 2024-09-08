package com.springmvc.comm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.springmvc.model.UserVo;

public class LoginInterceptor implements HandlerInterceptor{

@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	//��Ʈ�ѷ� �������� ����Ǵ� �޼���
	// ��ȯ���� ���ؼ�. ���� ����� �ڵ鷯(��Ʈ�ѷ�,���ͼ���)�� ���� ���θ� ���� ����
	System.out.println("LoginInterceptor:preHandle...");
	
	HttpSession session = request.getSession();
	UserVo uvo = (UserVo)session.getAttribute("loginUser");
	if(uvo==null) { //�α������� �ʴ� ������� ��û
		response.sendRedirect(request.getContextPath()+"/user/login.do");
		return false;
	}	
	 return true;
}
}
