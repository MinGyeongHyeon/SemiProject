package com.kh.semi.entrance.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.adminboard.model.vo.PageInfo;
import com.kh.semi.entrance.model.service.EntranceService;
import com.kh.semi.entrance.model.vo.EntranceDogInfo;

/**
 * Servlet implementation class SelectAllEntranceDogInfoServlet
 */
@WebServlet("/selectAlldog.ent")
public class SelectAllEntranceDogInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 10;


		int listCount = new EntranceService().getMyEntranceDogListCount();

		//System.out.println("list Count : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;


		endPage = startPage + 10 - 1;


		if(maxPage < endPage) {
			endPage = maxPage;
		}


		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<EntranceDogInfo> list = new EntranceService().selectAllEntranceDog(currentPage, limit);

		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			System.out.println("오류났당");
		}

		request.getRequestDispatcher("views/admin/1_admin/8_dogInfoManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
