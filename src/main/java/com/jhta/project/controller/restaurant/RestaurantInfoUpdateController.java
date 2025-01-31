package com.jhta.project.controller.restaurant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.CategoryVo;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class RestaurantInfoUpdateController {
	@Autowired
	RestaurantService service;
	@Autowired
	ServletContext sc;

	@GetMapping("/restaurant/infoupdate")
	public String infoUpdateForm(Principal p, Model model) {
		List<CategoryVo> list = service.getCategory();
		model.addAttribute("list", list);
		RestaurantVo vo=service.idCheck(p.getName());
		model.addAttribute("vo",vo);
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/restaurant/infoupdate.jsp");
		return "layout";
	}

	@RequestMapping(value="/restaurant/infoupdate", method = {RequestMethod.POST})
	public String infoUpdate(RestaurantVo vo, MultipartFile file1) throws Exception {
		//System.out.println("test");
		try {
			String r_name = new String(StringUtils.cleanPath(vo.getR_name()).getBytes("8859_1"),"utf-8");
			String cg_name = new String(StringUtils.cleanPath(vo.getCg_name()).getBytes("8859_1"),"utf-8");
			String r_info = new String(StringUtils.cleanPath(vo.getR_info()).getBytes("8859_1"),"utf-8");
			
			vo.setCg_name(cg_name);
			vo.setR_name(r_name);
			vo.setR_info(r_info);
			//System.out.println("vo"+vo);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String path = sc.getRealPath("/resources/img");
		String orgFileName = file1.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		if (!file1.isEmpty()) {
			vo.setR_img(saveFileName);
		}
		
		service.infoUpdate(vo);
		//System.out.println(vo);
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/restaurant/restaurantinfo";
	}
	// 판매자 회원 정보 수정
	@GetMapping("/restaurant/sellerUpdate")
	public String sellerUpdateForm(Model model, Principal principal) {
		List<CategoryVo> list = service.getCategory();
		RestaurantVo vo = service.idCheck(principal.getName());
		System.out.println("판매자 정보 수정 : " + vo);
		String addr = vo.getR_addr();
		String[] ad = addr.split(", ");
		model.addAttribute("list", list);
		model.addAttribute("addr1", ad[0]);
		model.addAttribute("addr2", ad[1]);
		model.addAttribute("vo", vo);
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerUpdate.jsp");
		return "layout";
	}
	
	@PostMapping("/restaurant/sellerUpdate")
	public String sellerUpdate(Model model, Principal principal, RestaurantVo vo
				, MultipartFile file1) {
		try {
			String r_name = new String(StringUtils.cleanPath(vo.getR_name()).getBytes("8859_1"),"utf-8");
			String cg_name = new String(StringUtils.cleanPath(vo.getCg_name()).getBytes("8859_1"),"utf-8");
			String r_addr = new String(StringUtils.cleanPath(vo.getR_addr()).getBytes("8859_1"),"utf-8");
			String r_info = new String(StringUtils.cleanPath(vo.getR_info()).getBytes("8859_1"),"utf-8");
			vo.setCg_name(cg_name);
			vo.setR_name(r_name);
			vo.setR_addr(r_addr);
			vo.setR_info(r_info);
			vo.setR_id(principal.getName());
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		System.out.println("vo : " + vo);
		String path = sc.getRealPath("/resources/img");
		System.out.println("경로 : " + path);
		String orgFileName = file1.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		if (!file1.isEmpty()) {
			vo.setR_img(saveFileName);
		}
		service.sellerUpdate(vo);
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(path + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/restaurant/sallermypage";
	}
	// 판매자 회원 정보 수정 끝
	
	// 판매자 비밀번호 변경
	// 판매자 비밀번호 확인sellerPwdChange
	@GetMapping("/restaurant/sellerPwdCheck")
	public String pwdCheckForm(Model model) {
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerPwdCheck.jsp");
		return "layout";
	}
	
	@GetMapping("/restaurant/pwdChange")
	public String pwdCheck(Model model, Principal principal) {
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		model.addAttribute("main", "/WEB-INF/views/restaurant/sellerPwdChange.jsp");
		return "layout";
	}
	
	@PostMapping("/restaurant/pwdChange")
	public String pwdChange(Model model, String r_pwd, Principal principal, 
			HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		// success-hendler 무시하고 로그아웃 (get 방식으로 사용할때 사용)
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		service.sellerPwdChange(r_pwd, principal.getName());
		
		return "redirect:/";
	}
	// 판매자 비밀번호 변경 end
}
