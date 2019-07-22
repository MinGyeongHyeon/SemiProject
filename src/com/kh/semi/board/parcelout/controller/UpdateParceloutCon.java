package com.kh.semi.board.parcelout.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.UserBoardService;
import com.kh.semi.board.model.vo.UserBoard;

@WebServlet("/UpdateParceloutCon.po")
public class UpdateParceloutCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String content = request.getParameter("content");
		String title = request.getParameter("title");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		UserBoard ub = new UserBoard();

		ub.setbCon(content);
		ub.setbNm(title);
		ub.setbNo(boardNo);

		int result = new UserBoardService().updateOutcon(ub);

		String page = "";
		if(result > 0) {
			response.sendRedirect("/sixDestiny/selectParceloutOne.tn?num=" + boardNo);

		}





	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}


}
