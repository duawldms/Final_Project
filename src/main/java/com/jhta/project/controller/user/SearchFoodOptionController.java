package com.jhta.project.controller.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.FoodOptionsVo;

@RestController
public class SearchFoodOptionController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/search/foodOptions", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> foodOptions(int food_num){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<FoodOptionsVo> list=service.foodOptionslist(food_num);
		map.put("folist", list);
		return map;
	}
}
