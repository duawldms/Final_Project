package com.jhta.project.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.admin.DiscountVo;

public interface DiscountMapper {
	//목록
	List<DiscountVo> list(HashMap<String,Object> map);
	// 글 갯수
	int count(HashMap<String,Object> map);
}
