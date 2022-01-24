package com.jhta.project.controller.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RestaurantInsertController {
	
	@GetMapping("/sellerInsert")
	public String sellerCheckFrom(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerInsert.jsp");
		return "layout";
	}
}
