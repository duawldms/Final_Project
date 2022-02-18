package com.jhta.project.service.restaurant;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired private JavaMailSender javaMailSender;
	public int sendMail( String strTo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 받는사람을 담을 변수 선언
		String to = strTo;
		/*
		 * flag = 0 실패
		 * flag = 1 성공
		 * */
		int flag = 0;
		
		try {
			// 텍스트로 구성된 메일을 생성할때
			SimpleMailMessage simpleMessage = new SimpleMailMessage();
			
			// 인증키 6자리 랜덤으로 생성 후 초기화
			String authKey = Integer.toString( ThreadLocalRandom.current().nextInt(100000, 1000000) );
			session.setAttribute("authKey", authKey);
			session.setAttribute("r_email", to);
			// 받는사람 설정
			simpleMessage.setTo( to );
			
			// 제목
			simpleMessage.setSubject("[메일 인증] 배달요기이츠 에서 인증번호를 보냈습니다.");
			
			// 메일 내용
			simpleMessage.setText("인증번호는 " + authKey + " 입니다.\n정확하게 입력해주세요.");
			
			System.out.println(javaMailSender);
			// 메일 발송
			javaMailSender.send(simpleMessage);
			flag = 1;
		} catch (MailException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
