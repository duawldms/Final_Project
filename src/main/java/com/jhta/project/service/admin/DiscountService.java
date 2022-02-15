package com.jhta.project.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.admin.DiscountMapper;
import com.jhta.project.vo.admin.DiscountVo;

@Service
public class DiscountService {
	@Autowired private DiscountMapper mapper;
	
	public List<DiscountVo> selectList(HashMap<String,Object> map){
		return mapper.list(map);
	}
	public int getCount(HashMap<String,Object> map) {
		return mapper.count(map);
	}
}
