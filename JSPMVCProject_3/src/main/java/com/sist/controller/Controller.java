package com.sist.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Model> clsMap = new HashMap<String, Model>();

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			String path = "C:\\webDev\\webStudy\\JSPMVCProject_3\\src\\main\\webapp\\WEB-INF\\application.xml";
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(new File(path));
			Element root = doc.getDocumentElement();
			System.out.println(root.getTagName());
			NodeList list = root.getElementsByTagName("bean");
			for (int i = 0; i < list.getLength(); i++) {
				Element bean = (Element) list.item(i);
				String id = bean.getAttribute("id");
				String cls = bean.getAttribute("class");
//				System.out.println("id="+id+"  class="+cls);
				Class clsName = Class.forName(cls);
				Model model = (Model) clsName.getDeclaredConstructor().newInstance();
				clsMap.put(id, model);
				System.out.println("id=" + id + "  class=" + cls);
			}
		} catch (Exception ex) {
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Model m1=clsMap.get("main/main.do");
		Model m2=clsMap.get("main/main.do");
		Model m3=clsMap.get("main/main.do");
		System.out.println("m1="+m1);
		System.out.println("m2="+m2);
		System.out.println("m3="+m3);
		
		try {
			String uri=request.getRequestURI();
			String key=uri.substring(request.getContextPath().length()+1);
			Model model=clsMap.get(key);
			String jsp=model.handleRequest(request, response);
			
		} catch (Exception ex) {}
	}

}
