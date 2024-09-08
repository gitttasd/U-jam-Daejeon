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
	//컨트롤러 실행전에 실행되는 메서드
	// 반환값을 통해서. 이후 실행될 핸들러(컨트롤러,인터셉터)의 실행 여부를 결정 가능
	System.out.println("LoginInterceptor:preHandle...");
	
	HttpSession session = request.getSession();
	UserVo uvo = (UserVo)session.getAttribute("loginUser");
	if(uvo==null) { //로그인하지 않는 사용자의 요청
		response.sendRedirect(request.getContextPath()+"/user/login.do");
		return false;
	}	
	 return true;
}
}
