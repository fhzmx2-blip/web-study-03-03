package com.sist.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

import com.sist.model.*;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap=new HashMap();


	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		clsMap.put("list", new ListModel());
		clsMap.put("detail", new DetailModel());
		clsMap.put("insert", new InsertModel());
		clsMap.put("update", new UpdateModel());
		clsMap.put("delete", new DeleteModel());
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri=request.getRequestURI();
		String cmd = uri.substring(request.getContextPath().length() + 1, uri.lastIndexOf("."));
		System.out.println("uri="+uri);
		System.out.println("cmd="+cmd);
		Model model=(Model)clsMap.get(cmd);
		String jsp=model.execute(request);
		RequestDispatcher rd=request.getRequestDispatcher(jsp); 
		rd.forward(request, response);
	}

}
