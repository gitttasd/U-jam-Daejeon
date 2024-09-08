package com.springmvc.foodreply;

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
public class FoodReplyController {

	@Autowired
	private FoodReplyService foodreplyService;
	
	
	@RequestMapping(path = "/foodreply/add.do", method= RequestMethod.POST)
	@ResponseBody
		public HashMap<String, Object> add(FoodReplyVo vo,@SessionAttribute("loginUser")UserVo uvo, 
										   HttpSession session){
		vo.setFoodRepWriter(uvo.getUsername());
		int num = foodreplyService.add(vo);		
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("count", num);
		return map;
	}

	@RequestMapping(path ="/foodreply/list.do" , method = RequestMethod.GET)
	@ResponseBody
		public List<FoodReplyVo> list(int foodRepBbsNo){
			List<FoodReplyVo>list = foodreplyService.findAll(foodRepBbsNo);
			return list;
		}
	
	@RequestMapping(path ="/foodreply/del.do" , method = RequestMethod.GET)
	@ResponseBody
		public HashMap<String,Object> del(int foodRepNo){
			int num = foodreplyService.del(foodRepNo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("count", num);
			return map;
		}
	
	@RequestMapping(path ="/foodreply/edit.do", method = RequestMethod.GET)
	@ResponseBody
		public HashMap<String,Object> edit(int foodRepNo, String foodRepContent) {
			int num1 = foodreplyService.edit(foodRepNo,foodRepContent);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("count", num1);
			return map;
	}

}
