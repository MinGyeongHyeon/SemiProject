package com.kh.semi.board.parcelout.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.parcelout.model.service.UserBoardService;
import com.kh.semi.board.parcelout.model.vo.UserBoard;




@WebServlet("/parceloutInset.bo")
public class InsertParceloutBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userNo = request.getParameter("userNo");

		System.out.println(userNo);


		UserBoard bo = new UserBoard();

		bo.setbKind("분양후기");
		bo.setbNm(title);
		bo.setuNo(Integer.parseInt(userNo));
		bo.setbCon(content);

		System.out.println("겟 : " + bo.getuNo());

		System.out.println(bo);


		int result = new UserBoardService().InsertParcelout(bo);













	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
