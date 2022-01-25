package com.jhta.project.config;

import javax.servlet.ServletContext;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.multipart.support.MultipartFilter;


//시큐리티 필터를 등록대신 클래스 만들기 (상속받기만 하고 아무것도 안해도 됨)
public class SecurityInitializer extends AbstractSecurityWebApplicationInitializer {
	// 파일 업로드
	@Override
	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
		insertFilters(servletContext, new MultipartFilter());
	}
	
}
