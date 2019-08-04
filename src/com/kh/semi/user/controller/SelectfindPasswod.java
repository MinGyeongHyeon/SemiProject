package com.kh.semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;


@WebServlet("/SelectfindPasswod.sp")
public class SelectfindPasswod extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			System.out.println("여긴 들어오냐 ?");

					String userNm = request.getParameter("userNm");
					String userId = request.getParameter("userId");
					String inputEmail = request.getParameter("inputEmail");

					System.out.println("들어온 이름 : "  + userNm);
					System.out.println("들어온 아이디 : " + userId);
					System.out.println("들어온 이메일 : " + inputEmail);

					User us = new User();

					us.setUserNm(userNm);
					us.setUserId(userId);
					us.setEmail(inputEmail);

					int result = new UserService().selectfindpwd(us);

					String page = "";

					System.out.println("절취선 !!!!!!!!!!!!");

					/*if(result > 0) {
						page = "views/member/7_member/1_login/6_findpwd_1.jsp";
						request.setAttribute("us", us);

					}else {
						page = "views/member/7_member/1_login/6_findpwd_1.jsp";
						request.setAttribute("msg", "정보가 없습니다 확인후 다시 입력해주세요 .");

					}
					request.getRequestDispatcher(page).forward(request, response);*/

					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					new Gson().toJson(us,response.getWriter());


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
