package com.jhta.project.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.jhta.project.service.security.CustomUserDetailService;



//security-config.xml을 대신하는 클래스
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired BasicDataSource dataSource;
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class); 
 
		http.authorizeRequests()
		.antMatchers("/user/**").access("hasRole('ROLE_USER')")
		.antMatchers("/restaurant/**").access("hasRole('ROLE_RESTAURANT')")
		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/**").access("permitAll");
		//로그인관련 설정
		http.formLogin().loginPage("/loginuser")
				.usernameParameter("username")
				.passwordParameter("password")
				.loginProcessingUrl("/loginuser")
				.defaultSuccessUrl("/loginsuccess")
				.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/");
	}
	@Bean
	public CustomUserDetailService detailService() {
		return new CustomUserDetailService();
	}
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(detailService()).passwordEncoder(passwordEncoder());
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}













