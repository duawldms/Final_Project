package com.jhta.project.controller.restaurant;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.FoodVo;
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
	
	// 음식 검색
	@GetMapping(value = "/restaurant/foodSearch", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<FoodVo> foodSearch(String food_search, Principal principal) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("food_search", food_search);
		map.put("r_id", principal.getName());
		List<FoodVo> list = service.foodSearch(map);
		return list;
	}
}
