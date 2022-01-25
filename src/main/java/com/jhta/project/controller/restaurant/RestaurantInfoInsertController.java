package com.jhta.project.controller.restaurant;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.RestaurantVo;


@Controller
public class RestaurantInfoInsertController {
	@Autowired private RestaurantService service;
	
	@GetMapping("/infoinsert")
	public String RestaurantInfoInsertForm() {
		return "/restaurant/infoinsert";
	}
	@PostMapping("/infoinsert")
	public String RestaurantInfoInsert(RestaurantVo vo,Model model) {
		int n=service.restaurantinfoinsert(vo);
		try {
			model.addAttribute("result","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","success");
		}
		return "/restaurant/restaurantinfo";
	}
	
}
