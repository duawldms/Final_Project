package com.jhta.project.controller.restaurant;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.OrderCancelVo;
import com.jhta.project.vo.user.OrdersVo;

@Controller
public class RestaurantOrderController {
	@Autowired RestaurantService service;
	
	@GetMapping("/restaurant/orderCancel")
	public String orderCancelForm(Model model) {
		List<OrderCancelVo> list = service.orderCancel();
		List<OrdersVo> list2 = service.getOrders();
		list.forEach((a) -> System.out.println("취소 내역 : " + a));
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("main", "/WEB-INF/views/restaurant/orderCancel.jsp");
		return "layout";
	}
}
