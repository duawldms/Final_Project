package com.jhta.project.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.admin.ReviewChkService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.user.ReviewVo;

@Controller
public class ReviewChkListController {
	@Autowired private ReviewChkService service;
	
	@RequestMapping("/admin/reviewchk/list")
	public String list(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field,
			String keyword,
			Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword", keyword);
			
		int totalRowCount=service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,5, 10, totalRowCount);
		int startRow=pu.getStartRow();//시작행번호
		int endRow=pu.getEndRow();//끝행번호
		map.put("startRow", startRow);
		map.put("endRow", endRow);
	    List<ReviewVo> list=service.selectList(map);    
	    model.addAttribute("field",field);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("list", list);
	    model.addAttribute("pu", pu);
		return "list";
	}
}

