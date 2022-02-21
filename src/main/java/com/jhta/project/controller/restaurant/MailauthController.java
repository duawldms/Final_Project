package com.jhta.project.controller.restaurant;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.restaurant.MailService;
import com.jhta.project.service.restaurant.RestaurantService;

@Controller
public class MailauthController {
	@Autowired MailService ms;
	@Autowired RestaurantService service;
	// 이메일 인증코드 발송
	@RequestMapping(value = "/emailCheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, String> emailCheck(String r_email, HttpServletRequest req) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("r_email : " + r_email);
		int result = ms.sendMail(r_email, req);
		System.out.println("result : " + result);
		String email = service.emailCheck(r_email);
		if (result == 1 && email == null) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		System.out.println("map : " + map.get("result"));
		return map;
	}
	// 이메일 인증키 대조
	@RequestMapping(value = "/emailCodeCheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, String> emailCodeCheck(String r_code, String r_email, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Map<String, String> map = new HashMap<String, String>();
		String authKey = (String)session.getAttribute("authKey");
		String s_email = (String)session.getAttribute("r_email");
		System.out.println("r_code : " + r_code + ", authKey : " + authKey);
		System.out.println("r_email : " + r_email + ", s_email : " + s_email);
		if (r_code.equals(authKey) && r_email.equals(s_email)) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}
	// 임시비밀번호 발급
	@RequestMapping(value = "/sellerPwdFind", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Map<String, String> sellerPwdFind(String r_id, String r_email) {
		Map<String, String> mailSend = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("r_id", r_id);
		map.put("r_email", r_email);
		String id = service.sellerInfoFind(map);
		if (id != null) {
			ms.sendMail(r_email, r_id);
			mailSend.put("result", "success");
		} else {
			mailSend.put("result", "fail");
		}
		return mailSend;
	}
	
}
