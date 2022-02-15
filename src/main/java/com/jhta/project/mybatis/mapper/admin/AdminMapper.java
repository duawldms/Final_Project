package com.jhta.project.mybatis.mapper.admin;

import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.admin.AdminVo;
import com.jhta.project.vo.security.AuthorityVo;

public interface AdminMapper {
	CustomUserDetail getAuths(String admin_id);
	int admininsert(AdminVo vo);
	int addAuth(AuthorityVo vo);
	boolean selectId(AdminVo vo);
	int selectadmin(String admin_id);
	String checkidadmin(String admin_id);
	String checkiduser(String admin_id);
	String checkidre(String admin_id);
	
}
