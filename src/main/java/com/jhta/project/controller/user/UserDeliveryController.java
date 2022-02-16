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


@Controller
public class UserDeliveryController {
	@Autowired UserService service;
	
	@RequestMapping("/userdelivery")
	public String deliverydetail(Model model,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			String field,String keyword,Principal principal) {
		//페이징 처리
		HashMap<String,Object>map=new HashMap<String,Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		map.put("ui_id",principal.getName());
		int totalRowCount=service.deliverycountnew(map);
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		
		
		//2022.02.09 test
		List<OrdersVo> intlist=service.selectornum(principal.getName());
		List<OrdersVo> aa=new ArrayList<OrdersVo>();
		List<Integer> bb=new ArrayList<Integer>();
		int n=0;
		for(int i=0;i<intlist.size();i++) {
		n=intlist.get(i).getOr_num();
		map.put("or_num", n);
		List<OrdersVo>list1=service.deliverylistnew(map);
		if(list1.size()!=0) {
		OrdersVo vo=list1.get(0);	
		Integer maincount=service.maincountnew(n);
		vo.setCount(maincount);
		bb.add(maincount);
		aa.add(vo);
		}
		}
		model.addAttribute("bb",bb);
		model.addAttribute("aa",aa);
		//List<OrdersVo>list1=service.deliverylist(map);
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		//model.addAttribute("list1",list1);
		model.addAttribute("pu",pu);
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/DeliveryList.jsp");
		
		return "layout";	
	} 
	@GetMapping("/deliveryupdate")  
	public String deliverydelete(int or_num,Model model,Principal principal,OrdersVo vo) {
		service.statusupdate(vo);
		ArrayList<OrdersVo> list = service.userdelivery(principal.getName());
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/DeliveryList.jsp");
		return "redirect:/userdelivery";	
	}
	@GetMapping("/user/deliverydetail")
	public String deliverydetail(int or_num,Model model,Principal principal,OrdersVo selectvo) {
		selectvo.setOr_num(or_num);
		selectvo.setUi_id(principal.getName()); 
		OrdersVo vo=service.deliverydetail(selectvo);
		model.addAttribute("vo",vo);
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/DeliveryDetail.jsp");
		
		HashMap<String,Object>map=new HashMap<String,Object>();
		List<OrdersVo>mainornum=service.selectmainornum(or_num); //or_num에 따른 메인 메뉴 번호 꺼내오기(중복제거)
		List<OrdersVo> aa=new ArrayList<OrdersVo>();
		List<OrdersVo> bb=new ArrayList<OrdersVo>();
		ArrayList<List<OrdersVo>> cc=new ArrayList<List<OrdersVo>>();
		int n=0;
		for(int i=0;i<mainornum.size();i++) {
			n=mainornum.get(i).getFood_num();
			map.put("food_num",n);//메인메뉴 번호 담기
			vo.setFood_num(n);
			vo.setOr_num(or_num);
			List<OrdersVo>optiondetail=service.mainoptionselect(vo);
			OrdersVo vo1=optiondetail.get(0);
			cc.add(optiondetail);
			aa.add(vo1);
			
		}
		model.addAttribute("aa",aa);
		model.addAttribute("cc",cc);
		return "layout";
	}
	@GetMapping(value="/user/deliverydetailoptionlist",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> deliverydetailoptionlist(int or_num,Model model,OrdersVo vo) {
		List<OrdersVo>mainornum=service.selectmainornum(or_num);
		List<OrdersVo> list=service.mainoptionselect(vo);
		HashMap<String,Object>map=new HashMap<String,Object>();
		ArrayList<List<OrdersVo>> aa=new ArrayList<List<OrdersVo>>();
		int n=0;
		for(int i=0;i<mainornum.size();i++) {
			n=mainornum.get(i).getFood_num();
			map.put("food_num",n);//메인메뉴 번호 담기
			vo.setFood_num(n);
			vo.setOr_num(or_num);
			List<OrdersVo>optiondetail=service.mainoptionselect(vo);
			aa.add(optiondetail);
			map.put("aa",aa);
		}
		model.addAttribute("aa",aa);
		return map;
	}
}
