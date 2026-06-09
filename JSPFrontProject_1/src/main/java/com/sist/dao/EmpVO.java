package com.sist.dao;

import java.sql.Date;

import lombok.Data;

@Data
public class EmpVO {
	private int empno, deptno, sal, comm, mgr;
    private String ename, job, dbday;
    private Date hiredate;
    private DeptVO dvo=new DeptVO();
    
    
	
}
