package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class DetailModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String msg="상세";
		request.setAttribute("msg", msg);
		return "veiw/detail.jsp";
	}

}
