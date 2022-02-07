package com.jhta.project.controller.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

// API 키입력과 API SECRET 키 입력 내번호 부분만 수정해주면 정상으로 작동합니다

@Controller
public class RefundMessageController {
	@RequestMapping(value = "/refund/sendSms.do")
	public String sendSms(HttpServletRequest request) throws Exception {

	  String api_key = "API 키 입력";
	  String api_secret = "API SECRET 키 입력";
	  Message coolsms = new Message(api_key, api_secret);

	  HashMap<String, String> set = new HashMap<String, String>();
	  set.put("to", "내번호"); // 수신번호

	  set.put("from", (String)request.getParameter("from")); // 발신번호
	  set.put("text", (String)request.getParameter("text")); // 문자내용
	  set.put("type", "sms"); // 문자 타입
	  set.put("app_version", "test app 1.2"); 

	  System.out.println(set);
	  try {
	  JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	  System.out.println(result.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }

	  return "admin/aminpage";
	}

}
