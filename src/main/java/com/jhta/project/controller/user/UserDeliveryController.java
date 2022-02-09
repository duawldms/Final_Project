package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.OrdersVo;
import com.jhta.project.vo.user.UserVo;

@Controller
public class UserDeliveryController {
	@Autowired UserService service;
	
	@RequestMapping("/userdelivery")
	public String deliverydetail(String ui_id,Model model,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			String field,String keyword) {
		//페이징 처리
		HashMap<String,Object>map=new HashMap<String,Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		map.put("ui_id",ui_id);
		int totalRowCount=service.deliverycount(map);
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		map.put("ui_id",ui_id);
		List<OrdersVo>list1=service.deliverylist(map);
		model.addAttribute("ui_id",ui_id);
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("list1",list1);
		model.addAttribute("pu",pu);
		
		//배달내역
		ArrayList<OrdersVo> list = service.userdelivery(ui_id);
		model.addAttribute("vo",list);
		model.addAttribute("mypagemain","/WEB-INF/views/user/DeliveryList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";	
	} 
	@GetMapping("/deliveryupdate")  
	public String deliverydelete(int or_num,Model model,String ui_id,OrdersVo vo) {
		service.statusupdate(vo);
		ArrayList<OrdersVo> list = service.userdelivery(ui_id);
		model.addAttribute("vo",list);
		model.addAttribute("mypagemain","/WEB-INF/views/user/DeliveryList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";	
	}
	@GetMapping("/user/deliverydetail")
	public String deliverydetail(int or_num,Model model,String ui_id) {
		OrdersVo vo=service.deliverydetail(or_num);
		model.addAttribute("vo",vo);
		model.addAttribute("mypagemain","/WEB-INF/views/user/DeliveryDetail.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";
	}
	@GetMapping(value="/user/deliveryoptiondetail",produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> detail(int or_num,Model model){
		ArrayList<OrdersVo> list=service.optiondetail(or_num);
		System.out.println(list);
		HashMap<String,Object>map=new HashMap<String,Object>();
		if(list!=null) {
			map.put("list", list);
		}else {
			map.put("list", null);
		}
		return map;
	}
}
