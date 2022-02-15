package com.jhta.project.controller.restaurant;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class SellerDeleteController {
	@Autowired
	RestaurantService service;

	@GetMapping("/restaurant/sellerDelete")
	public String sellerDeleteForm(Model model) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/deletePwdCheck.jsp");
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		return "layout";
	}

	@GetMapping("/restaurant/deleteForm")
	public String sellerDelete(Model model, Principal principal) {
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerDelete.jsp");
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("r_id", principal.getName());
		return "layout";
	}

	@GetMapping("/restaurant/delete")
	public String DeleteResult(Principal principal) {
		service.sellerDelete(principal.getName());
		return "redirect:/restaurant/deleteResult";
	}
	
	@GetMapping("/restaurant/deleteResult")
	public String deleteResult(Model model, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		// success-hendler 무시하고 로그아웃 (get 방식으로 사용할때 사용)
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		model.addAttribute("main", "/WEB-INF/views/restaurant/deleteResult.jsp");
		return "layout";
	}
}
