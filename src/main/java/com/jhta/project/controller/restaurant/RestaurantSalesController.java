package com.jhta.project.controller.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class RestaurantSalesController {
	@Autowired RestaurantService service;
	
	@GetMapping("/restaurant/sales")
	public String Sales(Model model) {
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main","/WEB-INF/views/restaurant/sales.jsp");
		return "layout";
	}
}
