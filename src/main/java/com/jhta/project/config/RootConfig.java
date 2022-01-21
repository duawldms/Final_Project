package com.jhta.project.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//root-context.xml을 대신하는 클래스
@Configuration
@MapperScan(basePackages = {"com.jhta.project.mybatis.mapper"})
@ComponentScan(basePackages = {"com.jhta.project.service"})
public class RootConfig {
	@Bean(destroyMethod ="close")
	public BasicDataSource dataSource() {
		BasicDataSource ds=new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		ds.setUsername("c##finalproject");
		ds.setPassword("1234");
		return ds;
	}
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sb=new SqlSessionFactoryBean();
		sb.setDataSource(dataSource());
		return (SqlSessionFactory)sb.getObject();				
	}
}
