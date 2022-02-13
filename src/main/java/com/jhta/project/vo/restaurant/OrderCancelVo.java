package com.jhta.project.vo.restaurant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderCancelVo {
	private int or_num;
	private String ui_id;
	private int or_totalcost;
	private String food_name;
	private String fo_name;
}
