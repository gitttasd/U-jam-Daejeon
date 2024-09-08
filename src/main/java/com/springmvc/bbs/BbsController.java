package com.springmvc.bbs;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.springmvc.attach.AttachVo;
import com.springmvc.comm.SearchVo;
import com.springmvc.model.UserVo;

@Controller
public class BbsController {

	@Autowired
	private BbsService bbsService;
	
	@RequestMapping(path = "/bbs/list.do", method = RequestMethod.GET)
		public String list(Model model,BbsVo vo,SearchVo searchVo) {
		
		/* ���������̼� �Խñ� ���� ��ȸ */
		List<BbsVo> pn = bbsService.findPn(searchVo);
		searchVo.setTotalRecordCount(bbsService.countBbs(searchVo)); //��ü ���ڵ� ��
		
		for (BbsVo bbs : pn) {
		    List<AttachVo> attList = bbsService.findattName(bbs.getBbsNo());
		    System.out.println("BbsNo: " + bbs.getBbsNo());
		    for (AttachVo att : attList) {
		        System.out.println("AttNo: " + att.getAttNo());
		    }
		    bbs.setAttList(attList);
		}
		 
		 
		model.addAttribute("pagination",pn);

	  
		
		return "bbs/list";
	}
	

	@RequestMapping(path ="/bbs/select.do", method = RequestMethod.GET)
	public String select(@RequestParam int bbsNo,Model model) {
		bbsService.incrementViewCount(bbsNo);//��ȸ�� ����
		
		BbsVo sel = bbsService.findByNo(bbsNo);
		model.addAttribute("bbsinfo",sel);
		
		Float avg = bbsService.avgByNo(bbsNo);
		model.addAttribute("avgRating",avg);
		
		List<AttachVo> att=(List<AttachVo>)bbsService.findattName(bbsNo);
		model.addAttribute("attinfo",att);
		
		
		
		return "bbs/select";
	}
	
	@RequestMapping(path ="/bbs/add.do", method = RequestMethod.GET)
	public String add(HttpSession session, Model model) {
		// �α��� ���� ��������
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        
        // �α����� ����� ������ JSP�� ����
        if (loginUser != null) {
            model.addAttribute("loginUser", loginUser);
        }
        return "bbs/add";
    }
	
	@RequestMapping(path = "/bbs/add.do", method = RequestMethod.POST)
	public String add(BbsVo vo, HttpSession session,HttpServletRequest request) { 
		UserVo uvo = (UserVo) session.getAttribute("loginUser");
		vo.setBbsId( uvo.getId() );
		vo.setBbsUser(uvo.getUsername());
		/* vo.setBbsRegdate(LocalDateTime.now()); */
		int num = bbsService.addBbs(vo); 
		System.out.println(num + "���� �Խñ� �߰�");
		return "redirect:/bbs/list.do";
	}
	
	@RequestMapping(path = "/bbs/edit.do", method = RequestMethod.GET)
	public String editform(@RequestParam int bbsNo, Model model) {
		BbsVo edf = bbsService.findByNo(bbsNo);
		model.addAttribute("editform",edf);
		
		List<AttachVo> att=(List<AttachVo>)bbsService.findattName(bbsNo);
		model.addAttribute("attinfo",att);
		return "bbs/edit";
	}
	
	@RequestMapping(path = "/bbs/edit.do", method = RequestMethod.POST)
	public String edit(BbsVo vo) {
	int ef = bbsService.updateBbs(vo);
	return "redirect:/bbs/list.do";
	}
	
	
	 @RequestMapping(path = "/bbs/del.do",method = RequestMethod.GET)
	 public String del(@RequestParam int bbsNo) { 
		 int dl = bbsService.deleteBbs(bbsNo);
	return "redirect:/bbs/list.do"; }

	
	
	@RequestMapping(path = "/bbs/down.do", method = RequestMethod.GET)
	public void down(@RequestParam int attNo,HttpServletResponse resp) throws FileNotFoundException,IOException {
		AttachVo vo = bbsService.findAttach(attNo);
		File f = bbsService.getAttachFile(vo.getAttNewName());
		resp.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE); //content http ��ſ� ���۵Ǵ� ������ Ÿ�� 
		
		String fname = URLEncoder.encode(vo.getAttName(),"UTF-8").replace("+", "%20");
		resp.setHeader("Content-Disposition", "attacment; filename*=UTF-8''"+fname);
		
		FileCopyUtils.copy(new FileInputStream(f),resp.getOutputStream());
	}
	
	
	
}
