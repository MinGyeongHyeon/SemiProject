package com.kh.semi.board.missing.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.board.missing.model.service.MissingService;
import com.kh.semi.board.missing.model.vo.Comment;

/**
 * Servlet implementation class ProComment
 */
@WebServlet("/ProComment")
public class ProComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("procomment호풀");
		
		String comment = request.getParameter("comment");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int uNo = Integer.parseInt(request.getParameter("uNo"));

		Comment cm = new Comment();

		cm.setbNo(bNo);
		cm.setComment(comment);
		cm.setuNo(uNo);

		ArrayList<Comment> list = new MissingService().comment2(cm);

		System.out.println("list 값 : " + list);


		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
