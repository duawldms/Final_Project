package com.jhta.project.vo.restaurant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FoodVo {
	private int food_num;
	private String food_name;
	private String r_id;
	private String food_img;
	private int food_cost;
	private String food_info;
	private int food_status;
	private String food_category;
}
