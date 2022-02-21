package com.jhta.project.service.restaurant;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.restaurant.RestaurantMapper;

@Service
public class MailService {
	@Autowired private JavaMailSender javaMailSender;
	@Autowired private RestaurantMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	
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
	// 10자리 임시 비밀번호 생성
	public String randomPassword(int length) {
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9'  
                ,'A','B','C','D','E','F','G','H','I','J','K','L','M'  
                ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'  
                ,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
                ,'n','o','p','q','r','s','t','u','v','w','x','y','z'
		};
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		return sb.toString();
	}
	// 임시 비밀번호 발급
	public int sendMail( String strTo, String r_id) {
		Map<String, String> map = new HashMap<String, String>();
		// 받는사람을 담을 변수 선언
		String to = strTo;
		/*
		 * flag = 0 실패
		 * flag = 1 성공
		 * */
		int flag = 0;
		String pwd = randomPassword(10);
		String r_pwd = passwordEncoder.encode(pwd);
		map.put("r_pwd", r_pwd);
		map.put("r_id", r_id);
		mapper.sellerTempPwd(map);
		try {
			// 텍스트로 구성된 메일을 생성할때
			SimpleMailMessage simpleMessage = new SimpleMailMessage();
			
			// 인증키 6자리 랜덤으로 생성 후 초기화
			String authKey = Integer.toString( ThreadLocalRandom.current().nextInt(100000, 1000000) );
			// 받는사람 설정
			simpleMessage.setTo( to );
			
			// 제목
			simpleMessage.setSubject("[임시 비밀번호 발급] 배달요기이츠 에서 임시 비밀번호를 보냈습니다.");
			
			// 메일 내용
			simpleMessage.setText("임시 비밀번호는 " + pwd + " 입니다.\n사용 후 비밀번호를 꼭 변경해주세요.");
			
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
