package com.jhta.project.controller.user;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;

@Controller
public class UserDeleteController {
	@Autowired UserService service;
	@Autowired private PasswordEncoder passwordEncoder;
	
	
	@GetMapping("/userdelete") //회원탈퇴 페이지로 이동
	public String UserDeleteForm(Model model,Principal principal) {
		UserVo vo=service.test(principal.getName());
		model.addAttribute("vo",vo);
		model.addAttribute("mypagemain","/WEB-INF/views/user/Delete.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		return "layout";
	}
	@PostMapping("/delete")//탈퇴 비밀번호 입력받고
	public String Delete(Model model,UserVo vo,Authentication auth,@RequestParam("ui_pwd")String pw,HttpServletRequest request,HttpServletResponse response) {
		String userpwd=service.test(vo.getUi_id()).getUi_pwd();
		UserVo vo1=service.selectUser(vo.getUi_id());
		int n=service.userdelete(vo);
		if(passwordEncoder.matches(pw, userpwd) && n>0) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			model.addAttribute("result","회원탈퇴가 완료되었습니다.");
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserUpdateresult.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}else {
			model.addAttribute("result","비밀번호가 일치하지 않습니다. 다시 확인 해 주세요.");
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserUpdateresult.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}
		
		return "layout";
	}
	

}
