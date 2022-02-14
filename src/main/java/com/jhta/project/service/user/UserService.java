package com.jhta.project.service.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.project.mybatis.mapper.user.UserMapper;
import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.security.AuthorityVo;
import com.jhta.project.vo.user.FavoritesVo;
import com.jhta.project.vo.user.OrdersVo;
import com.jhta.project.vo.user.UserVo;

@Service
public class UserService {
	@Autowired private UserMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	
	public CustomUserDetail getAuths(String ui_id) {
		System.out.println(ui_id);
		System.out.println(mapper.getAuths(ui_id));
		return mapper.getAuths(ui_id);
	}
	public int addUser(UserVo vo) {
		String ui_pwd=vo.getUi_pwd();
		vo.setUi_pwd(passwordEncoder.encode(ui_pwd));
		mapper.userinsert(vo);
		AuthorityVo auth=new AuthorityVo();
		auth.setAu_id(vo.getUi_id());
		auth.setAu_authority("ROLE_USER");
		mapper.addAuth(auth);
		return 1;
	}
	public int favoritesinsert(FavoritesVo vo) {
		return mapper.favoritesinsert(vo);
	}
	public int addAuth(AuthorityVo vo) {
		return mapper.addAuth(vo);
	}
	public int userinsert(UserVo vo) {
		return mapper.userinsert(vo);
	}
	public String checkid(String ui_id) {
		return mapper.checkid(ui_id);
	}
	public boolean selectId(UserVo vo) {
		return mapper.selectId(vo);
	}
	public String searchId(UserVo vo) {
		return mapper.searchId(vo);
	}
	public UserVo searchPwd(UserVo vo) {
		return mapper.searchPwd(vo);
	}
	public int updatePwd(UserVo vo) {
		vo.setUi_pwd(passwordEncoder.encode(vo.getUi_pwd()));
		return mapper.updatePwd(vo);
	}
	public UserVo selectUser(String ui_id) {
		return mapper.selectUser(ui_id);
	}
	public UserVo test(String ui_id) {
		return mapper.test(ui_id);
	}
	public int userupdate(UserVo vo) {
		String ui_pwd=vo.getUi_pwd();
		vo.setUi_pwd(passwordEncoder.encode(ui_pwd));
		return mapper.userupdate(vo);
	}
	public int userdelete(UserVo vo) {
		return mapper.userdelete(vo);
	}
	public int userpwdupdate(UserVo vo) {
		return mapper.userpwdupdate(vo);
	}
	//배달관련사항 시작
	public ArrayList<OrdersVo> userdelivery(String ui_id) {
		return mapper.userdelivery(ui_id);
	}
	public OrdersVo deliverydetail( OrdersVo vo) {
		return mapper.deliverydetail(vo);
	}
	public ArrayList<OrdersVo> selectstatus(String ui_id){
		return mapper.selectstatus(ui_id);
	}
	public int statusupdate(OrdersVo vo) {
		return mapper.statusupdate(vo);
	}
	public List<OrdersVo> deliverylist(HashMap<String, Object> map){
		return mapper.deliverylist(map);
	}
	public int deliverycount(HashMap<String, Object> map) {
		return mapper.deliverycount(map);
	}
	public ArrayList<OrdersVo> optiondetail(int or_num){
		return mapper.optiondetail(or_num);
	}
	public String checkidadmin(String ui_id) {
		return mapper.checkidadmin(ui_id);
	}
	public String checkidre(String ui_id) {
		return mapper.checkidre(ui_id);
	}
	
	
	/*배달내역 test*/
	public  List<OrdersVo> selectornum(String ui_id){
		return mapper.selectornum(ui_id);
	}
	public List<OrdersVo> deliverylistnew(HashMap<String, Object> map){
		return mapper.deliverylistnew(map);
	}
	public int deliverycountnew(HashMap<String, Object> map) {
		return mapper.deliverycountnew(map);
	}
	public int maincountnew(int or_num) {
		return mapper.maincountnew(or_num);
	}
	public OrdersVo mainselectone(int or_num) {
		return mapper.mainselectone(or_num);
	}
	public List<OrdersVo> selectmainoption(int or_num){
		return mapper.selectmainoption(or_num);
	}
	public List<OrdersVo> mainoptionselect(OrdersVo vo){
		return mapper.mainoptionselect(vo);
	}
	public List<OrdersVo> selectmainornum(int or_num){
		return mapper.selectmainornum(or_num);
	}

}
