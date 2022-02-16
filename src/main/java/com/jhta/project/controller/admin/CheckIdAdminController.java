package com.jhta.project.controller.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.admin.AdminService;

@RestController
public class CheckIdAdminController {
	@Autowired AdminService service;
	
	@GetMapping(value="/checkidadmin",produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> selectid(String admin_id){
		String b=service.checkiduser(admin_id);
		String c=service.checkidre(admin_id);
		String d=service.checkidadmin(admin_id);
		HashMap<String,Object> map=new HashMap<String,Object>();
		if(b!=null || c!=null || d!=null){
			map.put("using", true);
		}else {
			map.put("using",false);
		}
		return map;
	}


}
