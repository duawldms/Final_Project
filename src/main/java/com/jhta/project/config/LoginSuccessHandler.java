package com.jhta.project.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired ServletContext sc; 
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//String username=request.getParameter("username");
		Collection<? extends GrantedAuthority> auths=authentication.getAuthorities();
		System.out.println("권한리스트:"+auths);
		for(GrantedAuthority auth:auths) {
			if(auth.getAuthority().equals("ROLE_USER")) {
				response.sendRedirect(request.getContextPath()+"/loginsuccess");
			}else if(auth.getAuthority().equals("ROLE_RESTAURANT")) {
				sc.removeAttribute("securityPath");
				response.sendRedirect(request.getContextPath()+"/loginRestaurantsuccess");
			}else if(auth.getAuthority().equals("ROLE_ADMIN")) {
				sc.removeAttribute("securityPath");
				response.sendRedirect(request.getContextPath() + "/admin/adminpage" );
			}
		}
		

//		CustomUserDetail userDetail=userService.getAuths(username);
//		CustomUserDetail restaurantDetail=restaurantService.getAuths(username);
//		CustomUserDetail adminDetail=adminService.getAuths(username);
//		System.out.println(username);
//		System.out.println(userDetail);
//		System.out.println(restaurantDetail);
//		if(userDetail!=null) {
//			response.sendRedirect(request.getContextPath()+"/loginsuccess");
//		}else if(restaurantDetail!=null) {
//			response.sendRedirect(request.getContextPath()+"/loginRestaurantsuccess");
//		}else if(adminDetail!=null) {
//			response.sendRedirect(request.getContextPath()+"/loginsuccess");
//		}
//		response.sendRedirect(request.getContextPath()+"/loginsuccess");
		
	}
}










