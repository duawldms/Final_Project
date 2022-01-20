package com.jhta.project.mybatis.mapper.admin;

import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.admin.AdminVo;
import com.jhta.project.vo.security.AuthorityVo;

public interface AdminMapper {
	CustomUserDetail getAuths(String admin_id);
	int adminInsert(AdminVo vo);
	int addAuth(AuthorityVo vo);
}
