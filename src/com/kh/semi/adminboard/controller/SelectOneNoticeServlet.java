package com.kh.semi.adminboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.adminboard.model.service.AdminBoardService;
import com.kh.semi.adminboard.model.vo.AdminBoard;

@WebServlet("/selectOne.no")
public class SelectOneNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));

		AdminBoard ab = new AdminBoardService().selectOne(num);

		String page = "";
		if(ab != null) {
			page = "views/member/1_introduce/2_notice/3_read.jsp";
			request.setAttribute("ab", ab);
		}else {
			/*page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세 보기 실패!!");*/

		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
