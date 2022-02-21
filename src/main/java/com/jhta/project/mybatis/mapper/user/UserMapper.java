package com.jhta.project.mybatis.mapper.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jhta.project.service.security.CustomUserDetail;
import com.jhta.project.vo.security.AuthorityVo;
import com.jhta.project.vo.user.FavoritesVo;
import com.jhta.project.vo.user.OrdersVo;
import com.jhta.project.vo.user.UserVo;


public interface UserMapper {
	CustomUserDetail getAuths(String ui_id);
	int userinsert(UserVo vo);
	int addAuth(AuthorityVo vo);
	String checkid(String ui_id);
	String checkua_nickname(UserVo vo);
	boolean selectId(UserVo vo);
	String searchId(UserVo vo);
	UserVo searchPwd(UserVo vo);
	int updatePwd(UserVo vo);
	UserVo selectUser(String ui_id);
	UserVo test(String ui_id);
	int userupdate(UserVo vo);
	int userdelete(UserVo vo);
	int userpwdupdate(UserVo vo);
	int favoritesinsert(FavoritesVo vo);
	ArrayList<OrdersVo> userdelivery(String ui_id);
	OrdersVo deliverydetail( OrdersVo vo);
	ArrayList<OrdersVo> selectstatus(String ui_id);
	int statusupdate(OrdersVo vo);
	List<OrdersVo> deliverylist(HashMap<String, Object> map);
	int deliverycount(HashMap<String, Object> map);
	ArrayList<OrdersVo> optiondetail(int or_num);
	String checkidadmin(String ui_id);
	String checkidre(String ui_id);
	
	/*배달내역 test*/
	List<OrdersVo> selectornum(String ui_id);
	List<OrdersVo> deliverylistnew(HashMap<String, Object> map);
	int deliverycountnew(HashMap<String, Object> map);
	int maincountnew(int or_num);
	OrdersVo mainselectone(int or_num);
	List<OrdersVo> selectmainoption(int or_num);
	List<OrdersVo> mainoptionselect(OrdersVo vo);
	List<OrdersVo> selectmainornum(int or_num); //중복제거 후 메인메뉴만 불러오기
	
	
	
	/*detail 확인하기*/
	List<OrdersVo> selectmainlistforornum(int or_num);
	List<OrdersVo> selectmainoptionforodnum(int od_num);
}
