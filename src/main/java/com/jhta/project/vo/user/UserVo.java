package com.jhta.project.vo.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserVo {
	private String ui_id;
	private String ui_pwd;
	private String ui_name;
	private String ui_email;
	private String ui_phone;
	private Date ui_regdate;
	private String ui_state;
	private String ua_addr;
	private String ua_nickname;
	
}
