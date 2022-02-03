package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.InSearchRestaurantVo;

@Controller
public class SearchDetailController {
	@Autowired private SearchService service;
	
	@GetMapping("/searchDetail")
	public String searchDetail(String r_id,Double distance,Model model) {
		InSearchRestaurantVo rvo=service.searchDetail(r_id);
		model.addAttribute("rvo",rvo);
		model.addAttribute("distance",distance);
		model.addAttribute("main","/WEB-INF/views/search/searchDetail.jsp");
		return "layout";
	}
}
