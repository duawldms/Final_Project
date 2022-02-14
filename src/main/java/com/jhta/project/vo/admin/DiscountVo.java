package com.jhta.project.vo.admin;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class DiscountVo {
	private String r_id;
	private String or_regdate;
	private int or_totalcost;
	private int or_num;
	private int food_num;
	private String r_name;
	
}
