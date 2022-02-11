package com.jhta.project.vo.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InSearchReviewVo {
	private int re_num;
	private int or_num;
	private String re_content;
	private int re_hit;
	private Date re_regdate;
	private String rp_photo;
	private int food_count;
	private String food_name;
	
}
