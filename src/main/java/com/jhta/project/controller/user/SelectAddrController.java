package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,HttpServletResponse resp){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("ui_id", principal.getName());
		map.put("ua_nickname", ua_nickname);
		Cookie dua=new Cookie("ua_nickname","");
		dua.setPath("/");
		dua.setMaxAge(0);
		resp.addCookie(dua);
		Cookie cua=new Cookie("ua_nickname",ua_nickname);
		cua.setPath("/");
		cua.setMaxAge(60*60*24);
		resp.addCookie(cua);
		List<UserAddrVo> list=service.selectAddr(map);
		UserAddrVo vo=list.get(0);		
		map.put("vo", vo);
		return map;
	}
	@GetMapping(value="/user/search",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> searchResaurant(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			String field,String keyword,Double user_coordx,Double user_coordy,
			@RequestParam(value="cg_name",defaultValue = "")String cg_name,
			@RequestParam(value="orderby",defaultValue = "")String orderby,HttpServletResponse resp){
		HashMap<String, Object> map=new HashMap<String, Object>();
		Cookie delx=new Cookie("tmpcoordx",user_coordx.toString());
		delx.setPath("/");
		delx.setMaxAge(0);
		resp.addCookie(delx);
		Cookie dely=new Cookie("tmpcoordy",user_coordy.toString());
		dely.setPath("/");
		dely.setMaxAge(0);
		resp.addCookie(dely);
		Cookie crtx=new Cookie("tmpcoordx",user_coordx.toString());
		crtx.setPath("/");
		crtx.setMaxAge(60*60*24);
		resp.addCookie(crtx);
		Cookie crty=new Cookie("tmpcoordy",user_coordy.toString());
		crty.setPath("/");
		crty.setMaxAge(60*60*24);
		resp.addCookie(crty);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("user_coordy", user_coordy);
		map.put("user_coordx", user_coordx);
		if(!cg_name.equals("")||!cg_name.equals("all")) {
			map.put("category", cg_name);
		}else {
			map.put("category","");
		}
		if(orderby==null||orderby.equals("")) {
			map.put("orderby", "hit");
		}else {
			map.put("orderby", orderby);
		}
		System.out.println(orderby);
		int totalRowCount=service.count(map);
		//System.out.println(totalRowCount);
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow=pu.getStartRow(); 
		int endRow=pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<InSearchRestaurantVo> listvo =service.searchRes(map);
		map.put("field",field);
		map.put("keyword",keyword);
		map.put("pu",pu);
		map.put("listvo",listvo);
		//System.out.println(field+","+keyword+","+pu+","+listvo);
		return map;
	}
	
}
