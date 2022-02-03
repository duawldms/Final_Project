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
import com.jhta.project.vo.restaurant.MainSideVo;

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
	// 메뉴 등록
	@PostMapping("/restaurant/menuadd")
	public String menuAdd(FoodVo vo, Model model, MultipartFile file1) {
		try {
			String food_name = new String(StringUtils.cleanPath(vo.getFood_name()).getBytes("8859_1"),"utf-8");
			String food_info = new String(StringUtils.cleanPath(vo.getFood_info()).getBytes("8859_1"),"utf-8");
			String food_category = new String(StringUtils.cleanPath(vo.getFood_category()).getBytes("8859_1"),"utf-8");
			vo.setFood_name(food_name);
			vo.setFood_info(food_info);
			vo.setFood_category(food_category);
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
	// 등록한 음식 목록 호출
	@GetMapping("/restaurant/foodList")
	public String categoryList(Model model, Principal principal) {
		List<FoodVo> menuList = service.menuList(principal.getName());
		List<FoodVo> categoryList = service.catrgoryList(principal.getName());
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("main", "/WEB-INF/views/restaurant/foodList.jsp");
		return "layout";
	}
	
	@GetMapping("/restaurant/mainOptionAdd")
	public String mainOptionAddForm(Model model, String food_category) {
		model.addAttribute("food_category", food_category);
		return "restaurant/mainOptionAdd";
	}
	// 메인 사이드 메뉴 추가
	@PostMapping("/restaurant/mainOptionAdd")
	public void mainOptionAdd(MainSideVo vo, Principal principal) {
		vo.setR_id(principal.getName());
		System.out.println("메인 사이드 : " + vo);
		service.MainSideAdd(vo);
	}
	// 사이드 메뉴 추가
	@GetMapping("/restaurant/sideOptionAdd")
	public String optionAdd(int food_num, Model model) {
		FoodVo vo = service.getFood(food_num);
		model.addAttribute("vo", vo);
//		model.addAttribute("main", "/WEB-INF/views/restaurant/optionAdd.jsp");
		return "restaurant/sideOptionAdd";
	}
	@GetMapping("/restaurant/foodEdit")
	public String foodEdit(Model model, Principal principal) {
		List<FoodVo> menuList = service.menuList(principal.getName());
		List<FoodVo> categoryList = service.catrgoryList(principal.getName());
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("main", "/WEB-INF/views/restaurant/foodEdit.jsp");
		return "layout";
	}
	
}
