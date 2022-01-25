package com.jhta.project.controller.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
	
	@GetMapping("/menuadd")
	public String menuadd(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/menuAdd.jsp");
		return "layout";
	}
	
}
