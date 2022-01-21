package com.jhta.project.vo.admin;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AdminVo {
	private String admin_id;
	private String admin_pwd;
	private String admin_lv;
}
