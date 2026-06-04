package com.sist.model;

import java.util.List;

import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListModel implements Model {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String strPage = request.getParameter("page");
		if (strPage == null)
			strPage = "1";
		int curpage = Integer.parseInt(strPage);
		int start = (curpage * 10) - 10;
		List<DataBoardVO> list = DataBoardDAO.databoardListData(start);
		int totalpage = DataBoardDAO.databoardTotalPage();

		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
		return "databoard/list.jsp";
	}

}
