package com.kh.semi.board.parcelout.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.UserBoardService;
import com.kh.semi.board.model.vo.Attachment;
import com.kh.semi.board.model.vo.UserBoard;
import com.kh.semi.user.model.vo.User;


@WebServlet("/selectParceloutOne.tn")
public class SelectParceloutOne extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));

			HashMap<String,Object> hmap = new UserBoardService().selectParceloutOne(num);

			UserBoard ub = (UserBoard) hmap.get("ParceloutBoard");

			ArrayList<Attachment> filelist = (ArrayList<Attachment>) hmap.get("attachment");

			User us = (User) hmap.get("User");


			String page = "";

			if(hmap != null) {
				page = "views/member/3_parcelout/2_reviewParcelout/3_read.jsp";
				request.setAttribute("ParceloutBoard", ub);
				request.setAttribute("filelist", filelist);
				request.setAttribute("User", us);

			}


			request.getRequestDispatcher(page).forward(request, response);





	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
