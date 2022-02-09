package com.jhta.project.controller.restaurant;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.OrderListVo;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class ChartController {
	@Autowired RestaurantService service;
	@Autowired ServletContext sc;
	@GetMapping("/restaurant/chart")
	public String chartData(HttpServletResponse response,Principal p, Model model) {  //@RequestParam(value="r_id",required=false)String r_id

		model.addAttribute("main","/WEB-INF/views/restaurant/chart.jsp");
		return "layout";
		
	}
	
	//@RequestMapping(value="/restaurant/sales_chart", method = {RequestMethod.GET})
	@ResponseBody
	@GetMapping(value="/restaurant/sales_chart", produces= {MediaType.APPLICATION_JSON_VALUE})
	public Map<String, Object> sales_chart(HttpServletResponse response,Principal p, Model model,HttpServletRequest req) {  //@RequestParam(value="r_id",required=false)String r_id

		Map<String, Object> map= new HashMap<String, Object>();
		List<OrderListVo> list = service.selectSalesDay(req,p.getName());
 
		
		map.put("list",list);
		//System.out.println(list);
		//System.out.println(list.size());
		
		return map; 
		 
	}
}
