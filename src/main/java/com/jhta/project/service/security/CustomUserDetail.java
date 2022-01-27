package com.jhta.project.service.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.jhta.project.vo.security.AuthorityVo;


//사용자 인증에 대한 정보를 갖는 클래스
public class CustomUserDetail implements UserDetails {
	private String userid;
	private String password;
	private String enabled;
	private List<AuthorityVo> authList;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auths=new ArrayList<GrantedAuthority>();
		for(AuthorityVo vo: authList) {
			System.out.println("auth : " + vo);
			auths.add(new SimpleGrantedAuthority(vo.getAu_authority()));
		}
		//사용자 권한을 담은 컬렉션 객체 리턴
		return auths;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return userid;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
