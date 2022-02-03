package com.jhta.project.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.restaurant.RestaurantVo;

public interface PermissionMapper {
	List<RestaurantVo> list(HashMap<String,Object> map);
	int update(RestaurantVo vo);
	RestaurantVo detail(String r_id);
}

