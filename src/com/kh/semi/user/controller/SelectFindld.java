package com.kh.semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;


@WebServlet("/SelectFindld.sf")
public class SelectFindld extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String email = request.getParameter("email");

		System.out.println("userId = " + userId);
		System.out.println("email = " + email);

		User us = new UserService().selectfind(userId,email);
		System.out.println(us.getUserId());
		System.out.println(us.getUserNm());

		String page = "";

		if(us.getUserId() != null) {
			request.setAttribute("us", us);
			page = "views/member/7_member/1_login/5_findid_1.jsp";

		}else {
			String msg = "아이디가 없습니다 !";
			request.setAttribute("msg", msg);
			page = "views/member/7_member/1_login/5_findid_1.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);





	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
