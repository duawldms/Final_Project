package com.jhta.project.mybatis.mapper.restaurant;

import java.util.List;

import com.jhta.project.service.security.CustomUserDetail;
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
	List<FoodVo> menuList(String r_id);
	FoodVo getFood(int food_num);
}
