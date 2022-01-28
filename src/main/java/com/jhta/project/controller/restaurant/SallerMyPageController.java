package com.jhta.project.controller.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class SallerMyPageController {
	@Autowired RestaurantService service;
	
	@GetMapping("/restaurant/sallermypage")
	public String sallermypage(Model model) {
		model.addAttribute("main","/WEB-INF/views/restaurant/sallermypage.jsp");
		return "layout";
	}
}
