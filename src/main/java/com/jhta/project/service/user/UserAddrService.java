package com.jhta.project.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.UserAddrMapper;
import com.jhta.project.vo.user.UserAddrVo;

@Service
public class UserAddrService {
	@Autowired UserAddrMapper mapper;
	
	public int insertaddr(UserAddrVo vo) {
		return mapper.insertaddr(vo);
	}
	public UserAddrVo checknickname(String ua_nickname) {
		return mapper.checknickname(ua_nickname);
	}

}
