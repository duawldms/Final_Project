package com.jhta.project.controller.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/sample")
	public String sample(Model model) {
		model.addAttribute("main", "/WEB-INF/views/popup/Sample.jsp");
		return "layout";
	}
	
	@GetMapping("/pop")
	public String popup() {
		return "restaurant/jusoPopup";
	}
}
