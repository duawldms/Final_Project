package com.jhta.project.controller.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class RestaurantJoinController {
	@Autowired RestaurantService service;
	
	@GetMapping("/joinrestaurant")
	public String insert() {
		return "";
	}
	
}
