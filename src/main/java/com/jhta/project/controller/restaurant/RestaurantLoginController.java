package com.jhta.project.controller.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class RestaurantLoginController {
	@Autowired RestaurantService service;
	
	@GetMapping("/loginRestaurant")
	public String loginForm(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/login.jsp");
		return "layout";
	}
	
	@GetMapping("/loginRestaurantsuccess")
	public String login(Model model){
		model.addAttribute("main", "/WEB-INF/views/restaurant/result.jsp");
		return "layout";
	}
	
}
