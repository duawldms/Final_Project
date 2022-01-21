package com.jhta.project.controller.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;


@Controller
public class CheckIdController {
	@Autowired UserService service;
		
	@GetMapping(value="/checkid",produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> selectid(String ui_id){
		UserVo vo= service.checkid(ui_id);
		HashMap<String,Object>map=new HashMap<String,Object>();
		if(vo!=null) {
			map.put("using", true);
		}else {
			map.put("using", false);
		}
		return map;
	}

}
