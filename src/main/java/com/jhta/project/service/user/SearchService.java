package com.jhta.project.service.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.SearchMapper;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.user.FoodOptionsVo;
import com.jhta.project.vo.user.InSearchRestaurantVo;
import com.jhta.project.vo.user.UserAddrVo;

@Service
public class SearchService {
	@Autowired private SearchMapper mapper;
	
	public List<UserAddrVo> selectAddr(HashMap<String , Object> map){
		return mapper.selectAddr(map);
	}
	public List<InSearchRestaurantVo> searchRes(HashMap<String , Object> map) {
		return mapper.searchRes(map);
	}
	public int count(HashMap<String , Object> map) {
		return mapper.count(map);
	}
	public List<String> searchCategory(){
		return mapper.searchCategory();
	}
	public InSearchRestaurantVo searchDetail(String r_id) {
		return mapper.searchDetail(r_id);
	}
	public List<FoodVo> foodlist(String r_id) {
		return mapper.foodlist(r_id);
	}
	public List<FoodOptionsVo> foodOptionslist(int food_num){
		return mapper.foodOptionslist(food_num);
	}
}





