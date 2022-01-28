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
public class CategoryUploadContoller {
	@Autowired private ServletContext sc;
	@Autowired CategoryService service;

	@GetMapping("/category/upload")
	public String categoryForm(Model model) {
		model.addAttribute("main","/WEB-INF/views/category/categoryupload.jsp");
		return "layout";
	}
	@PostMapping("/category/upload")
	public String upload(CategoryVo vo, MultipartFile file1, Model model) throws Exception {
		String cg_name=new String(StringUtils.cleanPath(vo.getCg_name()).getBytes("8859_1"),"utf-8");
		String path=sc.getRealPath("/resources/img");
		System.out.println("저장경로 : " + path);
		String orgname=file1.getOriginalFilename();
		String saveFileName= UUID.randomUUID() +"_" + orgname;
		vo.setCg_name(cg_name);
		if(file1 !=null) {
			vo.setCg_photo(saveFileName);
		}
		service.categoryUpload(vo);
		try {
			InputStream is=file1.getInputStream();
			File f= new File(path + "\\" + saveFileName);
			FileOutputStream fos=new FileOutputStream(f);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류 : "+ e.getMessage());
			model.addAttribute("code","fail");
		}
		return "redirect:/";
	}
}