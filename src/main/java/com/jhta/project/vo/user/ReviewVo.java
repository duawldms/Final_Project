package com.jhta.project.vo.user;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class ReviewVo {
	private int re_num;
	private int or_num;
	private String re_content;
	private int re_hit;
	private Date re_regdate;
	private String rp_photo;

}
