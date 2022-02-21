package com.jhta.project.vo.restaurant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FoodOptionVo {
	private int fo_num;
	private int food_num;
	private String fo_name;
	private int fo_cost;
	private String fo_category;
	private int fo_status;
}
