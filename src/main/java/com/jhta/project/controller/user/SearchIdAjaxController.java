package com.jhta.project.controller.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@RestController
public class SearchIdAjaxController {
	@Autowired private UserService service;
	
	@GetMapping(value = "/searchid",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> searchId(UserVo vo,Model model) {
		String ui_id=service.searchId(vo);
		HashMap<String,Object>map=new HashMap<String,Object>();
		if(ui_id!=null) {
			map.put("result", true);
			map.put("ui_id", ui_id);
		}else {
			map.put("result", false);
		}
		return map;
	}
}
