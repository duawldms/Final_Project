package com.jhta.project.controller.restaurant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ctc.wstx.util.StringUtil;
import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.CategoryVo;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class RestaurantInsertController {
	@Autowired RestaurantService service;
	@Autowired ServletContext sc;
	
	@GetMapping("/sellerInsert")
	public String sellerInsertFrom(Model model) {
		List<CategoryVo> list = service.getCategory();
		model.addAttribute("list", list);
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerInsert.jsp");
		return "layout";
	}
	
	@PostMapping("/sellerInsert")
	public String sellerInsert(RestaurantVo vo, MultipartFile file1, HttpServletRequest req) {
		// multipart/form-data 한글 깨짐 처리 UTF-8 인코딩 코드
		
		try {
			String r_name = new String(StringUtils.cleanPath(vo.getR_name()).getBytes("8859_1"),"utf-8");
			String cg_name = new String(StringUtils.cleanPath(vo.getCg_name()).getBytes("8859_1"),"utf-8");
			String r_addr = new String(StringUtils.cleanPath(vo.getR_addr()).getBytes("8859_1"),"utf-8");
			String r_info = new String(StringUtils.cleanPath(vo.getR_info()).getBytes("8859_1"),"utf-8");
			vo.setCg_name(cg_name);
			vo.setR_name(r_name);
			vo.setR_addr(r_addr);
			vo.setR_info(r_info);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		System.out.println("vo : " + vo);
		String path = sc.getRealPath("/resources/img");
		System.out.println("경로 : " + path);
		String orgFileName = file1.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		if (!file1.isEmpty()) {
			vo.setR_img(saveFileName);
		}
		service.addRestaurant(vo);
		HttpSession session = req.getSession();
		session.removeAttribute("authKey");
		session.removeAttribute("r_email");
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
}
