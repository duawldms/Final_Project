package com.jhta.project.controller.restaurant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.FoodOptionVo;
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
	// 메뉴 등록
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
		return "redirect:/restaurant/sallermypage";
	}
	// 등록한 음식 목록 호출
	@GetMapping("/restaurant/foodList")
	public String categoryList(Model model, Principal principal) {
		List<FoodVo> menuList = service.menuList(principal.getName());
		model.addAttribute("menuList", menuList);
		model.addAttribute("main", "/WEB-INF/views/restaurant/foodList.jsp");
		return "layout";
	}
	
	@GetMapping("/restaurant/optionAdd")
	public String optionAddForm(int food_num, Model model) {
		FoodVo vo = service.getFood(food_num);
		model.addAttribute("vo", vo);
		model.addAttribute("main", "/WEB-INF/views/restaurant/sideOptionAdd.jsp");
		return "layout";
	}
	// 사이드 메뉴 추가
	@PostMapping("/restaurant/optionAdd")
	public String optionAdd(FoodOptionVo vo,@RequestParam HashMap<String, Object> map, Model model) {
        
		service.sideAdd(vo);
        
        int size = (map.size() - 4) / 2;
        for (int i = 1; i <= size; i++) {
        	vo.setFo_name(String.valueOf(map.get("fo_name" + i)));
        	vo.setFo_cost(Integer.valueOf((String)map.get("fo_cost" + i)));
        	service.sideAdd(vo);
        }
		return "redirect:/restaurant/foodList";
	}
	
	@GetMapping("/restaurant/foodEdit")
	public String foodEdit(Model model, Principal principal) {
		List<FoodVo> menuList = service.menuList(principal.getName());
		model.addAttribute("menuList", menuList);
		model.addAttribute("main", "/WEB-INF/views/restaurant/foodEdit.jsp");
		return "layout";
	}
	
}
