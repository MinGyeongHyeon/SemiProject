package com.kh.semi.board.missing.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.missing.model.service.MissingService;
import com.kh.semi.board.missing.model.vo.Missing;
import com.kh.semi.board.missing.model.vo.MissingAttachment;


/**
 * Servlet implementation class MissingSelectOneServlet
 */
@WebServlet("/missingSelectOne.bo")
public class MissingSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MissingSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	int num = Integer.parseInt(request.getParameter("num"));
	
	System.out.println(num);
		
		HashMap<String, Object> hmap = new MissingService().missingselectThumbnailMap(num);
		
		Missing b = (Missing) hmap.get("board");
		System.out.println("보드?????????/"+b);
		ArrayList<MissingAttachment> fileList = 
				(ArrayList<MissingAttachment>) hmap.get("attachment");
		
		String page = "";
		
		if(hmap != null) {
			page = "views/member/4_missing/1_fine/3_read.jsp";
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
		}/*else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사진 게시판 상세보기 실패!");
		}
		*/
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
