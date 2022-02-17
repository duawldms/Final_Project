package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.jhta.project.service.user.ReviewService;
import com.jhta.project.vo.user.OrderReviewVo;
import com.jhta.project.vo.user.OrdersVo;


@Controller
public class ReviewController {
	@Autowired ReviewService service;
	
	@GetMapping("/userreview")
	public String Review(Model model,Principal principal) {
		List<OrderReviewVo> vo=service.orderReview();
		List<OrdersVo> vo1=service.orderList();
		model.addAttribute("vo",vo);
		model.addAttribute("vo1",vo1);
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/user/review.jsp");
		return "layout";
	}
}
