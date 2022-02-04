package com.jhta.project.vo.user;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FoodOptionsVo {
	private int fo_num;
	private int food_num;
	private String fo_name;
	@NumberFormat(style=Style.NUMBER)
	private int fo_cost;
	private String fo_category;
}
