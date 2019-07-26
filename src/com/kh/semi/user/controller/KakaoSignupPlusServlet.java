package com.kh.semi.user.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;

/**
 * Servlet implementation class KakaoSignupPlusServlet
 */
@WebServlet("/kakaosignupplus")
public class KakaoSignupPlusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoSignupPlusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser");

		request.setAttribute("user", user);

		request.getRequestDispatcher("views/member/7_member/2_signup/4_signupKakao.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String NickNm = request.getParameter("userNickName");
		String userHb = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String dogYn = request.getParameter("dogYn");
		String rtcd = request.getParameter("rtcd");

		String addresslist = address + " " + address2;

		System.out.println(addresslist);
		
		User ur = new User();
		
		java.sql.Date day = null;
		
		if(!userHb.equals("")) {

			day =java.sql.Date.valueOf(userHb);

		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		ur.setNickNm(NickNm);
		ur.setUserHb(day);
		ur.setGender(gender);
		ur.setAddress(addresslist);
		ur.setDogYn(dogYn);
		ur.setRtCd(rtcd);
		
		int result = new UserService().kakaosignup(ur);
		
		String page = "";
		
		if(result>0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", ur);

			response.sendRedirect("/sixDestiny/index.jsp");
		}
		else {
			page="/sixDestiny/index.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

}
