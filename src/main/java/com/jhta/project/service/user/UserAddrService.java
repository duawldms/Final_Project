package com.jhta.project.service.user;

import java.util.ArrayList;

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
	public int addrupdate(UserAddrVo vo) {
		return mapper.addrupdate(vo);
	}
	public ArrayList<UserAddrVo> useraddrselectAll(String ui_id) {
		return mapper.useraddrselectAll(ui_id);
	}
	public int useraddrdelete(int ua_num) {
		return mapper.useraddrdelete(ua_num);
	}
	public int useraddrupdate(UserAddrVo vo) {
		return mapper.useraddrupdate(vo);
	}
	public int useraddrinsert(UserAddrVo vo) {
		return mapper.useraddrinsert(vo);
	}
	public UserAddrVo useraddrselect(UserAddrVo vo) {
		return mapper.useraddrselect(vo);
	}
}
