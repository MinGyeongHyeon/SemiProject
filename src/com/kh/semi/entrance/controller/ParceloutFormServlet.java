package com.kh.semi.entrance.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.parcelout.model.service.ParcelOutService;
import com.kh.semi.parcelout.model.vo.ParcelOut;

/**
 * Servlet implementation class ParceloutFormServlet
 */
@WebServlet("/parceloutform")
public class ParceloutFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParceloutFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pcoAppNo = Integer.parseInt(request.getParameter("pcoAppNo"));
		
		ParcelOut pco = new ParcelOutService().parceloutInfo(pcoAppNo);
		
		request.setAttribute("pco",pco);
				
		request.getRequestDispatcher("views/member/3_parcelout/1_applyParcelout/3_parceloutInformation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
