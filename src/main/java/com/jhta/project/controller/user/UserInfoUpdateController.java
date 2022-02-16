package com.jhta.project.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserAddrService;
import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserAddrVo;
import com.jhta.project.vo.user.UserVo;

@Controller
public class UserInfoUpdateController {
	@Autowired UserService service;
	@Autowired UserAddrService addrservice;
	
	@PostMapping("/userupdate")
	public String UserUpdate(UserVo vo,Model model,UserAddrVo vo1,HttpServletRequest req,HttpServletResponse resp) {
		int n=service.userupdate(vo);
		vo1.setUa_name(vo.getUi_name());
		vo1.setUa_phone(vo.getUi_phone());
		if(n>0) {
			//addrservice.addrupdate(vo1);
			model.addAttribute("result","회원정보가 업데이트 되었습니다.");
			model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
			model.addAttribute("main","/WEB-INF/views/user/UserUpdateresult.jsp");
		}else {
			model.addAttribute("result","회원정보 업데이트에 오류가 발생했습니다. 입력 내용을 다시 확인 해 주세요");
			model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
			model.addAttribute("main","/WEB-INF/views/user/UserUpdateresult.jsp");
		}
	
		return "layout";
	}
}
