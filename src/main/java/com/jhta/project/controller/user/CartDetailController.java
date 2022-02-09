package com.jhta.project.controller.user;

import java.net.URLDecoder;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.CartDetailVo;
import com.jhta.project.vo.user.CartVo;
import com.jhta.project.vo.user.InSearchRestaurantVo;

@RestController
public class CartDetailController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/cartdetail",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> cartDetail(int cartnum){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("detail", service.selectcd(cartnum));
		return map;
	}
	@GetMapping(value="/user/cartdelete",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> cartDelete(int cartnum,Principal principal,HttpServletRequest req){
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			String r_id=service.getCartRid(principal.getName());
			service.deletecd(cartnum);
			service.delcartnum(cartnum);
			CartVo list=service.selectcartnum(cartnum);
			if(list==null) {
				InSearchRestaurantVo resvo=service.searchDetail(r_id);
				Cookie[] cookies=req.getCookies();
				String coordx="";
				String coordy="";
				for(Cookie c:cookies) {
					if(c.getName().equals("coordx")) {
						coordx=URLDecoder.decode(c.getValue(),"utf-8");
					}else if(c.getName().equals("coordy")) {
						coordy=URLDecoder.decode(c.getValue(),"utf-8");
					}
				}
				map.put("user_coordx", coordx);
				map.put("user_coordy", coordy);
				map.put("r_coordx", resvo.getR_coordx());
				map.put("r_coordy", resvo.getR_coordy());
				Double distance=service.getdistance(map);
				map.put("distance", distance);
				map.put("r_id", r_id);
				map.put("result", "none");
			}
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}






