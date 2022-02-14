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
	public String permissionupdate(Model model,RestaurantVo vo, String r_id) {
		service.update(r_id);
		
		//List<RestaurantVo> list = service.testList();
		//System.out.println("testList:" + list);
		//model.addAttribute("vo",list);
		model.addAttribute("main","/WEB-INF/views/admin/permission/list.jsp");
		return "redirect:/admin/permission/list";
		
	}
		
		

}
