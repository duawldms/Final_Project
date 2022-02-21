package com.jhta.project.controller.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
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

import com.jhta.project.service.user.ReviewService;
import com.jhta.project.vo.user.ReviewVo;

@Controller
public class ReviewWriteController {
	@Autowired private ServletContext sc;
	@Autowired ReviewService service;

	@GetMapping("/review/write")
	public String ReviewWriteForm(Model model, Principal principal,int or_num) {
		model.addAttribute("ui_id",principal.getName());
		model.addAttribute("or_num",or_num);
		model.addAttribute("mypage","/WEB-INF/views/user/userInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/user/reviewWrite.jsp");
		return "layout";
	}
	@PostMapping("/review/write")
	public String ReviewWrite(ReviewVo vo, MultipartFile file1, Model model) throws Exception{
		String re_content=new String(StringUtils.cleanPath(vo.getRe_content()).getBytes("8859_1"),"utf-8");
		String path=sc.getRealPath("/resources/img");
		System.out.println("저장경로 : " + path);
		String orgname=file1.getOriginalFilename();
		String saveFileName= UUID.randomUUID() +"_" + orgname;
		vo.setRe_content(re_content);
		if(orgname!=null) {
			vo.setRp_photo(saveFileName);
		}else {
			vo.setRp_photo(null);
		}
		System.out.println("org"+orgname);
		service.reviewWrite(vo);
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
		return "layout";
	}
}