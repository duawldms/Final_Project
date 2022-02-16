package com.jhta.project.vo.user;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderReviewVo {
private int or_num;//주문번호
private String ui_id;//아이디
private Date or_regdate;//배달날짜
private String food_name;//음식이름
private String r_name;//레스토랑이름
private String r_img;//가게이미지
private String fo_name;//음식옵션이름

}
