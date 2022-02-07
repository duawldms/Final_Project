package com.jhta.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.admin.ReviewChkService;
import com.jhta.project.vo.user.ReviewVo;

@Controller
public class ReviewChkDetailController {
	@Autowired private ReviewChkService service;
	
	@GetMapping("/reviewchk/detail")
	public String detail(int re_num,Model model) {
		ReviewVo vo=service.detail(re_num);
		String re_content=vo.getRe_content().replaceAll("\n","<br>");
		vo.setRe_content(re_content);
		model.addAttribute("vo",vo);
		return "admin/reviewchk/detail";
	}

}
