package com.jhta.project.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.UserMapper;
import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.security.AuthorityVo;
import com.jhta.project.vo.user.UserVo;

@Service
public class UserService {
	@Autowired private UserMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	
	public CustomUserDetail getAuths(String ui_id) {
		System.out.println(ui_id);
		System.out.println(mapper.getAuths(ui_id));
		return mapper.getAuths(ui_id);
	}
	public int addUser(UserVo vo) {
		String ui_pwd=vo.getUi_pwd();
		vo.setUi_pwd(passwordEncoder.encode(ui_pwd));
		mapper.userinsert(vo);
		AuthorityVo auth=new AuthorityVo();
		auth.setAu_id(vo.getUi_id());
		auth.setAu_authority("ROLE_USER");
		mapper.addAuth(auth);
		return 1;
	}
	public int addAuth(AuthorityVo vo) {
		return mapper.addAuth(vo);
	}
	public int userinsert(UserVo vo) {
		return mapper.userinsert(vo);
	}
	public String checkid(String ui_id) {
		return mapper.checkid(ui_id);
	}
	public boolean selectId(UserVo vo) {
		return mapper.selectId(vo);
	}
	public String searchId(UserVo vo) {
		return mapper.searchId(vo);
	}
	public UserVo searchPwd(UserVo vo) {
		return mapper.searchPwd(vo);
	}
	public int updatePwd(UserVo vo) {
		vo.setUi_pwd(passwordEncoder.encode(vo.getUi_pwd()));
		return mapper.updatePwd(vo);
	}
	public UserVo selectUser(String ui_id) {
		return mapper.selectUser(ui_id);
	}
	public UserVo test(String ui_id) {
		return mapper.test(ui_id);
	}
	public int userupdate(UserVo vo) {
		String ui_pwd=vo.getUi_pwd();
		vo.setUi_pwd(passwordEncoder.encode(ui_pwd));
		return mapper.userupdate(vo);
	}
	public int userdelete(UserVo vo) {
		return mapper.userdelete(vo);
	}
}
