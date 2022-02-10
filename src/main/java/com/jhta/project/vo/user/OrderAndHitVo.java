package com.jhta.project.vo.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderAndHitVo {
	private int or_num;
	private int count;
	private Double hit;
}
