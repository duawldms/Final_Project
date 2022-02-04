package com.jhta.project.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.admin.RefundMapper;
import com.jhta.project.vo.admin.OrdersVo;

@Service
public class RefundService {
	@Autowired private RefundMapper mapper;
	
	public List<OrdersVo> selectList(HashMap<String,Object> map){
		return mapper.list(map);
	}
	public int getCount(HashMap<String,Object> map) {
		return mapper.count(map);
	}
	public int delete(int or_num) {
		return mapper.delete(or_num);
	}
}
