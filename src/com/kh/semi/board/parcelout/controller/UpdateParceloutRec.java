package com.kh.semi.board.parcelout.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.parcelout.model.service.UserBoardService;




@WebServlet("/updateRec.po")
public class UpdateParceloutRec extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));

		System.out.println("넘어온 num 값 : " + num);

		int result = new UserBoardService().updateRec(num);
		System.out.println("리절트 값 : " + result);


			String page = "";
		if(result > 0) {
			System.out.println(request.getHeader("referer"));
			page = "/selectParceloutOne.tn?num=" + num;
			//response.sendRedirect(request.getContextPath() + "/selectParceloutOne.tn?num=" + num );
			//response.sendRedirect(request.getHeader("referer")) ;

		}
		System.out.println(page);
		request.getRequestDispatcher(page).forward(request, response);




	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
