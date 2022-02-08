package com.jhta.project.mybatis.mapper.restaurant;

import java.util.List;
import java.util.Map;

import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.restaurant.FoodOptionVo;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.restaurant.RestaurantVo;
import com.jhta.project.vo.security.AuthorityVo;

public interface RestaurantMapper {
	CustomUserDetail getAuths(String r_id);
	int restaurantInsert(RestaurantVo vo);
	int addAuth(AuthorityVo vo);
	RestaurantVo idCheck(String r_id);
	int menuAdd(FoodVo vo);
	void infoUpdate(RestaurantVo vo);
	List<RestaurantVo> restaurantinfo(String r_id);
	List<FoodVo> menuList(String r_id);
	FoodVo getFood(int food_num);
	List<FoodVo> foodSearch(Map<String, String> map);
	int sideAdd(FoodOptionVo vo);
	int foodUpdate(FoodVo vo);
	int foodDelete(int food_num);
	List<FoodOptionVo> optionSelect(int food_num);
	int optionDelete(int fo_num);
	FoodOptionVo getOption(int fo_num);
	int optionUpdate(FoodOptionVo vo);
	int SoldOut(Map<String, Object> map);
	int sellerUpdate(RestaurantVo vo);
	RestaurantVo sellerPwdCheck(Map<String, String> map);
}
