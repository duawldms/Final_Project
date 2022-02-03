package com.jhta.project.mybatis.mapper.user;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.user.InSearchRestaurantVo;
import com.jhta.project.vo.user.UserAddrVo;

public interface SearchMapper {
	List<UserAddrVo> selectAddr(HashMap<String, Object> map);
	List<InSearchRestaurantVo> searchRes(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
	List<String> searchCategory();
	InSearchRestaurantVo searchDetail(String r_id);
}
