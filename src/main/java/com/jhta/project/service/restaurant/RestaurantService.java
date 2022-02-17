package com.jhta.project.service.restaurant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.restaurant.RestaurantMapper;
import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.restaurant.CategoryVo;
import com.jhta.project.vo.restaurant.FoodOptionVo;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.restaurant.MenuUnionVo;
import com.jhta.project.vo.restaurant.OrderCancelVo;
import com.jhta.project.vo.restaurant.OrderListVo;
import com.jhta.project.vo.restaurant.RestaurantVo;
import com.jhta.project.vo.security.AuthorityVo;
import com.jhta.project.vo.user.OrdersVo;

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
	// 카테고리 불러오기
	public List<CategoryVo> getCategory() {
		return mapper.getCategory();
	}
	// 판매자 회원 정보 수정
	public int sellerUpdate(RestaurantVo vo) {
		return mapper.sellerUpdate(vo);
	}
	//정보수정
	public void infoUpdate(RestaurantVo vo) {
		mapper.infoUpdate(vo);
	}
	//공지조회
	public List<RestaurantVo> restaurantinfo(String r_id) {
		return mapper.restaurantinfo(r_id);
	}
	// 음식 메뉴 등록
	public int menuAdd(FoodVo vo) {
		return mapper.menuAdd(vo);
	}
	// 해당 매장 메뉴 불러오기
	public List<FoodVo> menuList(String id) {
		return mapper.menuList(id);
	}
	
	public FoodVo getFood(int food_num) {
		return mapper.getFood(food_num);
	}
	// 사이드 메뉴 추가
	public int sideAdd(FoodOptionVo vo) {
		return mapper.sideAdd(vo);
	}
	
	// 음식 검색
	public List<FoodVo> foodSearch(Map<String, String> map) {
		return mapper.foodSearch(map);
	}
	
	// 메뉴 수정
	public int foodUpdate(FoodVo vo) {
		return mapper.foodUpdate(vo);
	}
	// 메뉴 삭제
	public int foodDelete(int food_num) {
		return mapper.foodDelete(food_num);
	}
	// 사이드 메뉴 삭제
	public int optionDelete(int fo_num) {
		return mapper.optionDelete(fo_num);
	}
	// 사이드 메뉴 불러오기
	public List<FoodOptionVo> optionSelect(int food_num) {
		return mapper.optionSelect(food_num);
	}
	public FoodOptionVo getOption(int fo_num) {
		return mapper.getOption(fo_num);
	}
	// 사이드 메뉴 수정
	public int optionUpdate(FoodOptionVo vo) {
		return mapper.optionUpdate(vo);
	}
	// 메뉴 품절 처리
	public int SoldOut(Map<String, Object> map) {
		return mapper.SoldOut(map);
	}
	public List<OrderListVo> selectSalesDay(HttpServletRequest req,String r_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_date", req.getParameter("s_date"));
		map.put("e_date", req.getParameter("e_date"));
		map.put("r_id", r_id);
		System.out.println(map);
		String gbn = req.getParameter("gbn");
		if(gbn.equals("day")) {
			return mapper.selectSalesDay(map);
			
		}else if(gbn.equals("month")){
			return mapper.selectSalesMonth(map);				
		}else {
			return mapper.selectSalesYear(map);
		}
	}
	public List<OrderListVo> excelDown(HttpServletRequest req,String r_id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("or_totalcost",req.getParameter("or_totalcost"));
		return mapper.excelDown(map);
	}
	// 판매자 비밀번호 변경
	public int sellerPwdChange(String r_pwd, String r_id) {
		Map<String, String> map = new HashMap<String, String>();
		String rPwd = passwordEncoder.encode(r_pwd);
		map.put("r_id", r_id);
		map.put("r_pwd", rPwd);
		return mapper.sellerPwdChange(map);
	}
	// 주문 리스트 불러오기
	public List<OrdersVo> getOrders(String r_id) {
		return mapper.getOrders(r_id);
	}
	// 해당 or_num 주문 불러오기
	public List<MenuUnionVo> getOrder(int or_num) {
		return mapper.getOrder(or_num);
	}
	public List<MenuUnionVo> getMenuUnion(String r_id) {
		return mapper.getMenuUnion(r_id);
	}
	// 주문 리스트 불러오기 end
	
	// 주문 취소
	public int orderCancel(int or_num) {
		return mapper.orderCancel(or_num);
	}
	// 주문 취소 리스트
	public List<MenuUnionVo> cancelList(String r_id) {
		return mapper.cancelList(r_id);
	}
	// 회원 탈퇴
	public int sellerDelete(String r_id) {
		return mapper.sellerDelete(r_id);
	}
	// 주문 수락
	public int orderAccept(Map<String, Integer> map) {
		return mapper.orderAccept(map);
	}
	// 배달 시작
	public int deliveryStart(int or_num) {
		return mapper.deliveryStart(or_num);
	}
	// 알림에서 받아온 or_num 주문 불러오기
	public OrdersVo selectOrder(int or_num) {
		return mapper.selectOrder(or_num);
	}
	// 아이디 중복체크
	public RestaurantVo idCheck(String r_id) {
		return mapper.idCheck(r_id);
	}
	public String userIdCheck(String id) {
		return mapper.userIdCheck(id);
	}

	public String adminIdCheck(String id) {
		return mapper.adminIdCheck(id);
	}
	// 아이디 중복체크 end

	public int deliveryEnd(int or_num) {
		return mapper.deliveryEnd(or_num);
	}
}




