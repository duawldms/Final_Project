package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.user.SearchService;

@Controller
public class GoPurSuccessPageController {
	@Autowired SearchService service;
	
	@GetMapping("/user/purchase/success")
	public String purchaseSuccess(Model model,int or_num) {
		model.addAttribute("or_num",or_num);
		model.addAttribute("main","/WEB-INF/views/search/purchaseResult.jsp");
		return "layout";
	}
}
