package com.jhta.project.controller.user;

import java.io.IOException;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.service.user.SearchService;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.restaurant.RestaurantVo;
import com.jhta.project.vo.user.CartDetailVo;
import com.jhta.project.vo.user.CartFoodVo;
import com.jhta.project.vo.user.CartVo;
import com.jhta.project.vo.user.InSearchRestaurantVo;

@Controller
public class SearchDetailController {
	@Autowired private SearchService service;

	
	@GetMapping("/searchDetail")
	public String searchDetail(@RequestParam(value="r_id",defaultValue = "")String r_id,
			@RequestParam(value="distance",defaultValue = "")Double distance,Model model,Principal principal,
			HttpServletRequest req) throws IOException {

		if(r_id.equals("")||r_id==null) {
			String ui_id=principal.getName();
			r_id=service.getCartRid(ui_id);
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
			if(r_id==null||r_id.equals("")) {
				if(req.getHeader("REFERER").substring(req.getHeader("REFERER").lastIndexOf("project/")+8).equals("searchDetail")) {
					r_id=(String)req.getSession().getAttribute("r_id");
					req.getSession().removeAttribute("r_id");
					InSearchRestaurantVo resvo=service.searchDetail(r_id);
					HashMap<String, Object> map=new HashMap<String, Object>();
					map.put("user_coordx", coordx);
					map.put("user_coordy", coordy);
					map.put("r_coordx", resvo.getR_coordx());
					map.put("r_coordy", resvo.getR_coordy());
					distance=service.getdistance(map);
					return "redirect:/searchDetail?r_id="+r_id+"&distance="+distance;
				}else {
					if(req.getSession().getAttribute("r_id")!=null) {
						req.getSession().removeAttribute("r_id");
					}
					model.addAttribute("cart","empty");
					return "redirect:/"+req.getHeader("REFERER").substring(req.getHeader("REFERER").lastIndexOf("project/")+8);
				}
			}
			InSearchRestaurantVo resvo=service.searchDetail(r_id);
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("user_coordx", coordx);
			map.put("user_coordy", coordy);
			map.put("r_coordx", resvo.getR_coordx());
			map.put("r_coordy", resvo.getR_coordy());
			distance=service.getdistance(map);
			req.getSession().setAttribute("r_id", r_id);
		}
		Double hit=service.findhit(r_id);
		InSearchRestaurantVo rvo=service.searchDetail(r_id);
		List<FoodVo> flist=service.foodlist(r_id);
		List<CartFoodVo> cflist=service.selectFood(principal.getName());
		model.addAttribute("cflist",cflist);
		model.addAttribute("rvo",rvo);
		model.addAttribute("distance",distance);
		model.addAttribute("flist",flist);
		model.addAttribute("hit",Math.round(hit*10)/10.0);
		model.addAttribute("detail","true");
		model.addAttribute("main","/WEB-INF/views/search/searchDetail.jsp");
		return "layout";
	}
}
