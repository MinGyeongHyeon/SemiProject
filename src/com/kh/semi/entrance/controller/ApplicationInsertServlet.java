package com.kh.semi.entrance.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ApplicationInsert")
public class ApplicationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String entName = request.getParameter("entName");
		String entPhone1 = request.getParameter("entPhone1");
		String entPhone2 = request.getParameter("entPhone2");
		String entPhone3 = request.getParameter("entPhone3");
		String entPhone = entPhone1 +"-"+entPhone2 +"-"+entPhone3;
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String addres = request.getParameter("addres");
		String addres2 = request.getParameter("addres2");
		String addreslist = addres + addres2;
		String test = request.getParameter("test");
		String test2 = request.getParameter("test2");

		String dogName = request.getParameter("dogName");
		String dogAge = request.getParameter("dogAge");
		String dogender = request.getParameter("doggender");
		String dog = request.getParameter("dog");
		String test3 = request.getParameter("test3");
		String ke = request.getParameter("ke");
		String inoculation = request.getParameter("inoculation");
		String[] t1 = request.getParameterValues("t1");

		String[] str = test.split("/");

		System.out.println(t1);




		java.sql.Date day = null;

		if(!birthday.equals("")) {

			day = java.sql.Date.valueOf(birthday);

		}else {

			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());

		}

		System.out.println("넌 어떠니 : " + birthday);
		System.out.println("잘 넘어옴 ? : " +entName);
		System.out.println("너희들은? : " + entPhone1 +entPhone2 +entPhone3);
		System.out.println("넘어온 값 : " + gender);
		System.out.println("주소 : " + addreslist);
		System.out.println("상담 일자 : "  + test);
		System.out.println("여기 : " + test2);
		System.out.println(dogName);
		System.out.println(dogAge);
		System.out.println(dogender);
		System.out.println(dog);


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
