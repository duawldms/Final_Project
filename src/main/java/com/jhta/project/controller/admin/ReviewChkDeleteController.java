package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.ReviewChkService;

@Controller
public class ReviewChkDeleteController {
	@Autowired private ReviewChkService service;
	
	@GetMapping("/reviewchk/delete")
	public String delete(int re_num) {
		service.delete(re_num);
		return "redirect:/admin/reviewchk/list";
	}
	

}
