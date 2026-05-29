package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.sist.model.*;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmd=request.getParameter("cmd");
		if(cmd==null) {
			cmd="list";
		}
		String jsp="";
		if(cmd.equals("list")) {
			ListModel model=new ListModel();
			model.execute(request);
			jsp="view/list.jsp";
		}
		else if(cmd.equals("detail")){
			DetailModel model = new DetailModel();
			model.execute(request);
			jsp="view/detail.jsp";
		}
		else if(cmd.equals("insert")){
			InsertModel model = new InsertModel();
			model.execute(request);
			jsp="view/insert.jsp";
		}
		else if(cmd.equals("delete")){
			DeleteModel model = new DeleteModel();
			model.execute(request);
			jsp="view/delete.jsp";
		}
		else if(cmd.equals("update")){
			UpdateModel model = new UpdateModel();
			model.execute(request);
			jsp="view/update.jsp";
		}
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
