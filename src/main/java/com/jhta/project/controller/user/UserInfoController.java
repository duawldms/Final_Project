package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@Controller
public class UserInfoController {
	@Autowired UserService service;
	@Autowired private PasswordEncoder passwordEncoder;
	
	@GetMapping("/user/usermypage")
	public String UserPage(Model model){
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";
	}
	//비밀번호 확인 창으로 넘어가기 
	@GetMapping("/userinfocheck")
		public String UserInfoCheckForm(Model model,String ui_id) {
		model.addAttribute("mypagemain","/WEB-INF/views/user/UserInfoCheck.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";		
	}
	@PostMapping("/userinfo")
	public String postPrevModify(Authentication auth,@RequestParam("ui_pwd")String pw,String ui_id,Model model) {
		String userpwd=service.test(ui_id).getUi_pwd();
		UserVo vo1=service.selectUser(ui_id);
		if(passwordEncoder.matches(pw, userpwd)) {
			model.addAttribute("vo",vo1);
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserInfo.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}else {
			model.addAttribute("vo","비밀번호가 일치하지 않습니다.");
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserInfoCheckFalse.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");	
		}
		return "layout";
	}
}
