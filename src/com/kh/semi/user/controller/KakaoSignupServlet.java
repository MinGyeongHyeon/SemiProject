package com.kh.semi.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;

/**
 * Servlet implementation class KakaoLoginServelt
 */
@WebServlet("/kakaosignup")
public class KakaoSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoSignupServlet() {
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
		//page전환을 위한 값
		int result2 = 0;
		

		String msg = "";
		String page = "/sixDestiny/";
		
		System.out.println("result값: "+result);
		
		
		if(result > 0) {
			//새로운 회원, result=1;
			result2 = 1;
			ArrayList kakaoUser = new ArrayList();
			kakaoUser.add(id);
			kakaoUser.add(result2);
			new Gson().toJson(kakaoUser, response.getWriter());
			
		}else{
			//기존회원, result=0;
			System.out.println("카카오서블렛 호출...");
			result2 = 2;
			ArrayList kakaoUser = new ArrayList();
			kakaoUser.add(id);
			kakaoUser.add(result2);
			new Gson().toJson(kakaoUser, response.getWriter());
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
