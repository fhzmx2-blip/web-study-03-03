package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;

public class FoodModel {
	public void foodList(HttpServletRequest request) {
		String strPage = request.getParameter("page");
		if (strPage == null)
			strPage = "1";
		int curpage = Integer.parseInt(strPage);
		FoodDAO dao = new FoodDAO();
		List<FoodVO> list = dao.foodListData(curpage);
		int totalpage = dao.foodTotalPage();

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			endPage = totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	}
}
