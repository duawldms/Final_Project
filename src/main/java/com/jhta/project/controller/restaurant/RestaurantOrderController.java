package com.jhta.project.controller.restaurant;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.MenuUnionVo;
import com.jhta.project.vo.user.OrdersVo;

@Controller
public class RestaurantOrderController {
	@Autowired RestaurantService service;
	
	@GetMapping("/restaurant/orderList")
	public String orderCancelForm(Model model, Principal principal) {
		List<OrdersVo> list = service.getOrders(principal.getName());
		List<MenuUnionVo> menu = service.getMenuUnion(principal.getName());
		model.addAttribute("list", list);
		model.addAttribute("menu", menu);
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/restaurant/orderList.jsp");
		return "layout";
	}
	
	@GetMapping("/restaurant/cancelReason")
	public String cancelReasonForm(Model model, int or_num) {
		model.addAttribute("or_num", or_num);
		return "restaurant/cancelReason";
	}
	
	@PostMapping("/restaurant/cancelReason")
	public String cancelReason(int or_num, String cancel_reason) {
		System.out.println("취소 사유 : " + cancel_reason);
		service.orderCancel(or_num);
		return "redirect:/restaurant/orderList";
	}
	
	@GetMapping("/restaurant/acceptReason")
	public String orderAcceptForm(Model model, int or_num) {
		model.addAttribute("or_num", or_num);
		return "restaurant/orderAccept";
	}
	
	@PostMapping("/restaurant/acceptReason")
	public String orderAccept(int or_num, int or_deltime) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("or_num", or_num);
		map.put("or_deltime", or_deltime);
		service.orderAccept(map);
		return "redirect:/restaurant/orderList";
	}
	
	@GetMapping("/restaurant/deliveryStart")
	public String deliveryStart(int or_num) {
		service.deliveryStart(or_num);
		return "redirect:/restaurant/orderList";
	}
}
