package com.kh.semi.board.parcelout.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.parcelout.model.service.UserBoardService;
import com.kh.semi.board.parcelout.model.vo.PageInfo;
import com.kh.semi.board.parcelout.model.vo.UserBoard;




@WebServlet("/parceloutSelect.bo")
public class SelectParceloutBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 보여질 게시물수
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표시될 페이징 버튼이 시작할 번호
		int endPage;		//한 번에 표시될 페이징 버튼이 끝나는 번호

		//시작할 페이지
		currentPage = 1;

		System.out.println("왜 여기로 들어오는건데 대체 왜 !!!");

		if(request.getParameter("currentPage") != null) {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));


		}

		//한 페이지에 보여질 목록 갯수
				limit = 5;

				//전체 목록 갯수를 리턴받음
				int listCount = new UserBoardService().getListoutCount();

				System.out.println("listCount  :" + listCount );

				//총 페이지 수 계산
				//예를 들면 , 목록수가 124개 이면 페이지 수는 13페이지이다.

				maxPage = (int) ((double) listCount / limit + 0.8) ; //0.9 짜투리가 1개 남으면 그놈은 0.1 이기때문에 0.9 를 더해줘서 1로 만들고 한페이지에 띄운다

				//현재 페이지에서 보여줄 시작 페이지 숫자
				//아래쪽에 페이지 수가 10개씩 보여지게 한다면
				//1, 11, 21, 31, ....
				startPage = ((int) ((double) currentPage / limit + 0.8) - 1) * 10 + 1;

				//목록 아래 쪽에 보여질 마지막 페이지 수
				//10 , 20 , 30 , 40, ....

				endPage = startPage + 10 -1 ;

				if(maxPage < endPage) {
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount , limit , maxPage, startPage, endPage);


				ArrayList<UserBoard> list = new UserBoardService().ParceloutList(currentPage, limit);





				String page = "";

				if(list != null) {
					page = "views/member/3_parcelout/2_reviewParcelout/1_main.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
				}else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회 실패!");
				}

				request.getRequestDispatcher(page).forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
