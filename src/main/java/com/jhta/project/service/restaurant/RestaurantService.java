package com.jhta.project.service.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.restaurant.RestaurantMapper;
import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.restaurant.RestaurantVo;
import com.jhta.project.vo.security.AuthorityVo;

@Service
public class RestaurantService {
	@Autowired private RestaurantMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	
	
	public CustomUserDetail getAuths(String r_id) {
		return mapper.getAuths(r_id);
	}
	
	public int addRestaurant(RestaurantVo vo) {
		try {
			String r_pwd = vo.getR_pwd();
			vo.setR_pwd(passwordEncoder.encode(r_pwd));
			mapper.restaurantInsert(vo);
			AuthorityVo auth = new AuthorityVo();
			auth.setAu_id(vo.getR_id());
			auth.setAu_authority("ROLE_RESTAURANT");
			mapper.addAuth(auth);
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	public int addAuth(AuthorityVo vo) {
		return mapper.addAuth(vo);
	}
	
	// 아이디 중복체크
	public RestaurantVo idCheck(String r_id) {
		return mapper.idCheck(r_id);
	}
	public void infoUpdate(RestaurantVo vo) {
		mapper.infoUpdate(vo);
	}
	// 음식 메뉴 등록
	public int menuAdd(FoodVo vo) {
		return mapper.menuAdd(vo);
	}
	// 해당 매장 메뉴 불러오기
	public List<FoodVo> menuList(String id) {
		return mapper.menuList(id);
	}
	// 음식 사이드 메뉴 추가
	public FoodVo getFood(int food_num) {
		return mapper.getFood(food_num);
	}
}




