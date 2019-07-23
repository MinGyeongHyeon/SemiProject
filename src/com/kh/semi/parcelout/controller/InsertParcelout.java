package com.kh.semi.parcelout.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Insert.po")
public class InsertParcelout extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String applic1 = request.getParameter("applic1");
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

			System.out.println("applic1 : " + applic1);
			System.out.println("applic2 : " + applic2);
			System.out.println("applic3 :" + applic3);
			System.out.println("applic4 : "+applic4);
			System.out.println("applic5 : "+applic5);
			System.out.println("applic6 : "+applic6);
			System.out.println("drop : "+drop);
			System.out.println("answer : "+answer);
			System.out.println("applic8 : "+applic8);
			System.out.println("applic9 : "+applic9);
			System.out.println("applic10 : "+applic10);
			System.out.println("applic11 : "+applic11);
			System.out.println("applic12 : "+applic12);
			System.out.println("applic13 : "+applic13);
			System.out.println("applic14 : "+applic14);
			System.out.println("applic15 : "+applic15);
			System.out.println("applic16 : "+applic16);
			System.out.println("applic17 : "+applic17);
			System.out.println("applic18 : "+applic18);


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
