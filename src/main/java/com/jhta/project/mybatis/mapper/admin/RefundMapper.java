package com.jhta.project.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.admin.OrdersVo;

public interface RefundMapper {
	//목록
	List<OrdersVo> list(HashMap<String,Object> map);
	//글갯수
	int count(HashMap<String,Object> map);
	//삭제
	int delete(int or_num);
}
