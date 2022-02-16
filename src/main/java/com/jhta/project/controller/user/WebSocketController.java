package com.jhta.project.controller.user;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebSocketController {
	
	@GetMapping("/user/chat")
	public String chat(Model model) {
		model.addAttribute("main","/WEB-INF/views/chat.jsp");
		return "layout";
	}
}
