package com.jhta.project.controller.user;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserService;

@Controller
public class LoginController {
	@Autowired UserService service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/loginuser")
	public String loginForm(Model model) {
		sc.setAttribute("securityPath", "/loginuser");
		model.addAttribute("main","/WEB-INF/views/user/login.jsp");
		return "layout";
	}
	
	@PostMapping("/loginuser")
	public String loginFail(Model model) {
		model.addAttribute("main","/WEB-INF/views/user/login.jsp");
		return "layout";
	}
	
	@GetMapping("/loginsuccess")
	public String login(Model model){
		//model.addAttribute("main","/WEB-INF/views/user/result.jsp");
		return "home";
	}
	
}
