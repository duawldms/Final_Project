package com.jhta.project.service.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.SearchMapper;
import com.jhta.project.vo.user.UserAddrVo;

@Service
public class SearchService {
	@Autowired private SearchMapper mapper;
	
	public List<UserAddrVo> selectAddr(HashMap<String , Object> map){
		return mapper.selectAddr(map);
	}
}
