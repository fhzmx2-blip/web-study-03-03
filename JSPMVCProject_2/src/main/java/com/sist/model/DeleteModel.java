package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class DeleteModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String msg="삭제";
		request.setAttribute("msg", msg);
		return "veiw/delete.jsp";
	}

}
