package com.jhta.project.controller.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SellerCheckController {
	
	@GetMapping("/sellerCheck")
	public String sellerCheck(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerCheck.jsp");
		return "layout";
	}
	
	@GetMapping("/sellerIdFind")
	public String sellerIdFind(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerIdFind.jsp");
		return "layout";
	}
	
	@GetMapping("/sellerPwdFind")
	public String sellerPwdFind(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerPwdFind.jsp");
		return "layout";
	}
}
