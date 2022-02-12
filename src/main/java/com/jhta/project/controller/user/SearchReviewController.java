package com.jhta.project.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.InSearchReviewVo;
import com.jhta.project.vo.user.OrderAndHitVo;

@RestController
public class SearchReviewController {
	@Autowired SearchService service;
	
	@GetMapping(value="/user/search/review",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> searchReview(String r_id){ 
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<InSearchReviewVo> reviewlist=new ArrayList<InSearchReviewVo>();
		try {
			List<OrderAndHitVo> list= service.orfoodcount(r_id);
			for(int i=0;i<list.size();i++) {
				OrderAndHitVo vo=list.get(i);
				int or_num=vo.getOr_num();
				InSearchReviewVo revo=service.findreview(or_num);
				List<String> foodname=service.findfoodname(or_num);
				revo.setFood_count(vo.getCount());
				revo.setFood_name(foodname.get(0));
				reviewlist.add(revo);
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		map.put("result", "success");
		map.put("review", reviewlist);
		return map;
	}
}










