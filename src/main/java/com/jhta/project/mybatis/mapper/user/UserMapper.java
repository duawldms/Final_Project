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
	OrdersVo deliverydetail(int or_num);
	ArrayList<OrdersVo> selectstatus(String ui_id);
	int statusupdate(OrdersVo vo);
	List<OrdersVo> deliverylist(HashMap<String, Object> map);
	int deliverycount(HashMap<String, Object> map);
}
