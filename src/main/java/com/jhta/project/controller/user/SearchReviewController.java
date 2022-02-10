package com.jhta.project.controller.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.OrderAndHitVo;

@RestController
public class SearchReviewController {
	@Autowired SearchService service;
	
	@GetMapping(value="/user/search/review")
	public HashMap<String, Object> searchReview(){ 
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<OrderAndHitVo> list= service.orfoodcount(null);
		for(int i=0;i<list.size();i++) {
			OrderAndHitVo vo=list.get(i);
			int or_num=vo.getOr_num();
			
		}
		return map;
	}
}










