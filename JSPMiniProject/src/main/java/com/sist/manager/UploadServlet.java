package com.sist.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.sist.dao.DataBoardDAO;
import com.sist.vo.DataBoardVO;

@WebServlet("/UploadServlet")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024,
	maxFileSize = 1024*1024*100,
	maxRequestSize=1024*1024*50
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR="uploads";
	public static String UploadPath;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath=getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		//System.out.println(uploadPath);
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		this.UploadPath=uploadPath;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pwd = request.getParameter("pwd");
			
			DataBoardVO vo = new DataBoardVO();
			
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			Part filePart=request.getPart("files");
			if(filePart==null || filePart.getSize()==0) {
				vo.setFilename("");
				vo.setFilesize(0);
			}
			else {
				String fileName=filePart.getSubmittedFileName();
				filePart.write(uploadPath+File.separator+fileName);
				File f=new File(uploadPath+File.separator+fileName);
				vo.setFilename(f.getName());
				vo.setFilesize((int)f.length());
			}
			
			DataBoardDAO.boardInsert(vo);
			response.sendRedirect("board/list.do");
		} catch (Exception ex) {}
	}

}
