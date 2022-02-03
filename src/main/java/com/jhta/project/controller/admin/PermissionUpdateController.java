package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.PermissionService;
import com.jhta.project.vo.restaurant.RestaurantVo;


@Controller
public class PermissionUpdateController {
	@Autowired private PermissionService service;
	
	@GetMapping("/permission/update")
	public String update(Model model,String r_id ) {
		RestaurantVo vo=service.detail(r_id);
		model.addAttribute("vo",vo);
		return "admin/permission/list";
		
	}

}
