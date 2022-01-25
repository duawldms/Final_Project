package com.jhta.project.mybatis.mapper.restaurant;

import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.restaurant.RestaurantVo;
import com.jhta.project.vo.security.AuthorityVo;

public interface RestaurantMapper {
	CustomUserDetail getAuths(String r_id);
	int restaurantInsert(RestaurantVo vo);
	int addAuth(AuthorityVo vo);
	RestaurantVo idCheck(String id);
	int infoinsert(RestaurantVo vo);
}
