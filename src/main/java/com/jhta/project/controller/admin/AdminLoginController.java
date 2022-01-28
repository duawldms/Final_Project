package com.jhta.project.controller.admin;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.admin.AdminService;

@Controller
public class AdminLoginController {
	@Autowired AdminService service;
	@Autowired ServletContext sc;
	
	@GetMapping("/loginAdmin")
	public String loginForm(Model model) {
		sc.setAttribute("securityPath", "/loginAdmin");
		model.addAttribute("main","/WEB-INF/views/admin/login.jsp");
		return "layout";
	}
	@PostMapping("/loginAdmin")
	public String loginFail(Model model) {
		model.addAttribute("main","/WEB-INF/views/admin/login.jsp");
		return "layout";
	}
	@GetMapping("/loginAdminsuccess")
	public String login(Model model){
		model.addAttribute("main","/WEB-INF/views/admin/result.jsp");
		return "layout";
	}

}
