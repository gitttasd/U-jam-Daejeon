package com.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.model.UserVo;
import com.springmvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(path = "/user/list.do", method = RequestMethod.GET)
	public String list(Model model,
						@RequestParam(value ="page", defaultValue = "1")int page,
						@RequestParam(value ="size", defaultValue = "10")int size) {

		
		List<UserVo> pn = userService.findPn(page,size);
		int totalRecords =userService.CountUser();
		int totalPages = (int)Math.ceil((double)totalRecords/size);
		
		model.addAttribute("userList",pn);
		model.addAttribute("currnetpage",page);
		model.addAttribute("totalPages",totalPages);
		model.addAttribute("pageSize",size);
		
		return "user/list";
	}
	
	@RequestMapping(path = "/user/page.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {
	    // ���ǿ��� loginUser ��ü�� ������
	    UserVo loginUser = (UserVo) session.getAttribute("loginUser");

	    if (loginUser != null) {
	        // loginUser ��ü���� id ���� ����
	        String id = loginUser.getId();
	        
	        // id ���� �̿��� ����� ������ ������
	        UserVo uvo = userService.findById(id);
	        model.addAttribute("findinfo", uvo);
	    } else {
	        // loginUser�� ���� ��� ó�� (��: �α��� �������� �����̷�Ʈ)
	        return "redirect:/user/login.do";
	    }

	    return "user/mypage";
	}
	
	
	@RequestMapping(path = "/user/select.do", method = RequestMethod.GET)
	public String sel(@RequestParam String id,Model model) {
		UserVo find = userService.findById(id);
		model.addAttribute("findinfo", find);
		return "user/select";
	}
	
	
	
	@RequestMapping(path = "/user/add.do", method = RequestMethod.GET)
	public String add() {
		return "user/add";
	}
	
	@RequestMapping(path = "/user/add.do", method = RequestMethod.POST)
	public String add1(UserVo vo) {
		int num = userService.addUser(vo);
		System.out.println("ȸ������ 1�� �Ϸ�");
		return "redirect:/user/list.do";

	}
	@RequestMapping(path = "/user/edit.do", method = RequestMethod.GET)
	public String upt(@RequestParam String id,Model model) {
		UserVo upt = userService.findById(id);
		model.addAttribute("uptfind", upt);
		return "user/edit";
	}
	
	@RequestMapping(path = "/user/edit.do", method = RequestMethod.POST)
	public String upt1(UserVo vo) {
		int num1 = userService.updateUser(vo);
		System.out.println("ȸ�� ���� �����Ϸ�");
		return "redirect:/home.do";
	}
	@RequestMapping(path = "/user/del.do", method = RequestMethod.POST)
	public String del(@RequestParam String id) {
		int del = userService.deleteUser(id);
		System.out.println("ȸ�� ���� �����Ϸ�");
		return "home";
	}
	
	@RequestMapping(path = "user/login.do",method = RequestMethod.GET)
	public String loginform() {
		return "user/login";
	}
	
	@RequestMapping(path = "/user/login.do",method = RequestMethod.POST)
	public String login(UserVo vo, HttpSession session) {
		UserVo uvo = userService.findById(vo.getId());
		if( uvo != null
		   &&vo.getId().equals(uvo.getId())
		   &&vo.getPassword().equals(uvo.getPassword())
		   ) {session.setAttribute("loginUser", uvo);
		   return "redirect:/home.do";
		
	}
		return "redirect:/user/login.do";

	}
	@RequestMapping(path = "/user/logout.do",method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); /* ������ ��ȿȭ�ϰ� �����ϴ� �޼��� */
		return "redirect:/user/login.do";

	}
	
	/* @GetMapping("/checkId") */
	@RequestMapping(path = "/user/checkId.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestParam("id") String id){
		boolean exists = userService.checkIdExists(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("exists", exists);
        return response;
		
	}
	
	
	
	
}
