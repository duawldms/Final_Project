package com.jhta.project.service.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jhta.project.service.restaurant.RestaurantService;


public class CustomRestaurantDetailService implements UserDetailsService {
	@Autowired private RestaurantService restaurantService;
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		CustomUserDetail restaurantDetail=restaurantService.getAuths(id);
		return restaurantDetail;
	}
}
