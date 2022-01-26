package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.AdminService;

@Controller
public class AdminLoginController {
	@Autowired AdminService service;
	
	@GetMapping("/loginAdmin")
	public String loginForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/admin/login.jsp");
		return "layout";
	}
	@GetMapping("/loginAdminsuccess")
	public String login(Model model){
		model.addAttribute("main","/WEB-INF/views/admin/result.jsp");
		return "layout";
	}

}
