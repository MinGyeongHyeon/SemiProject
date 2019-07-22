package com.kh.semi.moneysup.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.adminboard.model.vo.PageInfo;
import com.kh.semi.moneysup.model.service.MoneySupService;
import com.kh.semi.moneysup.model.vo.MoneySup;

/**
 * Servlet implementation class SelectAllUserMoneyServlet
 */
@WebServlet("/selectAllMonsup")
public class SelectAllUserMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿호출...제발...");

		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;


		currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 5;

		int listCount = new MoneySupService().getListCount();

		System.out.println("list Count : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.8);

		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;

		endPage = startPage + 10 - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<MoneySup> list = new MoneySupService().selectList(currentPage, limit);

		String page = "";

		System.out.println("후원내역 객체  : " + list);

		if(list != null) {
			page = "views/admin/1_admin/6_supportManagement.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			/*page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");*/
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
