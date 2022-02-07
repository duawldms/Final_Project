package com.jhta.project.vo.admin;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
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
