package com.jhta.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@Controller
public class UserInfoController {
	@Autowired UserService service;
	@Autowired private PasswordEncoder passwordEncoder;
	
	@GetMapping("/usermypage")
	public String UserPage(Model model){
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";
	}
	//비밀번호 확인 후 
	@GetMapping("/userinfocheck")
		public String UserInfoCheckForm(Model model,String ui_id) {
		model.addAttribute("mypagemain","/WEB-INF/views/user/UserInfoCheck.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";		
	}
	//비밀번호 입력 후 
	@GetMapping("/userinfo")
	public String UserInfo(Model model,UserVo vo,String ui_id) {
		
		/*//넘어온 파라미터 비밀번호값을 저장
		String pwd=vo.getUi_pwd();
		String encryptPassword=passwordEncoder.encode(pwd);
		System.out.println(encryptPassword);
		vo.setUi_pwd(pwd);
		if(passwordEncoder.matches(vo.getUi_pwd(), encryptPassword)){
			UserVo vo1= service.selectUser(vo);
			System.out.println(vo1);
			model.addAttribute("vo",vo1);
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserInfo.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
			
		}else {
			model.addAttribute("vo","비밀번호가 일치하지 않습니다.");
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserInfoCheckFalse.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");	
		}*/
		
		UserVo vo1=service.selectUser(vo);
		if(vo1!=null) {
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
