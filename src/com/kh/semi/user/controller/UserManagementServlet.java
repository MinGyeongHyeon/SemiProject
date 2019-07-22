package com.kh.semi.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.user.model.service.UserService;
import com.kh.semi.user.model.vo.User;

/**
 * Servlet implementation class UserManageServlet
 */
@WebServlet("/userManage")
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<User> list = new UserService().selectList();

		System.out.println(list);

		String page = "";

		if(list!=null) {
			page = "views/admin/1_admin/1_userManagement.jsp";
			request.setAttribute("list", list);
		}else {
			page="views/common/bottom_Include.jsp";
			request.setAttribute("msg", "실패");
		}

		request.getRequestDispatcher(page).forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
