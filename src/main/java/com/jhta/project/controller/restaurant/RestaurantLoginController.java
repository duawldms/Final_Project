package com.jhta.project.controller.restaurant;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class RestaurantLoginController {
	@Autowired RestaurantService service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/loginRestaurant")
	public String loginForm(Model model) {
		sc.setAttribute("securityPath", "/loginRestaurant");
		model.addAttribute("main", "/WEB-INF/views/restaurant/login.jsp");
		return "layout";
	}
	
	@PostMapping("/loginRestaurant")
	public String loginFail(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/login.jsp");
		return "layout";
	}
	
	@GetMapping("/loginRestaurantsuccess")
	public String login(Model model){
		model.addAttribute("main","/WEB-INF/views/home.jsp");
		return "layout";
	}
}
