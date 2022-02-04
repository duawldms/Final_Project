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

}
