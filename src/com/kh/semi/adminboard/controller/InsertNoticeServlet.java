package com.kh.semi.adminboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.adminboard.model.service.AdminBoardService;
import com.kh.semi.adminboard.model.vo.AdminBoard;

@WebServlet("/insert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("userNo : " + userNo);

		AdminBoard ab = new AdminBoard();
		ab.setTitle(title);
		ab.setAdBoardCon(content);
		ab.setAdNo(userNo);
		
		

		int result = new AdminBoardService().insertBoard(ab);

		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/select.no");
			//request.getRequestDispatcher("selectList.bo").forward(request, response);
		}else {
			/*request.setAttribute("msg", "게시판 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);*/
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
