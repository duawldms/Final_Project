package com.jhta.project.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.jhta.project.service.security.CustomRestaurantDetailService;
import com.jhta.project.service.security.CustomUserDetailService;

@Configuration
@EnableWebSecurity
@Order(2)
public class RestaurantSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired BasicDataSource dataSource;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
        
        http.authorizeRequests()
		.antMatchers("/restaurant/**").access("hasRole('ROLE_RESTAURANT')")
		.antMatchers("/**").access("permitAll");
        //레스토랑 로그인 관련 설정
        http
		.formLogin()
		.loginPage("/loginRestaurant")
		.usernameParameter("username") //수정
		.passwordParameter("password") // 수정
		.loginProcessingUrl("/loginRestaurant")
		.successHandler(successHandler())
		.failureHandler(failureHandler())
		
		.and()
		.logout()
		.logoutUrl("/logout")
		.logoutSuccessUrl("/");
        
	}
	@Bean
	public CustomRestaurantDetailService detailService1() {
		return new CustomRestaurantDetailService();
	}
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public AuthenticationSuccessHandler successHandler() {
		return new LoginSuccessHandler();
	}
	@Bean
	public AuthenticationFailureHandler failureHandler() {
		return new LoginFailHandler();
	}
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(detailService1()).passwordEncoder(passwordEncoder());
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}









