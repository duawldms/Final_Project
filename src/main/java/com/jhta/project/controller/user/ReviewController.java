package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.jhta.project.service.user.ReviewService;
import com.jhta.project.vo.user.OrdersVo;
import com.jhta.project.vo.user.ReviewVo;


@Controller
public class ReviewController {
	@Autowired ReviewService service;

	@GetMapping("/userreview")
	public String Review(Model model,Principal principal) {
		HashMap<String,Object>map=new HashMap<String,Object>();
		List<OrdersVo> before=new ArrayList<OrdersVo>();
		List<OrdersVo> after=new ArrayList<OrdersVo>();
		List<OrdersVo> vo1=service.orderList(principal.getName());
		List<Integer> count=new ArrayList<Integer>();
		
		int n=0;
		//리뷰안쓴거 불러오기
		 for(int i=0;i<vo1.size();i++) {
			n=vo1.get(i).getOr_num();
			map.put("or_num", n);
			map.put("re_num", "is null");
			List<OrdersVo> list1=service.orderList1(map);
			if(list1.size()!=0) {
				OrdersVo vo2=list1.get(0);
				Integer maincount=service.maincount(n);
				vo2.setCount(maincount);
				count.add(maincount);
				before.add(vo2);
			}
		} 
		//리뷰쓴글불러오기
		for(int i=0;i<vo1.size();i++) {
			n=vo1.get(i).getOr_num();
			map.put("or_num", n);
			map.put("re_num", "is not null");
			List<OrdersVo> list1=service.orderList1(map);
			if(list1.size()!=0) {
				OrdersVo vo2=list1.get(0);
				Integer maincount=service.maincount(n);
				vo2.setCount(maincount);
				count.add(maincount);
				after.add(vo2);
			}
		}
		model.addAttribute("count",count);
		model.addAttribute("before",before);
		model.addAttribute("after",after);
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/user/review.jsp");

		return "layout";
	}
	@GetMapping("/reviewList")
	public String reviewList(int re_num,Model model,Principal principal) {
		ReviewVo vo=service.reviewList(re_num);
		System.out.println("vo" +vo);
		model.addAttribute("vo",vo);
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/user/reviewList.jsp");
		return "layout";
		
	}
}
