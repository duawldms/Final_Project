package com.jhta.project.controller.restaurant;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.RestaurantVo;

@RestController
public class RestaurantAjaxController {
	@Autowired RestaurantService service;
	
	@GetMapping(value = "/restaurantIdCheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, String> idCheck(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		RestaurantVo vo = service.idCheck(id);
		if (vo != null) {
			map.put("result", "fail");
		} else {
			map.put("result", "success");
		}
		System.out.println("result : " + map.get("result"));
		return map;
	}
}
