package com.jhta.project.service.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.SearchMapper;
import com.jhta.project.vo.restaurant.FoodVo;
import com.jhta.project.vo.user.CartDetailVo;
import com.jhta.project.vo.user.CartFoodVo;
import com.jhta.project.vo.user.CartVo;
import com.jhta.project.vo.user.FoodOptionsVo;
import com.jhta.project.vo.user.InSearchOrdersVo;
import com.jhta.project.vo.user.InSearchRestaurantVo;
import com.jhta.project.vo.user.InSearchReviewVo;
import com.jhta.project.vo.user.OrderAndHitVo;
import com.jhta.project.vo.user.OrdersDetailVo;
import com.jhta.project.vo.user.OrdersOptionVo;
import com.jhta.project.vo.user.UserAddrVo;

@Service
public class SearchService {
	@Autowired private SearchMapper mapper;
	
	public List<UserAddrVo> selectAddr(HashMap<String , Object> map){
		return mapper.selectAddr(map);
	}
	public List<InSearchRestaurantVo> searchRes(HashMap<String , Object> map) {
		return mapper.searchRes(map);
	}
	public int count(HashMap<String , Object> map) {
		return mapper.count(map);
	}
	public List<String> searchCategory(){
		return mapper.searchCategory();
	}
	public InSearchRestaurantVo searchDetail(String r_id) {
		return mapper.searchDetail(r_id);
	}
	public List<FoodVo> foodlist(String r_id) {
		return mapper.foodlist(r_id);
	}
	public List<FoodOptionsVo> foodOptionslist(int food_num){
		return mapper.foodOptionslist(food_num);
	}
	public int insertcart(CartVo vo) {
		return mapper.insertcart(vo);
	}
	public int insertcartdetail(CartDetailVo vo) {
		return mapper.insertcartdetail(vo);
	}
	public int getcartseq() {
		return mapper.getcartseq();
	}
	public String getCartRid(String ui_id) {
		return mapper.getCartRid(ui_id);
	}
	public Double getdistance(HashMap<String, Object> map) {
		return mapper.getdistance(map);
	}
	public String getFoodRid(int food_num) {
		return mapper.getFoodRid(food_num);
	}
	public CartVo selectcartnum(int cart_num) {
		return mapper.selectcartnum(cart_num);
	}
	public List<CartVo> selectcart(String ui_id){
		return mapper.selectcart(ui_id);
	}
	public List<CartDetailVo> selectcd(int cart_num){
		return mapper.selectcd(cart_num);
	}
	public int deletecart(String ui_id) {
		return mapper.deletecart(ui_id);
	}
	public int deletecd(int cart_num) {
		return mapper.deletecd(cart_num);
	}
	public List<CartFoodVo> selectFood(String ui_id){
		return mapper.selectFood(ui_id);
	}
	public int delcartnum(int cart_num) {
		return mapper.delcartnum(cart_num);
	}
	public int incOrseq() {
		return mapper.incOrseq();
	}
	public int incOdseq() {
		return mapper.incOdseq();
	}
	public int incOoseq() {
		return mapper.incOoseq();
	}
	public int insertOrders(InSearchOrdersVo vo) {
		return mapper.insertOrders(vo);
	}
	public int insertOD(OrdersDetailVo vo) {
		return mapper.insertOD(vo);
	}
	public int insertOO(OrdersOptionVo vo) {
		return mapper.insertOO(vo);
	}
	public Double findhit(String r_id) {
		return mapper.findhit(r_id);
	}
	public List<OrderAndHitVo> orfoodcount(String r_id){
		return mapper.orfoodcount(r_id);
	}
	public InSearchReviewVo findreview(int or_num) {
		return mapper.findreview(or_num);
	}
	public List<String> findfoodname(int or_num) {
		return mapper.findfoodname(or_num);
	}
	public List<InSearchOrdersVo> findOrdersRid(String ui_id){
		return mapper.findOrdersRid(ui_id);
	}
	public InSearchOrdersVo getOrder(int or_num) {
		return mapper.getOrder(or_num);
	}
}














