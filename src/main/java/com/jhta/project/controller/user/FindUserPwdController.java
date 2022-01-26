package com.jhta.project.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindUserPwdController {
	
	@GetMapping("/FindUserPwd")
	public String FindUserPwdForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/FindUserPwd.jsp");
		return "layout";
	}

}
