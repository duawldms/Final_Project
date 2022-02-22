package com.jhta.project.config;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.jhta.project.service.restaurant.RestaurantService;
@Configuration
public class LoginFailHandler implements AuthenticationFailureHandler{
	@Autowired ServletContext sc;
	@Autowired RestaurantService service;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
//		UsernameNotFoundException : 계정 없음
//		InternalAuthenticationServiceException : 아이디 불일치
//		BadCredentialsException : 비밀번호 불일치
//		AccountExpiredException : 계정만료
//		CredentialExpiredException : 비밀번호 만료
//		DisabledException : 계정 비활성화
//		LockedException : 계정잠김
		String errMsg = null; 
		String id = (String)request.getParameter("username");
		if (exception instanceof BadCredentialsException 
				|| exception instanceof InternalAuthenticationServiceException) {
			errMsg = "아이디 또는 비밀번호가 틀렸습니다.";
		} else if (exception instanceof DisabledException) {
			String authority = service.getAuthority(id);
			if (authority.equals("ROLE_USER")) {
				errMsg = "이미 탈퇴한 계정입니다.";
			} else if (authority.equals("ROLE_RESTAURANT")) {
				int status = service.getSellerStatus(id);
				if (status == 5) {
					errMsg = "이미 탈퇴한 계정입니다.";
				} else {
					errMsg = "관리자 승인을 대기 중인 계정입니다.";
				}
			}
		} else {
			errMsg = "관리자에게 문의하세요.";
		}
		System.out.println("에러 메시지 : " + errMsg);
		System.out.println("실패 경로 : " + (String)sc.getAttribute("securityPath"));
		request.setAttribute("errMsg", errMsg);
		request.getRequestDispatcher((String)sc.getAttribute("securityPath")).forward(request, response);

	}
}
