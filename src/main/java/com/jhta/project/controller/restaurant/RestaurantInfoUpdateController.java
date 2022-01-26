package com.jhta.project.controller.restaurant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class RestaurantInfoUpdateController {
	@Autowired
	RestaurantService service;
	@Autowired
	ServletContext sc;

	@GetMapping("/infoupdate")
	public String infoUpdateForm(String r_id, Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/infoupdate.jsp");
		return "restaurant/infoupdate";
	}

	@PostMapping("/infoupdate")
	public String infoupdate(RestaurantVo vo, MultipartFile file1) {
		String path = sc.getRealPath("/resources/img");
		String orgFileName = file1.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		if (file1 != null) {
			vo.setR_img(saveFileName);
		}
		service.addRestaurant(vo);
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "restaurant/restaurantinfo";
	}
}
