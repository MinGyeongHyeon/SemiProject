package com.kh.semi.board.free.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.free.model.vo.UserBoard;
import com.kh.semi.board.free.model.service.UserBoardService;
import com.kh.semi.user.model.vo.User;





/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNm = request.getParameter("bNm");
		String bKind = request.getParameter("bKind");
		String bCon = request.getParameter("bCon");

		int uNo = ((User) request.getSession().getAttribute("loginUser")).getUserNo();
		
		UserBoard ub = new UserBoard();
		ub.setbCon(bCon);
		ub.setbNm(bNm);
		ub.setbKind(bKind);
		ub.setuNo(uNo);
		

		int result = new UserBoardService().insertBoard(ub);
		
		if(result > 0) {
			//response.sendRedirect(request.getContextPath() + "/selectList.bo");
		
			request.getRequestDispatcher("selectList.bo").forward(request, response);
	
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











