package com.jhta.project.vo.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrdersVo {
	private int or_num;
	private String ui_id;
	private String or_request;
	private Date or_regdate;
	private Date or_deltime;
	private int or_status;
	private int or_totalcost;
	private String or_addr;
	
	//order_detail
	private int od_num;
	private int food_num;
	private String fo_name;
	private int fo_cost;
	private int oo_count;
	
	//food
	private String food_name;
	private String r_id;//레스토랑이름
	private String food_img;//음식사진
	private int food_cost; //음식가격
	private String food_info;//음식정보(설명)
	private int food_status;//음식상태

	//restaurant
	private String r_name;
	private int r_delcost; //배달비
	private String r_img;//가게 사진
	
	//category
	private String cg_name;
	
}
