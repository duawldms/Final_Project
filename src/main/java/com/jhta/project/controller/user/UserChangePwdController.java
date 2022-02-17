package com.jhta.project.controller.user;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@Controller
public class UserChangePwdController {
	@Autowired UserService service;
	@Autowired private PasswordEncoder passwordEncoder;
	
	@GetMapping("/changepwd")
	public String ChangePwdForm(Model model,Principal principal) {
		model.addAttribute("ui_id", principal.getName());
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main","/WEB-INF/views/user/ChangePwd.jsp");
		return "layout";
	}
	@PostMapping("/changepwd")
	public String ChangPwd(Model model,UserVo vo,HttpServletRequest request,HttpServletResponse response,
			Authentication auth,Principal principal) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String pwd=encoder.encode(vo.getUi_pwd());
		vo.setUi_pwd(pwd);
		vo.setUi_id(principal.getName());
		int n=service.userpwdupdate(vo);
		if(n>0) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			model.addAttribute("result", "비밀번호가 변경되었습니다 새로운 비밀번호로 재로그인해주세요");
			model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
			model.addAttribute("main","/WEB-INF/views/user/UserUpdateresult.jsp");	
		}else {
			model.addAttribute("result", "비밀번호가 업데이트되는데 문제가 발생했습니다.");
			model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
			model.addAttribute("main","/WEB-INF/views/user/UserUpdateresult.jsp");
		}
		return "layout";
	}

}
