package com.jhta.project.mybatis.mapper.user;



import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.user.CategoryVo;
import com.jhta.project.vo.user.OrderReviewVo;
import com.jhta.project.vo.user.OrdersVo;
import com.jhta.project.vo.user.ReviewVo;

public interface MainMapper {

	int categoryUpload(CategoryVo vo);
	List<CategoryVo> list();
	CategoryVo selectOne(String cg_name);
	int update(CategoryVo vo);
	int delete(String cg_name);
	List<OrderReviewVo> orderReview();
	List<OrdersVo> orderList(String ui_id);
	int reviewWrite(ReviewVo vo);
	List<OrdersVo> orderList1(HashMap<String, Object> map);
	int maincount(int or_num);
	ReviewVo reviewList(int re_num);
}
