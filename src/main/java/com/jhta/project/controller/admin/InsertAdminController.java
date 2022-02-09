package com.jhta.project.controller.admin;

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
			model.addAttribute("result", "관리자 생성이 성공적으로 완료되었습니다");
			model.addAttribute("main", "/WEB-INF/views/admin/result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result", "관리자 생성에 실패하였습니다");
			model.addAttribute("main", "/WEB-INF/views/admin/result.jsp");
		}
		return "admin/result";
	}

}