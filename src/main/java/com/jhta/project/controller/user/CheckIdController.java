package com.jhta.project.controller.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.UserAddrService;
import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserAddrVo;
import com.jhta.project.vo.user.UserVo;


@RestController
public class CheckIdController {
	@Autowired UserService service;
	@Autowired UserAddrService addrservice;
	
		
	@GetMapping(value="/checkid",produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> selectid(String ui_id){
		String b= service.checkid(ui_id);
		HashMap<String,Object>map=new HashMap<String,Object>();
		if(b!=null) {
			map.put("using", true);
		}else {
			map.put("using", false);
		}
		return map;
	}
	@GetMapping(value="/checknickname",produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> selectnickname(String ua_nickname){
		UserAddrVo vo= addrservice.checknickname(ua_nickname);
		HashMap<String,Object>map=new HashMap<String,Object>();
		if(vo!=null) {
			map.put("using", true);
		}else {
			map.put("using", false);
		}
		return map;
	}

}
