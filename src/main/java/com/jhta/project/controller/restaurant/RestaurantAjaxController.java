package com.jhta.project.controller.restaurant;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.restaurant.MenuUnionVo;
import com.jhta.project.vo.restaurant.RestaurantVo;

@RestController
public class RestaurantAjaxController {
	@Autowired RestaurantService service;
	@Autowired private PasswordEncoder passwordEncoder;
	
	@GetMapping(value = "/restaurantIdCheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, String> idCheck(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		RestaurantVo vo = service.idCheck(id);
		String ui_id = service.userIdCheck(id);
		String admin_id = service.adminIdCheck(id);
		if (vo != null || ui_id != null || admin_id != null) {
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
	
	// 판매자 비밀번호 체크
	@PostMapping(value = "/sellerPwdCheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	public Map<String, String> sellerPwdCheck(String r_pwd, Principal principal) {
		Map<String, String> map = new HashMap<String, String>();
		RestaurantVo vo = service.idCheck(principal.getName());
		if (passwordEncoder.matches(r_pwd, vo.getR_pwd())) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}
	
	@RequestMapping(value = "/getCancelList", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<MenuUnionVo> getOrder(Principal principal) {
		List<MenuUnionVo> list = service.cancelList(principal.getName());
		return list;
	}
	
	@PostMapping(value = "/sellerIdFind", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, String> sellerIdFind(String r_email) {
		System.out.println("r_email + " + r_email);
		Map<String, String> map = new HashMap<String, String>();
		String id = service.getSellerId(r_email);
		if (id != null) {
			String set_id = id.substring(0, id.length() / 2) + "**";
			System.out.println("아이디 : " + set_id);
			map.put("result", "success");
			map.put("r_id", set_id);
		} else {
			map.put("result", "fail");
		}
		return map;
	}
	
}
