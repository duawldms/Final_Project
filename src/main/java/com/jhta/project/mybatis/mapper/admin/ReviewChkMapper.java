package com.jhta.project.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.user.ReviewVo;

public interface ReviewChkMapper {
	List<ReviewVo> list(HashMap<String,Object> map);
	int count(HashMap<String,Object> map);
	int delete(int re_num);
	ReviewVo detail(int re_num);
	ReviewVo prev(int re_num);
	ReviewVo next(int re_num);
}
