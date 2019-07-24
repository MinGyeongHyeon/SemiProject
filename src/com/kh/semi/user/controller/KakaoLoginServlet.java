package com.kh.semi.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;

/**
 * Servlet implementation class KakaoLoginServelt
 */
@WebServlet("/kakaologin")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("userId");
		String email = request.getParameter("email");
		String name = request.getParameter("userName");
		
		System.out.println(id);
		System.out.println(email);
		System.out.println(name);
		
		User ur = new User();

		ur.setUserId(id);
		ur.setEmail(email);
		ur.setUserNm(name);
		
		int result = new UserService().kakaologin(ur);

		String msg = "";
		String page = "/sixDestiny/views/member/7_member/2_signup/3_signupHomepage.jsp";

		if(result > 0) {
			msg = "회원가입에 성공하셨습니다 !";

			response.sendRedirect("/sixDestiny/");
		}else {
			msg = "회원가입에 실패 하셨습니다..";
			request.setAttribute("msg", msg);

			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
