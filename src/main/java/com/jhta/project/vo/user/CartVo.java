package com.jhta.project.vo.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartVo {
	private int cart_num;
	private String ui_id;
	private int food_num;
}
