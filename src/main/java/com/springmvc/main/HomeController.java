package com.springmvc.main;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.attach.AttachVo;
import com.springmvc.bbs.BbsService;
import com.springmvc.bbs.BbsVo;
import com.springmvc.food.FoodService;
import com.springmvc.food.FoodVo;
import com.springmvc.foodattach.FoodAttachVo;


@Controller
public class HomeController {

    @Autowired
    private BbsService bbsService;
    
    @Autowired
    private FoodService foodService;

    @RequestMapping(path = "/home.do", method = RequestMethod.GET)
    public String home(Model model,
                       @RequestParam(value = "end", defaultValue = "6") int end) {
        
        // 관광지 게시글 목록을 조회
        List<BbsVo> bbsList = bbsService.findHomeBbs(end);
        
        // 각  관광지 게시글의 첫 번째 첨부파일을 조회
        List<AttachVo> attList = new ArrayList<>();
        
        for (BbsVo bbs : bbsList) {
            AttachVo att = bbsService.findFirstAttachmentByBbsNo(bbs.getBbsNo());
            if (att != null) {
                attList.add(att);
            }
        }
          
        
     // 맛집 게시글 목록을 조회
        List<FoodVo> foodList = foodService.findHomeBbs(end);
        
        // 각  관광지 게시글의 첫 번째 첨부파일을 조회
        List<FoodAttachVo> foodattList = new ArrayList<>();
        for (FoodVo foodbbs : foodList) {
            FoodAttachVo foodatt = foodService.findFirstAttachmentByBbsNo(foodbbs.getFoodBbsNo());
            if (foodatt != null) {
            	foodattList.add(foodatt);
            }
        }
        
        model.addAttribute("attList", attList);
        model.addAttribute("bbsList", bbsList);
        model.addAttribute("foodattList", foodattList);
        model.addAttribute("foodList", foodList);
        return "home";
    }
}


