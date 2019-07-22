package com.kh.semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;

@WebServlet("/login.user")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final int LOGIN_OK = 1;
	public static final int WRONG_PASSWORD = 0;
	public static final int EXIT_NOT_MEMBER = -1;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");

		User reqUser = new User();
		reqUser.setUserId(userId);
		reqUser.setUserPwd(password);

		System.out.println("입력값 : " + reqUser);
		UserService ms = new UserService();
		User loginUser = ms.loginCheck(reqUser);

		System.out.println(loginUser);

		String view = "/sixDestiny/index.jsp";
		//String msg = "";
		//System.out.println("dddd : " + loginUser.getStatusNum());
		if(loginUser.getStatusNum() == LoginServlet.LOGIN_OK) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			String login = "로그인";
			session.setAttribute("login", login);

			response.sendRedirect(view);
		}else{
			request.setAttribute("msg", "로그인 정보가 없습니다.");
			request.getRequestDispatcher("views/member/7_member/1_login/2_login.jsp").forward(request, response);
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {
		doGet(request, response);
	}

}
