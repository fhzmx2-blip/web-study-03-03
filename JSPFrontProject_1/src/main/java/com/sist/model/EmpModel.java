package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class EmpModel {
	@RequestMapping("js/js_8.do")
	public void empListData(HttpServletRequest request, HttpServletResponse response) {
		List<EmpVO> list=EmpDAO.empListData();
		JSONArray arr=new JSONArray();
		for (EmpVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("empno", vo.getEmpno());
			obj.put("ename", vo.getEname());
			obj.put("job", vo.getJob());
			obj.put("dbday", vo.getDbday());
			obj.put("dname", vo.getDvo().getDname());
			obj.put("loc", vo.getDvo().getLoc());
			
			arr.add(obj);
		}
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception ex) {} 
		
		System.out.println(arr.toJSONString());
	}
}
