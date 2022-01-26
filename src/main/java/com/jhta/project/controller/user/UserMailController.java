package com.jhta.project.controller.user;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.user.UserVo;
@RestController
public class UserMailController {
@Autowired private UserService service;
	

	@GetMapping(value = "/finduserpwd",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String findPw(UserVo vo) throws Exception {
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		String result=null;
		
		//회원정보 불러오기
		UserVo vo1 = service.searchPwd(vo);
		System.out.println(vo1);
		
		//가입된 이메일이 존재한다면 이메일 전송
		if(vo1!=null) {
			
			//임시 비밀번호 생성(UUID이용)
			String tempPw=UUID.randomUUID().toString().replace("-", "");//-를 제거
			tempPw = tempPw.substring(0,10);//tempPw를 앞에서부터 10자리 잘라줌
			
			vo1.setUi_pwd(tempPw);//임시 비밀번호 담기
	
			MailUtil mail=new MailUtil(); //메일 전송하기
			mail.sendEmail(vo1);
			
			service.updatePwd(vo1);
			
			String securePw = encoder.encode(vo1.getUi_pwd());//회원 비밀번호를 암호화하면 vo객체에 다시 저장
			vo1.setUi_pwd(securePw);
				
			result="true";
			

		}else {
			result="false";
		}
		return result;
	}

}
