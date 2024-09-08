package com.springmvc.reply;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.springmvc.model.UserVo;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	
	@RequestMapping(path = "/reply/add.do", method= RequestMethod.POST)
	@ResponseBody
		public HashMap<String, Object> add(ReplyVo vo,@SessionAttribute("loginUser")UserVo uvo,
										   HttpSession session){
		vo.setRepWriter(uvo.getUsername());
		int num = replyService.add(vo);		
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("count", num);
		return map;
	}

	@RequestMapping(path ="/reply/list.do" , method = RequestMethod.GET)
	@ResponseBody
		public List<ReplyVo> list(int repBbsNo){
			List<ReplyVo>list = replyService.findAll(repBbsNo);
			return list;
		}
	
	@RequestMapping(path ="/reply/del.do" , method = RequestMethod.GET)
	@ResponseBody
		public HashMap<String,Object> del(int repNo){
			int num = replyService.del(repNo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("count", num);
			return map;
		}
	
	@RequestMapping(path ="/reply/edit.do", method = RequestMethod.GET)
	@ResponseBody
		public HashMap<String,Object> edit(int repNo, String repContent) {
			int num1 = replyService.edit(repNo,repContent);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("count", num1);
			return map;
	}

}
