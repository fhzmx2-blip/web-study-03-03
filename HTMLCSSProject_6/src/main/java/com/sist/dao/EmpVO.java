/*
 * 이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME    NOT NULL VARCHAR2(50) 
JOB      NOT NULL VARCHAR2(50) 
HIREDATE NOT NULL DATE         
SAL      NOT NULL NUMBER(10,2) 
DEPTNO   NOT NULL NUMBER       
ISADMIN           CHAR(1)      
 */

package com.sist.dao;

import java.sql.*;
import lombok.Data;

@Data
public class EmpVO {
	private int empno, sal, deptno;
	private String ename, job, isadmin, hiredate;
}


