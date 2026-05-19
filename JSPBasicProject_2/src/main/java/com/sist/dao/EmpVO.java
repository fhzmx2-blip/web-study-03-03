package com.sist.dao;

import lombok.Data;

@Data
public class EmpVO {
	private int empno, mgr, deptno, sal, comm;
	private String ename, job, Dbday;
	private DeptVO dvo = new DeptVO();
}
