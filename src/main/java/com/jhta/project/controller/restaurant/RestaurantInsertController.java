package com.jhta.project.controller.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class RestaurantInsertController {
	@Autowired RestaurantService service;
	
	@GetMapping("/sellerInsert")
	public String sellerInsertFrom(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerInsert.jsp");
		return "layout";
	}
	
	@PostMapping("/sellerInsert")
	public String sellerInsert(RestaurantVo vo) {
		service.addRestaurant(vo);
		return "redirect:/";
	}
}
