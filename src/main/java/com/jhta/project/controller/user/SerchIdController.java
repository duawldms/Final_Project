package com.jhta.project.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SerchIdController {
	
	@GetMapping("/searchid")
	public String SerchIdForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/user/searchId.jsp");
		return "layout";
	}

}
