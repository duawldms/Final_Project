package com.jhta.project.vo.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class InSearchRestaurantVo {
	private String r_id;
	private String r_pwd;
	private String r_name;
	private String r_addr;
	private int r_minCost;
	private int r_delCost;
	private String r_img;
	private int r_state;
	private String r_info;
	private Date r_regdate;
	private String cg_name;
	private int r_coordx;
	private int r_coordy;
	private int distance;
}
