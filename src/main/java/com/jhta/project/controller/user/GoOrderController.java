package com.jhta.project.controller.user;

import java.io.IOException;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.CartFoodVo;

@Controller
public class GoOrderController {
	@Autowired private SearchService service;
	
	@GetMapping("/user/order")
	public String goOrder(Model model,HttpServletRequest req, HttpServletResponse resp,Principal principal,int delcost) throws IOException {
		Cookie[] cookies=req.getCookies();
		String coordx="";
		String coordy="";
		for(Cookie c:cookies) {
			if(c.getName().equals("coordx")) {
				coordx=URLDecoder.decode(c.getValue(),"utf-8");
			}else if(c.getName().equals("coordy")) {
				coordy=URLDecoder.decode(c.getValue(),"utf-8");
			}
		}
		String r_id=service.getCartRid(principal.getName());
		List<CartFoodVo> cflist=service.selectFood(principal.getName());
		model.addAttribute("delcost",delcost);
		model.addAttribute("cflist",cflist);
		model.addAttribute("r_id",r_id);
		model.addAttribute("coordx",coordx);
		model.addAttribute("coordy",coordy);
		model.addAttribute("main","/WEB-INF/views/search/Orders.jsp");
		return "layout";
	}
}










