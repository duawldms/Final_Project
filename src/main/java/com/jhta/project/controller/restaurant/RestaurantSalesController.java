package com.jhta.project.controller.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class RestaurantSalesController {
	@Autowired RestaurantService service;
	
	@GetMapping("/sales")
	public String Sales(Model model) {
		model.addAttribute("main","/WEB-INF/views/restaurant/sales.jsp");
		return "restaurant/sales";
	}
}