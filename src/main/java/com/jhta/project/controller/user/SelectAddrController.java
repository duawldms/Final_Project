package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.UserAddrVo;

@RestController
public class SelectAddrController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/addrDetail", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> addrDetail(Principal principal,String ua_nickname){
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println(principal.getName()+","+ua_nickname);
		map.put("ui_id", principal.getName());
		map.put("ua_nickname", ua_nickname);
		List<UserAddrVo> list=service.selectAddr(map);
		UserAddrVo vo=list.get(0);
		map.put("vo", vo);
		System.out.println(vo);
		return map;
	}
}
