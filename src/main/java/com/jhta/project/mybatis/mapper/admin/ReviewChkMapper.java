package com.jhta.project.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.user.ReviewVo;

public interface ReviewChkMapper {
	//목록
	List<ReviewVo> list(HashMap<String,Object> map);
	//글 갯수 
	int count(HashMap<String,Object> map);
	//삭제
	int delete(int re_num);
	//조회
	ReviewVo detail(int re_num);
}
