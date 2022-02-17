package com.jhta.project.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.MainMapper;
import com.jhta.project.vo.user.OrderReviewVo;
import com.jhta.project.vo.user.OrdersVo;

@Service
public class ReviewService {
	@Autowired private MainMapper mapper;

	public List<OrderReviewVo> orderReview() {
		return mapper.orderReview();
	}

	public List<OrdersVo> orderList() {
		return mapper.orderList();
	}
}
