package com.jhta.project.mybatis.mapper.user;

import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.security.AuthorityVo;
import com.jhta.project.vo.user.UserVo;

public interface UserMapper {
	CustomUserDetail getAuths(String ui_id);
	int userinsert(UserVo vo);
	int addAuth(AuthorityVo vo);
	UserVo checkid(String ui_id);
	boolean selectId(UserVo vo);
	String searchId(UserVo vo);
}
