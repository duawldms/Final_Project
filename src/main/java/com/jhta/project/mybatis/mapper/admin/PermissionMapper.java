package com.jhta.project.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.restaurant.RestaurantVo;

public interface PermissionMapper {
	//목록
	List<RestaurantVo> list(HashMap<String,Object> map);
	//승인
	int update(String r_id);
	//글 갯수 
	int count(HashMap<String,Object> map);
	
	RestaurantVo detail(String r_id);
	
	
	// 테스트
	List<RestaurantVo> testList();
}

