package com.springmvc.free;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;
import com.springmvc.food.FoodService;
import com.springmvc.food.FoodVo;
import com.springmvc.foodattach.FoodAttachVo;
import com.springmvc.model.UserVo;

@Controller
public class FreeController {

	@Autowired
	private FreeService freeService;
	
	
	@RequestMapping(path ="/free/list.do",  method = RequestMethod.GET)
	public String list(Model model,FreeVo vo
						,@RequestParam(value = "page",defaultValue ="1" )int page 
						,@RequestParam(value = "size",defaultValue ="10" )int size){
	
		List<FreeVo> pn = freeService.findPn(page,size);
		int totalRecords = freeService.countBbs(); //��ü ���ڵ� ��
		int totalPages = (int) Math.ceil((double) totalRecords / size); //��ü��������
		
		 
		model.addAttribute("pagination",pn);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
	
		
		return "free/list";
		
	}
	
	@RequestMapping(path = "/free/list.do", method = RequestMethod.POST)
	public String list1() {
		return "free/list";
	}
	
	@RequestMapping(path ="/free/select.do", method = RequestMethod.GET)
	public String select(@RequestParam int freeBbsNo,Model model) {
		freeService.incrementViewCount(freeBbsNo); //��ȸ�� ����
		
		/* �Խñ� ��ȣ�� �Խ��� ���� ��ȸ�ϱ� */
		FreeVo sel = freeService.findByNo(freeBbsNo);
		model.addAttribute("bbsinfo",sel);
		
		return "free/select";
	}
	
	@RequestMapping(path ="/free/add.do", method = RequestMethod.GET)
	public String add(HttpSession session, Model model) {
		// �α��� ���� ��������
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        
        // �α����� ����� ������ JSP�� ����
        if (loginUser != null) {
            model.addAttribute("loginUser", loginUser);
        }
        return "free/add";
    }
	
	@RequestMapping(path = "/free/add.do", method = RequestMethod.POST)
	public String add(FreeVo vo, HttpSession session,HttpServletRequest request) { 
		UserVo uvo = (UserVo) session.getAttribute("loginUser");
		vo.setFreeBbsId( uvo.getId() );
		vo.setFreeBbsUser(uvo.getUsername());
		int num = freeService.addBbs(vo); 
		System.out.println(num + "���� �Խñ� �߰�");
		return "redirect:/free/list.do";
	}
	
	@RequestMapping(path = "/free/edit.do", method = RequestMethod.GET)
	public String editform(@RequestParam int freeBbsNo, Model model) {
		FreeVo edf = freeService.findByNo(freeBbsNo);
		model.addAttribute("editform",edf);

		return "free/edit";
	}
	
	@RequestMapping(path = "/free/edit.do", method = RequestMethod.POST)
	public String edit(FreeVo vo) {
	int ef = freeService.updateBbs(vo);
	return "redirect:/free/list.do";
	}
	
	 @RequestMapping(path = "/free/del.do",method = RequestMethod.GET)
	 public String del(@RequestParam int freeBbsNo) { 
		 int dl = freeService.deleteBbs(freeBbsNo);
	return "redirect:/free/list.do"; 
	
	
}
	
}
