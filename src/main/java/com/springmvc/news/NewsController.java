package com.springmvc.news;

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
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	
	@RequestMapping(path ="/news/list.do",  method = RequestMethod.GET)
	public String list(Model model,NewsVo vo
						,@RequestParam(value = "page",defaultValue ="1" )int page 
						,@RequestParam(value = "size",defaultValue ="10" )int size){
	
		List<NewsVo> pn = newsService.findPn(page,size);
		int totalRecords = newsService.countBbs(); //��ü ���ڵ� ��
		int totalPages = (int) Math.ceil((double) totalRecords / size); //��ü��������
		
		 
		model.addAttribute("pagination",pn);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
	
		
		return "news/list";
		
	}
	
	@RequestMapping(path = "/news/list.do", method = RequestMethod.POST)
	public String list1() {
		return "news/list";
	}
	
	@RequestMapping(path ="/news/select.do", method = RequestMethod.GET)
	public String select(@RequestParam int newsBbsNo,Model model) {
		newsService.incrementViewCount(newsBbsNo); //��ȸ�� ����
		
		/* �Խñ� ��ȣ�� �Խ��� ���� ��ȸ�ϱ� */
		NewsVo sel = newsService.findByNo(newsBbsNo);
		model.addAttribute("bbsinfo",sel);
		
		return "news/select";
	}
	
	@RequestMapping(path ="/news/add.do", method = RequestMethod.GET)
	public String add(HttpSession session, Model model) {
		// �α��� ���� ��������
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        
        // �α����� ����� ������ JSP�� ����
        if (loginUser != null) {
            model.addAttribute("loginUser", loginUser);
        }
        return "news/add";
    }
	
	@RequestMapping(path = "/news/add.do", method = RequestMethod.POST)
	public String add(NewsVo vo, HttpSession session,HttpServletRequest request) { 
		UserVo uvo = (UserVo) session.getAttribute("loginUser");
		vo.setNewsBbsId( uvo.getId() );
		vo.setNewsBbsUser(uvo.getUsername());
		int num = newsService.addBbs(vo); 
		System.out.println(num + "���� �Խñ� �߰�");
		return "redirect:/news/list.do";
	}
	
	@RequestMapping(path = "/news/edit.do", method = RequestMethod.GET)
	public String editform(@RequestParam int newsBbsNo, Model model) {
		NewsVo edf = newsService.findByNo(newsBbsNo);
		model.addAttribute("editform",edf);

		return "news/edit";
	}
	
	@RequestMapping(path = "/news/edit.do", method = RequestMethod.POST)
	public String edit(NewsVo vo) {
	int ef = newsService.updateBbs(vo);
	return "redirect:/news/list.do";
	}
	
	 @RequestMapping(path = "/news/del.do",method = RequestMethod.GET)
	 public String del(@RequestParam int newsBbsNo) { 
		 int dl = newsService.deleteBbs(newsBbsNo);
	return "redirect:/news/list.do"; 
	
	
}
	
}
