package com.jhta.project.controller.restaurant;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class MenuController {
	@Autowired RestaurantService service;
	
	@GetMapping("/restaurant/menuadd")
	public String menuadd(Model model, Principal principal) {
		model.addAttribute("r_id", principal.getName());
		model.addAttribute("main", "/WEB-INF/views/restaurant/menuAdd.jsp");
		return "layout";
	}
	
}
