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

			String applic1 = request.getParameter("applic1");
			String applic2 = request.getParameter("applic2");
			String applic3 = request.getParameter("applic3");
			String applic4 = request.getParameter("applic4");
			String applic5 = request.getParameter("applic5");
			String applic6 = request.getParameter("applic6");
			String applic7 = request.getParameter("applic7");
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
			String applic19 = request.getParameter("applic19");
			String applic20 = request.getParameter("applic20");
			String applic21 = request.getParameter("applic21");
			String applic22 = request.getParameter("applic22");

			String applic66 = applic5 + "," + applic6;

			String[] str = applic21.split("/");
			String[] str2 = applic22.split("~");
			String[] str3 = str2[0].split(":");

			String str1 = str[2] + str[0] + str[1] + str3[0] + str3[1];

			System.out.println(str1);

			int userNo = Integer.parseInt(request.getParameter("userNo"));

			User us = new User();
			Application ap = new Application();

			ap.setApplication(str1);
			us.setUserNo(userNo);

			ArrayList<String> list = new ArrayList<String>();



				list.add(applic1);
				list.add(applic2);
				list.add(applic3);
				list.add(applic4);
				list.add(applic66);
				list.add(applic7);
				list.add(applic8);
				list.add(applic9);
				list.add(applic10);
				list.add(applic11);
				list.add(applic12);
				list.add(applic13);
				list.add(applic14);
				list.add(applic15);
				list.add(applic16);
				list.add(applic17);
				list.add(applic18);
				list.add(applic19);
				list.add(applic20);







			int result = new ParcelOutService().insertApplication(list,us,ap);






	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
