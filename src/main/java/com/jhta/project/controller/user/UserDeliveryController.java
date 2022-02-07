package com.jhta.project.controller.user;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.OrdersVo;

@Controller
public class UserDeliveryController {
	@Autowired UserService service;
	
	@GetMapping("/userdelivery")
	public String deliverydetail(String ui_id,Model model) {
		ArrayList<OrdersVo> list = service.userdelivery(ui_id);
		model.addAttribute("vo",list);
		model.addAttribute("mypagemain","/WEB-INF/views/user/DeliveryList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";	
	}
	@GetMapping("/deliverydelete")
	public String deliverydelete(int or_num,Model model,String ui_id) {
		ArrayList<OrdersVo> list = service.userdelivery(ui_id);
		model.addAttribute("mypagemain","/WEB-INF/views/user/DeliveryList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";	
	}
}
