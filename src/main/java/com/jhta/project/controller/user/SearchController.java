package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchController {
	
	@GetMapping("/search")
	public String goSearch(Model model) {
		model.addAttribute("main","/WEB-INF/views/search/search.jsp");
		return "layout";
	}
}
