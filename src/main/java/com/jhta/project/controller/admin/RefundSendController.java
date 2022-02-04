package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.RefundService;

@Controller
public class RefundSendController {
	@Autowired private RefundService service;
	
	@GetMapping("/refund/send")
	public String form() {
		return "admin/refund/send";
	}
	
}
