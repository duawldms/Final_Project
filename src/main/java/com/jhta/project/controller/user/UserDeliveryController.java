package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.user.UserService;

@Controller
public class UserDeliveryController {
	@Autowired UserService service;
	
	@GetMapping("/userdelivery")
	public String deliverydetail(String ui_id,Model model) {
		model.addAttribute("mypagemain","/WEB-INF/views/user/DeliveryList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";	
	}

}
