package com.jhta.project.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.admin.DiscountService;
import com.jhta.project.vo.admin.DiscountVo;

@Controller
public class DiscountListController {
	@Autowired private DiscountService service;
	
	@RequestMapping("/admin/discount/list")
	public String list1(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String date,
			Model model
			) {
		//HashMap<String, Object> map=new HashMap<String, Object>();
	
    //	System.out.println("aa" + vo.getOr_totalcost());

		
		List<DiscountVo> list=service.selectList(date);
		System.out.println("list:"+ list);
		model.addAttribute("list", list);
	
	    model.addAttribute("main","/WEB-INF/views/admin/discount/list.jsp");
		return "admin/discount/list";
	}
}

