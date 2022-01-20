package com.jhta.project.service.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jhta.project.service.admin.AdminService;
import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.service.user.UserService;



public class CustomUserDetailService implements UserDetailsService{
	@Autowired private UserService userService;
	@Autowired private RestaurantService restaurantService;
	@Autowired private AdminService adminService;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		CustomUserDetail userDetail=userService.getAuths(id);
		CustomUserDetail restaurantDetail=restaurantService.getAuths(id);
		CustomUserDetail adminDetail=adminService.getAuths(id);
		if(userDetail!=null) {
			System.out.println("a");
			return userDetail;
		}else if(restaurantDetail!=null) {
			System.out.println("b");
			return restaurantDetail;
		}else if(adminDetail!=null) {
			System.out.println("c");
			return adminDetail;
		}
		System.out.println("d");
		return null;
	}
}
