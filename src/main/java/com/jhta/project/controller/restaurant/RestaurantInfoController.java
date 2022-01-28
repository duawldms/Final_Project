package com.jhta.project.controller.restaurant;

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
	public String restaurantinfo(String r_id,Model model) {
		//System.out.println("cc"+r_id);
		List<RestaurantVo> list=service.restaurantinfo(r_id);
		//System.out.println("aa"+list);
		model.addAttribute("list",list);
		model.addAttribute("main","/WEB-INF/views/restaurant/restaurantinfo.jsp");
		return "layout";
	}
}
