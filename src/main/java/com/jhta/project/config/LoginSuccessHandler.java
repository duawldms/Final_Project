package com.jhta.project.config;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.jhta.project.service.admin.AdminService;
import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.service.user.UserService;
import com.jhta.project.vo.security.AuthorityVo;

@Configuration
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired private UserService userService;
	@Autowired private RestaurantService restaurantService;
	@Autowired private AdminService adminService;
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
				response.sendRedirect(request.getContextPath()+"/loginRestaurantsuccess");
			}else if(auth.getAuthority().equals("ROLE_ADMIN")) {
				request.getRequestDispatcher(request.getContextPath()+"/admin/adminpage");
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










