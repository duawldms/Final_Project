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
}
