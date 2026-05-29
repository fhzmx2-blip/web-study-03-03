package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class ListModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String msg="목록";
		request.setAttribute("msg", msg);
		return "veiw/list.jsp";
	}

}
