package com.kh.semi.board.parcelout.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.parcelout.model.service.UserBoardService;
import com.kh.semi.board.parcelout.model.vo.PageInfo;



@WebServlet("/outSelect.po")
public class OutSelectConUno extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String outselect = request.getParameter("outselect");
		String selectinput = request.getParameter("selectinput");

		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		String currentPage1 = null;
		String[] currentPage2 = null;

		if(request.getParameter("currentPage1") != null) {
			currentPage1 = request.getParameter("currentPage1");
			currentPage2 = currentPage1.split(",");

			System.out.println(currentPage1);
			System.out.println(currentPage2[0]);
			System.out.println(currentPage2[1]);

		}


		currentPage = 1;


		if(request.getParameter("currentPage") != null) {

			System.out.println("페이지 들어온값 : " +currentPage1);
			currentPage = Integer.parseInt(request.getParameter("currentPage"));



		}


				limit = 5;


				int listCount = new UserBoardService().getListoutCount();




				maxPage = (int) ((double) listCount / limit + 0.8) ;


				startPage = ((int) ((double) currentPage / limit + 0.8) - 1) * 5 + 1;



				endPage = startPage + 5 -1 ;

				if(maxPage < endPage) {
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount , limit , maxPage, startPage, endPage);

		System.out.println("여기 안들어오냐 ?;;");

		System.out.println(selectinput);
		System.out.println(outselect);

		ArrayList<HashMap<String,Object>> filelist = new UserBoardService().outselectConUno(outselect,selectinput);

		ArrayList<HashMap<String,Object>> filelist2 = new UserBoardService().selectOutList2(1,5);



		String page = "";
		if(filelist != null) {
			page = "views/member/3_parcelout/2_reviewParcelout/1_main.jsp";
			request.setAttribute("filelist", filelist);
			request.setAttribute("filelist2", filelist2);
			request.setAttribute("pi", pi);
			request.setAttribute("PagingSelect", 1);

			System.out.println("널값이 아닐떄 여기까지 들어옴?");

		}
		request.getRequestDispatcher(page).forward(request, response);

	}





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		doGet(request, response);


	}

}
