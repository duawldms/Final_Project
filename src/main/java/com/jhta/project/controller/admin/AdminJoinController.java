package com.jhta.project.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.admin.AdminService;
import com.jhta.project.vo.admin.AdminVo;
import com.jhta.project.vo.user.UserAddrVo;
import com.jhta.project.vo.user.UserVo;

@Controller
public class AdminJoinController {
	@Autowired AdminService service;
	
	@GetMapping("/joinadmin")
	public String AdminInsertForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/admin/join.jsp");
		return "layout";
	}
	@PostMapping("/joinadmin")
	public String join(AdminVo vo,Model model) {
		try {
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","fail");
		}
		return "layout";
	}
}
