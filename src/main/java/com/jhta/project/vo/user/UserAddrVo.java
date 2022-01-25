package com.jhta.project.vo.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class UserAddrVo {
	private int ua_num;
	private String ui_id;
	private String ua_nickname;
	private String ua_addr;
	private String ua_name;
	private String ua_phone;
	private String ua_addrdetail;
}
