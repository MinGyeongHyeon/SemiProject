package com.kh.semi.board.parcelout.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertReport.ir")
public class InsertParceloutReport extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String reason = request.getParameter("reason");
		String test = request.getParameter("test");
		String test2 = request.getParameter("test2");
		String test3 = request.getParameter("test3");

		System.out.println("reason 의 값 : " + reason);
		System.out.println("test 의 값 : " + test);
		System.out.println("test2 의 값 : " + test2);
		System.out.println("test3 의 값  : " + test3);




	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);


	}

}