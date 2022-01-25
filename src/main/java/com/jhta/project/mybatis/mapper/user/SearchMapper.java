package com.jhta.project.mybatis.mapper.user;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.user.UserAddrVo;

public interface SearchMapper {
	List<UserAddrVo> selectAddr(HashMap<String, Object> map);
	
}
