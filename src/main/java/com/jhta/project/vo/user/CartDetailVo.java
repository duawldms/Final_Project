package com.jhta.project.vo.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDetailVo {
	private int cd_num;
	private int cart_num;
	private int fo_num;
	private int cd_count;
	private String fo_name;
	private int fo_cost;
	private String fo_category;
}
