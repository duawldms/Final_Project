package com.jhta.project.controller.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.user.CategoryService;
import com.jhta.project.vo.user.CategoryVo;
@Controller
public class CategoryModifyController {
	@Autowired private ServletContext sc;
	@Autowired CategoryService service;
	@GetMapping("/category/modify")
	public String categoryForm(String cg_name, Model model) {
		model.addAttribute("main","/WEB-INF/views/category/categoryModify.jsp");
		model.addAttribute("vo",service.selectOne(cg_name));
		return "layout";
	}
	@PostMapping("/category/modify")
	public String categoryModify(String cg_name, MultipartFile file1, Model model)  throws Exception{
		String cgname=new String(StringUtils.cleanPath(cg_name).getBytes("8859_1"),"utf-8");
		System.out.println("네임" +cgname);
		CategoryVo vo=service.selectOne(cgname);
		try {
			if(!file1.isEmpty()) {
				String path = sc.getRealPath("/resources/img");
				String orgFileName = file1.getOriginalFilename();
				String saveFileName = UUID.randomUUID() + "_" + orgFileName;
				InputStream is = file1.getInputStream();
				FileOutputStream fos = new FileOutputStream(path + "\\" + saveFileName);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				File f=new File(path +"\\" + vo.getCg_photo());
				f.delete();
				CategoryVo vo1= new CategoryVo(vo.getCg_name(),saveFileName);
				service.update(vo1);
			}else {
				CategoryVo vo1= new CategoryVo(cgname,vo.getCg_photo());
				service.update(vo1);
			}
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","fail");
		}
		return "redirect:/";

	}
}
