package com.springmvc.event;

import java.time.LocalDateTime;
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
public class EventController {

	@Autowired
	private EventService eventService;
	
	
	@RequestMapping(path ="/event/list.do",  method = RequestMethod.GET)
	public String list(Model model,EventVo vo
						,@RequestParam(value = "page",defaultValue ="1" )int page 
						,@RequestParam(value = "size",defaultValue ="10" )int size){
	
		List<EventVo> pn = eventService.findPn(page,size);
		int totalRecords = eventService.countBbs(); //��ü ���ڵ� ��
		int totalPages = (int) Math.ceil((double) totalRecords / size); //��ü��������
		
		 
		model.addAttribute("pagination",pn);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
	
		
		return "event/list";
		
	}
	
	@RequestMapping(path = "/event/list.do", method = RequestMethod.POST)
	public String list1() {
		return "event/list";
	}
	
	@RequestMapping(path ="/event/select.do", method = RequestMethod.GET)
	public String select(@RequestParam int eventBbsNo,Model model) {
		eventService.incrementViewCount(eventBbsNo); //��ȸ�� ����
		
		/* �Խñ� ��ȣ�� �Խ��� ���� ��ȸ�ϱ� */
		EventVo sel = eventService.findByNo(eventBbsNo);
		model.addAttribute("bbsinfo",sel);
		
		return "event/select";
	}
	
	@RequestMapping(path ="/event/add.do", method = RequestMethod.GET)
	public String add(HttpSession session, Model model) {
		// �α��� ���� ��������
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        
        // �α����� ����� ������ JSP�� ����
        if (loginUser != null) {
            model.addAttribute("loginUser", loginUser);
        }
        return "event/add";
    }
	
	@RequestMapping(path = "/event/add.do", method = RequestMethod.POST)
	public String add(EventVo vo, HttpSession session,HttpServletRequest request) { 
		UserVo uvo = (UserVo) session.getAttribute("loginUser");
		vo.setEventBbsId( uvo.getId() );
		vo.setEventBbsUser(uvo.getUsername());
		int num = eventService.addBbs(vo); 
		System.out.println(num + "���� �Խñ� �߰�");
		return "redirect:/event/list.do";
	}
	
	@RequestMapping(path = "/event/edit.do", method = RequestMethod.GET)
	public String editform(@RequestParam int eventBbsNo, Model model) {
		EventVo edf = eventService.findByNo(eventBbsNo);
		model.addAttribute("editform",edf);

		return "event/edit";
	}
	
	@RequestMapping(path = "/event/edit.do", method = RequestMethod.POST)
	public String edit(EventVo vo) {
	int ef = eventService.updateBbs(vo);
	return "redirect:/event/list.do";
	}
	
	 @RequestMapping(path = "/event/del.do",method = RequestMethod.GET)
	 public String del(@RequestParam int eventBbsNo) { 
		 int dl = eventService.deleteBbs(eventBbsNo);
	return "redirect:/event/list.do"; 
	
	
}
	
}
