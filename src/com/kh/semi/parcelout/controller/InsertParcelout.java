package com.kh.semi.parcelout.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.parcelout.model.service.ParcelOutService;
import com.kh.semi.parcelout.model.vo.Application;
import com.kh.semi.user.model.vo.User;


@WebServlet("/Insert.po")
public class InsertParcelout extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String applic = request.getParameter("applic1");
			String applic2 = request.getParameter("applic2");
			String applic3 = request.getParameter("applic3");
			String applic4 = request.getParameter("applic4");
			String applic5 = request.getParameter("applic5");
			String applic6 = request.getParameter("applic6");
			String drop = request.getParameter("drop");
			String answer = request.getParameter("answer");
			String applic8 = request.getParameter("applic8");
			String applic9 = request.getParameter("applic9");
			String applic10 = request.getParameter("applic10");
			String applic11 = request.getParameter("applic11");
			String applic12 = request.getParameter("applic12");
			String applic13 = request.getParameter("applic13");
			String applic14 = request.getParameter("applic14");
			String applic15 = request.getParameter("applic15");
			String applic16 = request.getParameter("applic16");
			String applic17 = request.getParameter("applic17");
			String applic18 = request.getParameter("applic18");
			int userNo = Integer.parseInt(request.getParameter("userNo"));

			User us = new User();

			us.setUserNo(userNo);

			ArrayList<Application> list = new ArrayList<Application>();

			Application ap = null;
			for(int i = 0; i <= 18; i++) {
				ap = new Application();

				ap.setApplication(applic +"" + i);

				list.add(ap);

			}




			int result = new ParcelOutService().insertApplication(ap,us);

			String page = "views/member/3_parcelout/2_reviewParcelout/1_main.jsp";
			if(result > 0) {
				request.setAttribute("n", "성공");
				request.getRequestDispatcher(page).forward(request, response);
			}






	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
