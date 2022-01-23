package com.jhta.project.controller.user;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@Controller
public class LoginController {
	@Autowired UserService service;
	
	@GetMapping("/loginuser")
	public String login(Model model) {
		model.addAttribute("main","/WEB-INF/views/user/login.jsp");
		return "layout";
	}
	@PostMapping("/loginuser")
	public String login(Model model,UserVo vo,String chk) {
		boolean b=service.selectId(vo);
		
		if(b) {
			if(chk!=null) {
				Cookie cook1=new Cookie("ui_id",vo.getUi_id());
				cook1.setMaxAge(60*60); //60분
				cook1.setPath("/");
				model.addAttribute(cook1);
			}else {
				model.addAttribute("result","아이디 또는 비밀번호가 일치하지 않습니다.");
				model.addAttribute("main","/WEB-INF/views/user/result.jsp");
			}
		}
		return "layout";
	}
	
}
