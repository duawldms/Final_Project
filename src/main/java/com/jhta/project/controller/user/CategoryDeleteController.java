package com.jhta.project.controller.user;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.user.CategoryService;

@Controller
public class CategoryDeleteController {
	@Autowired private ServletContext sc;
	@Autowired CategoryService service;
	
	
	/*
	 *
	 * @GetMapping("/category/delete")
	public String categoryForm(String cg_name, Model model) {
		model.addAttribute("main","/WEB-INF/views/category/categoryModify.jsp");
		model.addAttribute("vo",service.selectOne(cg_name));
		return "layout";
	}
	 * 
	 * */
	@GetMapping("/category/delete")
	public String categoryDelete(String cg_name) throws Exception {
		String cgname=new String(StringUtils.cleanPath(cg_name).getBytes("8859_1"),"utf-8");
		System.out.println("이건뭘까" + cg_name);
		try {
			String fileName=service.selectOne(cgname).getCg_name();
			String path = sc.getRealPath("/resources/img");
			File f=new File(path +"\\" + fileName);
			if(f.exists()) {
				f.delete();
			}
			service.delete(cg_name);
			return "redirect:/";
		}catch(Exception e) {
			System.out.println("오류 : " + e.getMessage());
			return "/category/modify";	
		}
	}
}
