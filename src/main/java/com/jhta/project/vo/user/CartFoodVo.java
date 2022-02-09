package com.jhta.project.vo.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartFoodVo {
	private int cart_num;
	private String ui_id;
	private int food_num;
	private String food_name;
	private String r_id;
	private String food_img;
	private int food_cost;
	private String food_info;
	private String food_status;
}
