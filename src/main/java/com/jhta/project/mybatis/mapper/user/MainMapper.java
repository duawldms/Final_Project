package com.jhta.project.mybatis.mapper.user;



import java.util.List;

import com.jhta.project.vo.user.CategoryVo;
import com.jhta.project.vo.user.OrderReviewVo;
import com.jhta.project.vo.user.OrdersVo;

public interface MainMapper {

	int categoryUpload(CategoryVo vo);
	List<CategoryVo> list();
	CategoryVo selectOne(String cg_name);
	int update(CategoryVo vo);
	int delete(String cg_name);
	List<OrderReviewVo> orderReview();
	List<OrdersVo> orderList();
	
	
}
