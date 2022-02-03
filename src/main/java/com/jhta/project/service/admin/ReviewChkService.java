package com.jhta.project.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.admin.ReviewChkMapper;
import com.jhta.project.vo.user.ReviewVo;

@Service
public class ReviewChkService {
	@Autowired private ReviewChkMapper mapper;
	
	public List<ReviewVo> selectList(HashMap<String,Object> map){
		return mapper.list(map);
	}
	public int getCount(HashMap<String,Object> map) {
		return mapper.count(map);
	}
	public int delete(int re_num) {
		return mapper.delete(re_num);
	}
	public ReviewVo detail(int re_num) {
		return mapper.detail(re_num);
	
	}
}
