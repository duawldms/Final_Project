package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@Controller
public class InsertUserController {
	@Autowired UserService service;
	
	@GetMapping("/insertuser")
	public String UserInsertForm() {
		return "user/insert";
	}
	@PostMapping("insertuser")
	public String UserInsert(UserVo vo,Model model) {
		int n=service.userinsert(vo);
		if(n>0) {
			model.addAttribute("result","success");
		}else {
			model.addAttribute("result","false");
		}
		return "user/result";
	}

}
