package com.jhta.project.mybatis.mapper.user;


import java.util.List;

import com.jhta.project.vo.user.CategoryVo;

public interface MainMapper {

	int categoryUpload(CategoryVo vo);
	List<CategoryVo> list();
	
}
