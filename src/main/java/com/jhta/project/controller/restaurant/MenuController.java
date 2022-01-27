package com.jhta.project.controller.restaurant;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.FoodVo;

@Controller
public class MenuController {
	@Autowired RestaurantService service;
	@Autowired ServletContext sc;
	
	@GetMapping("/restaurant/menuadd")
	public String menuadd(Model model, Principal principal) {
		model.addAttribute("r_id", principal.getName());
		model.addAttribute("main", "/WEB-INF/views/restaurant/menuAdd.jsp");
		return "layout";
	}
	
	@GetMapping("/restaurant/foodList")
	public String foodList(Model model, Principal principal) {
		List<FoodVo> menuList = service.menuList(principal.getName());
		menuList.forEach(a -> System.out.print(a));
//		String imgPath = sc.getRealPath("/resources/img");
//		String path = imgPath.replace("\\", "/");
//		model.addAttribute("imgPath", path);
		model.addAttribute("menuList", menuList);
		model.addAttribute("main", "/WEB-INF/views/restaurant/foodList.jsp");
		return "layout";
	}
	
	@GetMapping("/restaurant/optionAdd")
	public String optionAdd(int food_num, Model model) {
		FoodVo vo = service.getFood(food_num);
		model.addAttribute("vo", vo);
		model.addAttribute("main", "/WEB-INF/views/restaurant/optionAdd.jsp");
		return "layout";
	}
	
	
	
}
