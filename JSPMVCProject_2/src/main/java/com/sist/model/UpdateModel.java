package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class UpdateModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String msg="수정";
		request.setAttribute("msg", msg);
		return "veiw/update.jsp";
	}

}
