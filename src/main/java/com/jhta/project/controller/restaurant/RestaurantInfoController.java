package com.jhta.project.controller.restaurant;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class RestaurantInfoController {
	@Autowired RestaurantService service;
	
	@GetMapping("/restaurant/restaurantinfo")
	public String restaurantinfo(Model model,Principal p) {
		RestaurantVo vo=service.idCheck(p.getName());
		//System.out.println("cc"+r_id);
		List<RestaurantVo> list=service.restaurantinfo(p.getName());
		//System.out.println("aa"+list);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main","/WEB-INF/views/restaurant/restaurantinfo.jsp");
		return "layout";
	}
}
