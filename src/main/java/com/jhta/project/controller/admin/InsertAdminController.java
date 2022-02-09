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

@Controller
public class InsertAdminController {
	@Autowired
	AdminService service;

	@GetMapping("/insertadmin")
	public String AdminInsertForm(Model model) {
		model.addAttribute("main", "/WEB-INF/views/admin/insert.jsp");
		return "admin/insert";
	}

	@PostMapping("/insertadmin")
	public String AdminInsert(AdminVo vo, Model model) {
// HttpServletRequest req, HttpServletResponse resp
		try {
			service.adminInsert(vo);
			model.addAttribute("result", "회원가입 완료!");
			model.addAttribute("main", "/WEB-INF/views/admin/result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result", "fail");
			model.addAttribute("main", "/WEB-INF/views/admin/result.jsp");
		}
		return "admin/result";
	}

}