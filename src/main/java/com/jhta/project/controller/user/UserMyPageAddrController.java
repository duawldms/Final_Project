package com.jhta.project.controller.user;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.UserAddrService;
import com.jhta.project.vo.user.UserAddrVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class UserMyPageAddrController {
	@Autowired
	UserAddrService service;

	@GetMapping("/useraddr")
	public String UserAddrForm(Model model,Principal principal) {
		ArrayList<UserAddrVo> vo=service.useraddrselectAll(principal.getName());
		model.addAttribute("vo",vo);
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("mypagemain","/WEB-INF/views/user/MyPageAddr.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
	    return"layout";
  }
	@GetMapping("/useraddrdelete")
	public String UserAddrDelete(Model model,Principal principal,int ua_num) {
		int n=service.useraddrdelete(ua_num);
		ArrayList<UserAddrVo> vo=service.useraddrselectAll(principal.getName());
		model.addAttribute("vo",vo);
		model.addAttribute("mypagemain","/WEB-INF/views/user/MyPageAddr.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
	    return"layout";
	}
	@GetMapping("/useraddrupdate")
	public String UserAddrUpdateForm(UserAddrVo vo,Model model,Principal principal) {
		vo.setUi_id(principal.getName());
		UserAddrVo vo1=service.useraddrselect(vo);
		model.addAttribute("vo",vo1);
		model.addAttribute("mypagemain","/WEB-INF/views/user/MyPageAddrUpdate.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
	    return"layout";
	}
	@PostMapping("/useraddrupdate")
	public String UserAddrUpdate(Model model,UserAddrVo vo,Principal principal) {
		int n=service.useraddrupdate(vo);
		if(n>0) {
			ArrayList<UserAddrVo> vo1=service.useraddrselectAll(principal.getName());
			model.addAttribute("vo",vo1);
			model.addAttribute("mypagemain","/WEB-INF/views/user/MyPageAddr.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}else {
			model.addAttribute("result","주소 및 입력정보를 다시 확인 해 주세요");
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserUpdateresult.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}
	    return"layout";
	}
	@GetMapping("/useraddrinsert")
	public String UserAddrInsertForm(Principal principal,Model model) {
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("mypagemain","/WEB-INF/views/user/MyPageAddrInsert.jsp");
		model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
	    return"layout";
	}
	@PostMapping("/useraddrinsert")
	public String UserAddrInsert(Model model,UserAddrVo vo) {
		int n=service.useraddrinsert(vo);
		if(n>0) {
			ArrayList<UserAddrVo> vo1=service.useraddrselectAll(vo.getUi_id());
			model.addAttribute("vo",vo1);
			model.addAttribute("mypagemain","/WEB-INF/views/user/MyPageAddr.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}else {
			model.addAttribute("result","주소 및 입력정보를 다시 확인 해 주세요");
			model.addAttribute("mypagemain","/WEB-INF/views/user/UserUpdateresult.jsp");
			model.addAttribute("main","/WEB-INF/views/user/MyPage.jsp");
		}
	    return"layout";
	}
	
}
