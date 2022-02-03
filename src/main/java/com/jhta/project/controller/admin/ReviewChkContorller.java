package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.ReviewChkService;

@Controller
public class ReviewChkContorller {
	@Autowired ReviewChkService service;
	
	@GetMapping("/reviewchk/list")
	public String ReviewChk(Model model) {
		model.addAttribute("main","/WEB-INF/views/admin/reviewchk/list.jsp");
		return "/reviewchk/list";
	}

}
