package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.PermissionService;

@Controller
public class PermissionController {
	@Autowired PermissionService service;
	
	@GetMapping("permission/list")
	public String Permission(Model model) {
		model.addAttribute("main","/WEB-INF/views/admin/permission/list.jsp");
		return "permission/list";
	}

}
