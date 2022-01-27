package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.user.InSearchRestaurantVo;
import com.jhta.project.vo.user.UserAddrVo;

@RestController
public class SelectAddrController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/addrDetail", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> addrDetail(Principal principal,String ua_nickname,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,String field,String keyword){
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println(principal.getName()+","+ua_nickname);
		map.put("ui_id", principal.getName());
		map.put("ua_nickname", ua_nickname);
		List<UserAddrVo> list=service.selectAddr(map);
		UserAddrVo vo=list.get(0);
//		
		map.put("vo", vo);
		System.out.println(vo);
		
		return map;
	}
	@GetMapping(value="/user/search",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> searchResaurant(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			String field,String keyword,Double user_coordx,Double user_coordy){
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println(field+","+keyword+","+user_coordx+","+user_coordy);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("user_coordy", user_coordy);
		map.put("user_coordx", user_coordx);
		int totalRowCount=service.count(map);
		System.out.println(totalRowCount);
		PageUtil pu=new PageUtil(pageNum, 5, 10, totalRowCount);
		int startRow=pu.getStartRow(); 
		int endRow=pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<InSearchRestaurantVo> listvo =service.searchRes(map);
		map.put("field",field);
		map.put("keyword",keyword);
		map.put("pu",pu);
		map.put("listvo",listvo);
		System.out.println(field+","+keyword+","+pu+","+listvo);
		return map;
	}
	
}
