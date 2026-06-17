package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		List<FoodVO> list = FoodDAO.foodListData((curpage * 12) - 12);
		int totalpage = FoodDAO.foodTotalPage();
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

		JSONArray arr = new JSONArray();
		int i = 0;
		for (FoodVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("poster", vo.getPoster());
			obj.put("name", vo.getName());
			if (i == 0) {
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
			}
			arr.add(obj);
			i++;
		}

		return "../food/list.jsp";
	}

	@RequestMapping("food/list_ajax.do")
	public void foodListData_ajax(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		List<FoodVO> list = FoodDAO.foodListData((curpage * 12) - 12);
		int totalpage = FoodDAO.foodTotalPage();
		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			endPage = totalpage;

		JSONArray arr = new JSONArray();
		int i = 0;
		for (FoodVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("poster", vo.getPoster());
			obj.put("name", vo.getName());
			if (i == 0) {
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
			}
			arr.add(obj);
			i++;

		}
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception ex) {}

	}
	
	@RequestMapping("food/detail.do")
	public String foodDetailData(HttpServletRequest request, HttpServletResponse response) {
		
		String no=request.getParameter("no");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		String[] address=vo.getAddress().split(" ");
		request.setAttribute("addr", address[2]);
		System.out.println(address[2]);
		request.setAttribute("rcount", 0);
		return "../food/detail.jsp";
	}

}
