package com.jhta.project.vo.restaurant;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderListVo {
	private int or_num; //주문번호
	private int food_num; //음식번호
	private int fo_num; //옵션번호
	private int or_status;//주문상태
	private String ui_id;//유저아이디
	private int food_cost;//음식 가격
	private String ua_nickname;//주문지정보
	private Date or_regdate;//주문날짜
	private int or_totalcost;//주문총가격
}
