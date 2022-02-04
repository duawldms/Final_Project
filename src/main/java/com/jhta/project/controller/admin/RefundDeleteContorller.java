package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.RefundService;

@Controller
public class RefundDeleteContorller {
	@Autowired private RefundService service;
	
	@GetMapping("/refund/delete")
	public String delete(int or_num) {
		service.delete(or_num);
		return "redirect:/admin/refund/list";
	}
}
