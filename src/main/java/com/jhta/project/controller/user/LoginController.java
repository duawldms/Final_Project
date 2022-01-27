package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.jhta.project.service.user.UserService;

@Controller
public class LoginController {
	@Autowired UserService service;
	
	@GetMapping("/loginuser")
	public String loginForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/user/login.jsp");
		model.addAttribute("result","아이디 또는 비밀번호를 확인해 주세요");
		return "layout";
	}
	
	@GetMapping("/loginsuccess")
	public String login(Model model){
		//model.addAttribute("main","/WEB-INF/views/user/result.jsp");
		return "home";
	}
	
}
