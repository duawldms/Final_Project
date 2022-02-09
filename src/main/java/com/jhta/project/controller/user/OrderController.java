package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.UserAddrVo;

@RestController
public class OrderController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/orderData",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> searchUserData(HttpServletRequest req,Principal principal){
		HashMap<String, Object> map= new HashMap<String, Object>();
		Cookie[] cookies=req.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("ua_nickname")) {
				HashMap<String, Object> smap= new HashMap<String, Object>();
				smap.put("ua_nickname", c.getValue());
				smap.put("ui_id", principal.getName());
				List<UserAddrVo> alist=service.selectAddr(smap);
				UserAddrVo vo=alist.get(0);
				map.put("addrvo", vo);
				if(vo.getUa_addr().indexOf(",")==-1) {
					map.put("nodetail", "nodetail");
				}else {
					map.put("addrmain", vo.getUa_addr().substring(0,vo.getUa_addr().indexOf(",")));
					map.put("addrdetail", vo.getUa_addr().substring(vo.getUa_addr().indexOf(",")+1)); 
				}
			} 
		}
		return map;
	}
}






