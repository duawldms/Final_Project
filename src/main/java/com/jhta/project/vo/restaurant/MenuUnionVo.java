package com.jhta.project.vo.restaurant;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MenuUnionVo {
	private int or_num;
	private int food_num;
	private String food_name;
	private String fo_name;
	private int food_count;
	private int food_cost_sum;
	private Date or_regdate;
}
