package com.jhta.project.mybatis.mapper.restaurant;

import java.util.List;
import java.util.Map;

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

public interface RestaurantMapper {
	CustomUserDetail getAuths(String r_id);
	int restaurantInsert(RestaurantVo vo);
	int addAuth(AuthorityVo vo);
	RestaurantVo idCheck(String r_id);
	int menuAdd(FoodVo vo);
	void infoUpdate(RestaurantVo vo);
	List<RestaurantVo> restaurantinfo(String r_id);
	List<FoodVo> menuList(String r_id);
	FoodVo getFood(int food_num);
	List<FoodVo> foodSearch(Map<String, String> map);
	int sideAdd(FoodOptionVo vo);
	int foodUpdate(FoodVo vo);
	int foodDelete(int food_num);
	List<FoodOptionVo> optionSelect(int food_num);
	int optionDelete(int fo_num);
	FoodOptionVo getOption(int fo_num);
	int optionUpdate(FoodOptionVo vo);
	int SoldOut(Map<String, Object> map);
	int sellerUpdate(RestaurantVo vo);
	List<RestaurantVo> selectChart(String r_id);
	List<OrderListVo> selectSalesDay(Map<String, Object> map);
	List<OrderListVo> selectSalesMonth(Map<String, Object> map);
	List<OrderListVo> selectSalesYear(Map<String, Object> map);
	int sellerPwdChange(Map<String, String> map);
	List<CategoryVo> getCategory();
	int orderCancel(int or_num);
	List<OrdersVo> getOrders(String r_id);
	List<MenuUnionVo> getMenuUnion(String r_id);
	List<MenuUnionVo> cancelList(String r_id);
	int sellerDelete(String r_id);
	List<OrderListVo> excelDown(Map<String, Object> map);
	int orderAccept(Map<String, Integer> map);
	int deliveryStart(int or_num);
	List<MenuUnionVo> getOrder(int or_num);
}
