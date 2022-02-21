package com.jhta.project.service.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.MainMapper;
import com.jhta.project.vo.user.OrderReviewVo;
import com.jhta.project.vo.user.OrdersVo;
import com.jhta.project.vo.user.ReviewVo;

@Service
public class ReviewService {
	@Autowired private MainMapper mapper;

	public List<OrderReviewVo> orderReview() {
		return mapper.orderReview();
	}
	public int reviewWrite(ReviewVo vo) {
		return mapper.reviewWrite(vo);
	}
	public List<OrdersVo> orderList1(HashMap<String, Object> map) {
		return mapper.orderList1(map);
	}

	public int maincount(int or_num) {
		return mapper.maincount(or_num);
	}

	public List<OrdersVo> orderList(String ui_id) {
		return mapper.orderList(ui_id);
	}
	public ReviewVo reviewList(int re_num) {
		return mapper.reviewList(re_num);
	}
	
}
