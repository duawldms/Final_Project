package com.jhta.project.controller.user;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.user.SearchService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.user.InSearchRestaurantVo;
import com.jhta.project.vo.user.UserAddrVo;

@Controller
public class SearchController {
	@Autowired private ServletContext sc;
	@Autowired private SearchService service;
	
	@GetMapping("/search")
	public String goSearch(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,
			Principal principal,String field,String keyword) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		PageUtil pu=null;
		List<InSearchRestaurantVo> listvo=null;
		if(principal!=null) {
			String ui_id=principal.getName();
			map.put("ui_id", ui_id);
			List<UserAddrVo> list=service.selectAddr(map);
			map.put("ua_nickname", "기본배송지");
			List<UserAddrVo> list1=service.selectAddr(map);
			UserAddrVo vo=list1.get(0);
			model.addAttribute("vo",vo);
			model.addAttribute("list",list);
			int totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, 5, 10, totalRowCount);
			int startRow=pu.getStartRow(); 
			int endRow=pu.getEndRow();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			listvo =service.searchRes(map);
 
		}
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pu",pu);
		model.addAttribute("listvo",listvo);
		model.addAttribute("main","/WEB-INF/views/search/search.jsp");
		return "layout";
	}
}






