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

/**
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/kakaologin")
public class KakaoLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("userId");
		String email = request.getParameter("email");
		String name = request.getParameter("userName");
		
		System.out.println("*카카오서블렛 호출* 카카오 아이디 : " +id + "카카오서블렛...카카오 이메일 : " +email + "카카오서블렛...카카오 이름 : " + name);
		
		User kakaoLoginUser = new UserService().kakaoLoginCheck(id,email);
    	
		if(kakaoLoginUser !=null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("kakaoLoginUser", kakaoLoginUser);
			response.sendRedirect("/sixDestiny/index.jsp");
				
		}else {
			request.setAttribute("msg", "로그인 실패");
			request.getRequestDispatcher("/sixDestiny/views/member/7_member/1_login/1_main.jsp").forward(request, response);
		}
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
