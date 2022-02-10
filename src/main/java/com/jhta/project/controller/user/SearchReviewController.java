package com.jhta.project.controller.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;

@RestController
public class SearchReviewController {
	@Autowired SearchService service;
	
	@GetMapping(value="/user/search/review")
	public HashMap<String, Object> searchReview(){ 
		HashMap<String, Object> map=new HashMap<String, Object>();
		return map;
	}
}
