package com.jhta.project.controller.admin;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.AdminService;

@Controller
public class AdminPageController {
	@Autowired AdminService service;
	
	@GetMapping("/admin/adminpage")
	public String AdminPage(Model model, Principal principal) {
		System.out.println("aa" + principal.getName()); // grant auth :권환을 얻어오는
		int n=service.selectadmin(principal.getName()); //허용된 사용자의 이름을 얻어오는 메소드
		model.addAttribute("n",n);
		System.out.println(n);
		model.addAttribute("main","/WEB-INF/views/admin/adminpage.jsp");
		return "admin/adminpage";
	}



}
