package com.jhta.project.vo.user;

import java.sql.Date;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

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
	@NumberFormat(style=Style.NUMBER)
	private int r_minCost;
	@NumberFormat(style=Style.NUMBER)
	private int r_delCost;
	private String r_img;
	private int r_state;
	private String r_info;
	private Date r_regdate;
	private String cg_name;
	private Double r_coordx;
	private Double r_coordy;
	private int r_delmin;
	private int r_delmax;
	private Double distance;
}
