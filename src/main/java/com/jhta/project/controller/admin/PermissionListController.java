package com.jhta.project.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.admin.PermissionService;
import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.restaurant.RestaurantVo;
import com.jhta.project.vo.user.ReviewVo;

@Controller
public class PermissionListController {
	@Autowired private PermissionService service;
	
	@RequestMapping("/admin/permission/list")
	public String list(Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<RestaurantVo> list=service.selectList(map);
		
		model.addAttribute("list", list);
		return "admin/permission/list";
	}
		
	}


	


