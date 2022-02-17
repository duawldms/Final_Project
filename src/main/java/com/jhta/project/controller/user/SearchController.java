package com.jhta.project.controller.user;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.user.InSearchRestaurantVo;
import com.jhta.project.vo.user.UserAddrVo;

@Controller
public class SearchController {
	@Autowired private ServletContext sc;
	@Autowired private SearchService service;
	
	@GetMapping("/user/search")
	public String goSearch(Model model,Principal principal,
			@RequestParam(value="cg_name",defaultValue = "")String cg_name,
			@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="orderby",defaultValue = "")String orderby) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(principal!=null) {
			String ui_id=principal.getName();
			map.put("ui_id", ui_id);
			List<UserAddrVo> list=service.selectAddr(map);
			model.addAttribute("list",list);
		}
		model.addAttribute("category",cg_name);
		model.addAttribute("orderby",orderby);
		model.addAttribute("cglist",service.searchCategory());
		model.addAttribute("main","/WEB-INF/views/search/search.jsp");
		return "layout";
	}
}






