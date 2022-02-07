package com.jhta.project.mybatis.mapper.user;

import java.util.ArrayList;

import com.jhta.project.vo.user.UserAddrVo;

public interface UserAddrMapper {
	int insertaddr(UserAddrVo vo);
	UserAddrVo checknickname(String ua_nickname);
	int addrupdate(UserAddrVo vo);
	ArrayList<UserAddrVo> useraddrselectAll(String ui_id);
	int useraddrdelete(int ua_num);
	int useraddrupdate(UserAddrVo vo);
	int useraddrinsert(UserAddrVo vo);
	UserAddrVo useraddrselect(UserAddrVo vo);
}
