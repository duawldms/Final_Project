package com.jhta.project.controller.user;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShowCartController {
	@GetMapping(value="/showcart",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> showCart(Model model,HttpServletRequest request){
		HashMap<String, Object> map=new HashMap<String, Object>();
		model.addAttribute("cartlist", "/WEB-INF/views/search/cartlist.jsp");
		System.out.println("check");
		return map;
	}
}
