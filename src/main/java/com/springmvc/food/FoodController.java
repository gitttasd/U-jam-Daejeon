package com.springmvc.food;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsVo;
import com.springmvc.comm.SearchVo;
import com.springmvc.foodattach.FoodAttachVo;
import com.springmvc.model.UserVo;

@Controller
public class FoodController {

	@Autowired
	private FoodService foodService;
	
	@RequestMapping(path = "/food/list.do", method = RequestMethod.GET)
	public String list(Model model,FoodVo vo,SearchVo searchVo) {
		
		/* ���������̼� �Խñ� ���� ��ȸ */
		List<FoodVo> pn = foodService.findPn(searchVo);
		searchVo.setTotalRecordCount(foodService.countBbs(searchVo)); //��ü ���ڵ� ��
		
		 for (FoodVo fd : pn) { 
			 List<FoodAttachVo> attList =foodService.findattName(fd.getFoodBbsNo());
			 System.out.println("foodNo: " + fd.getFoodBbsNo());
			 for (FoodAttachVo att : attList) {
			        System.out.println("AttNo: " + att.getFoodAttNo());
			    }
			 fd.setAttList(attList); 
			 }
		
		 
		model.addAttribute("pagination",pn);
	
		
		return "food/list";
	}
	
	@RequestMapping(path ="/food/select.do", method = RequestMethod.GET)
	public String select(@RequestParam int foodBbsNo,Model model) {
		foodService.incrementViewCount(foodBbsNo); //��ȸ�� ����
		
		/* �Խñ� ��ȣ�� �Խ��� ���� ��ȸ�ϱ� */
		FoodVo sel = foodService.findByNo(foodBbsNo);
		model.addAttribute("bbsinfo",sel);
		
		/* �Խñ� ��� ���� ��ȸ�ϱ� */
		Float avg = foodService.avgByNo(foodBbsNo);
		model.addAttribute("avgRating",avg);
		
		/* �Խñ� ��ȣ�� ÷������ ���� ��ȸ�ϱ� */
		List<FoodAttachVo> att=(List<FoodAttachVo>)foodService.findattName(foodBbsNo);
		model.addAttribute("attinfo",att);
		
		return "food/select";
	}
	
	
	
	@RequestMapping(path ="/food/add.do", method = RequestMethod.GET)
	public String add(HttpSession session, Model model) {
		// �α��� ���� ��������
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        
        // �α����� ����� ������ JSP�� ����
        if (loginUser != null) {
            model.addAttribute("loginUser", loginUser);
        }
        return "food/add";
    }
	
	@RequestMapping(path = "/food/add.do", method = RequestMethod.POST)
	public String add(FoodVo vo, HttpSession session,HttpServletRequest request) { 
		UserVo uvo = (UserVo) session.getAttribute("loginUser");
		vo.setFoodBbsId( uvo.getId() );
		vo.setFoodBbsUser(uvo.getUsername());
		vo.setFoodBbsRegdate(LocalDateTime.now());
		int num = foodService.addBbs(vo); 
		System.out.println(num + "���� �Խñ� �߰�");
		return "redirect:/food/list.do";
	}
	
	@RequestMapping(path = "/food/edit.do", method = RequestMethod.GET)
	public String editform(@RequestParam int foodBbsNo, Model model) {
		FoodVo edf = foodService.findByNo(foodBbsNo);
		model.addAttribute("editform",edf);
		
		List<FoodAttachVo> att=(List<FoodAttachVo>)foodService.findattName(foodBbsNo);
		model.addAttribute("attinfo",att);
		return "food/edit";
	}
	
	@RequestMapping(path = "/food/edit.do", method = RequestMethod.POST)
	public String edit(FoodVo vo) {
	int ef = foodService.updateBbs(vo);
	return "redirect:/food/list.do";
	}
	
	 @RequestMapping(path = "/food/del.do",method = RequestMethod.GET)
	 public String del(@RequestParam int foodBbsNo) { 
		 int dl = foodService.deleteBbs(foodBbsNo);
	return "redirect:/food/list.do"; }
	 
	@RequestMapping(path = "/food/down.do", method = RequestMethod.GET)
		public void down(@RequestParam int foodAttNo,HttpServletResponse resp) throws FileNotFoundException,IOException {
			FoodAttachVo vo = foodService.findAttach(foodAttNo);
			File f = foodService.getAttachFile(vo.getFoodAttNewName());
			resp.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE); //content http ��ſ� ���۵Ǵ� ������ Ÿ�� 
			
			String fname = URLEncoder.encode(vo.getFoodAttName(),"UTF-8").replace("+", "%20");
			resp.setHeader("Content-Disposition", "attacment; filename*=UTF-8''"+fname);
			
			FileCopyUtils.copy(new FileInputStream(f),resp.getOutputStream());
		}
	
}
