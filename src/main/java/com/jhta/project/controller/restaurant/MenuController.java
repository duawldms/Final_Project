package com.jhta.project.controller.restaurant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
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
	
	@GetMapping("/menuadd")
	public String menuaddForm(Model model, Principal principal) {
		System.out.println("r_id : " + principal.getName());
		model.addAttribute("r_id", principal.getName());
		model.addAttribute("main", "/WEB-INF/views/restaurant/menuAdd.jsp");
		return "layout";
	}
	
	@PostMapping("/menuadd")
	public String menuadd(Model model, FoodVo vo, MultipartFile file1) {
		System.out.println("food_vo : " + vo);
		String food_name;
		try {
			food_name = new String(StringUtils.cleanPath(vo.getFood_name()).getBytes("8859_1"),"utf-8");
			String food_info = new String(StringUtils.cleanPath(vo.getFood_info()).getBytes("8859_1"),"utf-8");
			vo.setFood_name(food_name);
			vo.setFood_info(food_info);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String path = sc.getRealPath("/resources/img");
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
		model.addAttribute("main", "/WEB-INF/views/restaurant/menuAdd.jsp");
		return "redirect:/";
	}
	
}
