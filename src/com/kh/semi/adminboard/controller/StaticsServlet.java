package com.kh.semi.adminboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.adminboard.model.service.AdminBoardService;
import com.kh.semi.adminboard.model.vo.AdminStatic;


@WebServlet("/statics")
public class StaticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String, Object>> as= new AdminBoardService().statics();
		ArrayList<HashMap<String, Object>> as2= new AdminBoardService().statics2();
		ArrayList<HashMap<String, Object>> as3= new AdminBoardService().statics3();
		ArrayList<HashMap<String, Object>> as4= new AdminBoardService().statics4();
		ArrayList<HashMap<String,Object>> as5 = new AdminBoardService().statics5();

		System.out.println("as5 의 값 : " + as5.get(0).get("enroll1"));


		String page = "";
		if(as != null) {
			System.out.println("냥냥");
			page = "views/admin/1_admin/7_statistics.jsp";
			request.setAttribute("static", as);
			request.setAttribute("static2", as2);
			request.setAttribute("static3", as3);
			request.setAttribute("static4", as4);
			request.setAttribute("static5", as5);

		}
		request.getRequestDispatcher(page).forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
