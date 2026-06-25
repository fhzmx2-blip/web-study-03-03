package com.sist.model;

import java.io.*;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class BoardModel {
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response) {
		return "../board/list.jsp";
	}

	@RequestMapping("board/list_vue.do")
	public void board_list_vue(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		int curpage = Integer.parseInt(page);
		int start = (curpage * 10) - 10;
		List<BoardVO> list = BoardDAO.boardListData(start);
		int count = BoardDAO.boardRowCount();
		int totalpage = (int) (Math.ceil(count / 10.0));
		count = count - ((curpage * 10) - 10);

		Map map = new HashMap();
		map.put("curpage", curpage);
		map.put("totalpage", totalpage);
		map.put("count", count);
		map.put("list", list);

		try {
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(map);

			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(json);
		} catch (Exception ex) {}
	}
	
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response) {
		
		return "../board/insert.jsp";
	}
	
	@RequestMapping("board/insert_ok.do")
	public void board_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO.boardInsert(vo);
	}
	
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		return "../board/detail.jsp";
	}
	
	@RequestMapping("board/detail_vue.do")
	public void board_detail_vue(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			PrintWriter out = response.getWriter();
			out.write(json);
		} catch (Exception ex) {}
	}
}
