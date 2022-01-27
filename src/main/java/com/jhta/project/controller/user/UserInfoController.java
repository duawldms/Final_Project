package com.jhta.project.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserInfoController {
	
	@GetMapping("/usermypage")
	public String UserPage(Model model){
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";
	}
	
	

}
