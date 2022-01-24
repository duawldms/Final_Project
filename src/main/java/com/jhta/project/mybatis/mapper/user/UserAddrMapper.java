package com.jhta.project.mybatis.mapper.user;

import com.jhta.project.vo.user.UserAddrVo;

public interface UserAddrMapper {
	int insertaddr(UserAddrVo vo);
	UserAddrVo checknickname(String ua_nickname);

}
