package com.sist.vo;

import lombok.Data;

/*
 * 이름  널?       유형           
--- -------- ------------ 
LNO NOT NULL NUMBER       
FNO          NUMBER       
ID           VARCHAR2(20) 
 */

@Data
public class LikeVO {
	private int lno, fno;
	private String id;
}
