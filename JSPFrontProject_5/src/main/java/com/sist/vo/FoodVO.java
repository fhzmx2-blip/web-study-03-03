package com.sist.vo;

import lombok.Data;

/*
 * 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 NO                                        NOT NULL NUMBER
 NAME                                               VARCHAR2(100)
 TYPE                                               VARCHAR2(100)
 PHONE                                              VARCHAR2(30)
 ADDRESS                                            VARCHAR2(260)
 SCORE                                              NUMBER(2,1)
 PARKING                                            VARCHAR2(260)
 POSTER                                             VARCHAR2(100)
 TIME                                               VARCHAR2(100)
 CONTENT                                            VARCHAR2(500)
 THEME                                              VARCHAR2(500)
 PRICE                                              VARCHAR2(100)
 */

@Data
public class FoodVO {
	private int no;
    private double score;
    private String name, type, phone, address, parking, poster, time, content, theme, price;
}
