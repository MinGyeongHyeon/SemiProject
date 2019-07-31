package com.kh.semi.board.free.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.board.free.model.service.UserBoardService;

/**
 * Servlet implementation class UpdateCommentUserBoardServlet
 */
@WebServlet("/updateCom.ub")
public class UpdateCommentUserBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCommentUserBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int thisCommentNo = Integer.parseInt(request.getParameter("thisCommentNo"));
		String comcon = request.getParameter("comcon");
		System.out.println(thisCommentNo);
		System.out.println(comcon);
		
		int result =  new UserBoardService().updateCommentub(thisCommentNo, comcon);
		String msg = "";
		String page = "views/member/5_freeBoard/1_freeBoard/6_commentUpdate.jsp";
		if(result > 0) {
			msg = "수정이 완료 되었습니다";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher(page).forward(request, response);

		}else {
			msg = "수정을 실패하였습니다.";
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
