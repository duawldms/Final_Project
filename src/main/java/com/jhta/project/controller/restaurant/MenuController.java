package com.jhta.project.controller.restaurant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.FoodVo;

@Controller
public class MenuController {
	@Autowired RestaurantService service;
	@Autowired ServletContext sc;
	
	@GetMapping("/restaurant/menuadd")
	public String menuAddForm(Model model, Principal principal) {
		model.addAttribute("r_id", principal.getName());
		model.addAttribute("main", "/WEB-INF/views/restaurant/menuAdd.jsp");
		return "layout";
	}
	
	@PostMapping("/restaurant/menuadd")
	public String menuAdd(FoodVo vo, Model model, MultipartFile file1) {
		try {
			String food_name = new String(StringUtils.cleanPath(vo.getFood_name()).getBytes("8859_1"),"utf-8");
			String food_info = new String(StringUtils.cleanPath(vo.getFood_info()).getBytes("8859_1"),"utf-8");
			vo.setFood_name(food_name);
			vo.setFood_info(food_info);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		System.out.println("vo : " + vo);
		String path = sc.getRealPath("/resources/img");
		System.out.println("경로 : " + path);
		String orgFileName = file1.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		if (file1 != null) {
			vo.setFood_img(saveFileName);
		}
		service.menuAdd(vo);
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("main", "/WEB-INF/views/restaurant/foodList.jsp");
		return "redirect:rayout";
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
