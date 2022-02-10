package com.jhta.project.controller.user;

import java.net.URLDecoder;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.user.CartDetailVo;
import com.jhta.project.vo.user.CartVo;

@RestController
public class GoCartController {
	@Autowired private SearchService service;
	
	@GetMapping(value="/user/gocart",produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> gocart(@RequestParam(value="checkbox[]",defaultValue = "") List<String> checkbox,
			@RequestParam(value="optionscnt[]",defaultValue = "") List<String> optionscnt,int foodnum,HttpServletResponse resp,HttpServletRequest req,
			@RequestParam(value="necoptions[]",defaultValue = "") List<String> nec,Model model,Principal principal,
			@RequestParam(value="delcheck",defaultValue = "")String delcheck) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			String ui_id=principal.getName();
			String r_id=service.getCartRid(ui_id);
			if(r_id!=null) {
				if(delcheck!=null && !delcheck.equals("")) {
					System.out.println("checkcheck");
					if(delcheck.equals("delete")) {
						List<CartVo> clist=service.selectcart(ui_id);
						for(CartVo cart:clist) {
							service.deletecd(cart.getCart_num());
						}
						service.deletecart(ui_id);
					}
				}else if(!r_id.equals(service.getFoodRid(foodnum))) {
					map.put("result", "check");
					return map;
				}
			}
			CartVo cvo=new CartVo(0, ui_id, foodnum);
			service.insertcart(cvo);
			int seq=service.getcartseq();
			for(String s:nec) {
				CartDetailVo cdvo=new CartDetailVo(0,seq,Integer.parseInt(s),1,null,0,null);
				service.insertcartdetail(cdvo);
			}
			for(int i=0;i<checkbox.size();i++) {
				System.out.println(checkbox+","+optionscnt);
				CartDetailVo cdvo=new CartDetailVo(0, seq, Integer.parseInt(checkbox.get(i)), Integer.parseInt(optionscnt.get(i)),null,0,null);
				service.insertcartdetail(cdvo);
			}
			Cookie[] cookies=req.getCookies();
			String coordx="";
			String coordy="";
			for(Cookie c:cookies) {
				if(c.getName().equals("tmpcoordx")) {
					coordx=URLDecoder.decode(c.getValue(),"utf-8");
				}else if(c.getName().equals("tmpcoordy")) {
					coordy=URLDecoder.decode(c.getValue(),"utf-8");
				}
			}
			Cookie crtx=new Cookie("coordx",coordx);
			crtx.setPath("/");
			crtx.setMaxAge(60*60*24);
			resp.addCookie(crtx);
			Cookie crty=new Cookie("coordy",coordy);
			crty.setPath("/");
			crty.setMaxAge(60*60*24);
			resp.addCookie(crty);
			Cookie delx=new Cookie("tmpcoordx","");
			delx.setPath("/");
			delx.setMaxAge(0);
			resp.addCookie(delx);
			Cookie dely=new Cookie("tmpcoordy","");
			dely.setPath("/");
			dely.setMaxAge(0);
			resp.addCookie(dely);
			map.put("result", "success");	
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}




