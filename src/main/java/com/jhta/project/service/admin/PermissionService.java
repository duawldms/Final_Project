package com.jhta.project.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.admin.PermissionMapper;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Service
public class PermissionService {
	@Autowired private PermissionMapper mapper;
	
	public List<RestaurantVo> selectList(HashMap<String,Object> map){
		return mapper.list(map);
	}
	public int update(RestaurantVo vo) {
		return mapper.update(vo);
	}
}
