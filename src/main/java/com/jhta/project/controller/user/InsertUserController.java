package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserAddrService;
import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.FavoritesVo;
import com.jhta.project.vo.user.UserAddrVo;
import com.jhta.project.vo.user.UserVo;

@Controller
public class InsertUserController {
	@Autowired UserService service;
	@Autowired UserAddrService service1;
	
	
	@GetMapping("/insertuser")
	public String UserInsertForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/user/insert.jsp");
		return "layout";
	}
	@PostMapping("/insertuser")
	public String UserInsert(UserVo vo,Model model,UserAddrVo vo1,FavoritesVo vo2) {
		try {
			service.addUser(vo);
			vo1.setUa_name(vo.getUi_name());
			vo1.setUa_phone(vo.getUi_phone());
			service1.insertaddr(vo1);
			//service.favoritesinsert(vo2); 선호분류 지정 
			model.addAttribute("result","회원가입 완료!");
			model.addAttribute("main","/WEB-INF/views/user/result.jsp");
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("result","false");
			model.addAttribute("main","/WEB-INF/views/user/result.jsp");
		}
		return "layout";
	}

}
