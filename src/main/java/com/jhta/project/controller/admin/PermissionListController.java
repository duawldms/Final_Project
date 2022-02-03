package com.jhta.project.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.admin.PermissionService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class PermissionListController {
	@Autowired private PermissionService service;
	
	@RequestMapping("/admin/permission/list")
	public String list(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field,
			String keyword,
			Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword", keyword);
		
		int totalRowCount=service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,5, 10, totalRowCount);
		int startRow=pu.getStartRow();//시작행번호
		int endRow=pu.getEndRow();//끝행번호
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<RestaurantVo> list=service.selectList(map);
		
		System.out.println("list:"+ list);
		model.addAttribute("field",field);
	    model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
	    model.addAttribute("main","/WEB-INF/views/admin/permission/list.jsp");
		return "admin/permission/list";
	}
		
	}


	


