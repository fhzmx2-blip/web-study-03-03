package com.sist.vo;
/*
 * 이름       널?       유형             
-------- -------- -------------- 
NO       NOT NULL NUMBER         
NAME     NOT NULL VARCHAR2(51)   
SUBJECT  NOT NULL VARCHAR2(2000) 
CONTENT  NOT NULL CLOB           
PWD      NOT NULL VARCHAR2(10)   
REGDATE           DATE           
HIT               NUMBER         
FILENAME          VARCHAR2(260)  
FILESIZE          NUMBER 
 */
import java.util.*;

import lombok.Data;

@Data
public class DataBoardVO {
	private int no, hit, filesize;
	private String name, subject, content, pwd, filename, dbday;
	private Date regdate;
}
