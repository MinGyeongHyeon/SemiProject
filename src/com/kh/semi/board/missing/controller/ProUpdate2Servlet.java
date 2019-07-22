package com.kh.semi.board.missing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.missing.model.service.MissingService;
import com.kh.semi.board.missing.model.vo.Missing;
import com.kh.semi.user.model.vo.User;

/**
 * Servlet implementation class ProUpdate2Servlet
 */
@WebServlet("/proUpdate2.bo")
public class ProUpdate2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProUpdate2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String bKind="실종";
		String place=request.getParameter("place");
		String placedetail=request.getParameter("placedetail");
		String date=request.getParameter("missdate");
		String[] missdate = date.split("-");
		String resultDate = "";
		System.out.println(missdate.length +"길이");
		for(int i = 0; i < missdate.length; i++) {
			resultDate += missdate[i];
			System.out.println(resultDate);
		}
		System.out.println("입력폼 : " + date);
		System.out.println("베열 : " + missdate[0]);

		String gender= request.getParameter("gender");
		
		String phone=request.getParameter("phone");
		
		System.out.println("Date:"+resultDate);
		
	int writer = ((User) request.getSession().getAttribute("loginUser")).getUserNo();
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		
		//Board객체 생성
	Missing b = new Missing();
	b.setuNo(writer);
	b.setbNm(title);
	b.setbKind(bKind);
	b.setbCon(content);
	b.setMissDt(resultDate);
	
	b.setMissPlace(place);
	b.setMissPlaceDetail(placedetail);
	b.setMissDt(resultDate);
	b.setMissGender(gender);
	b.setbNo(boardNo);
	b.setMissPhone(phone);
	
	int result = new MissingService().updatePro(b);
System.out.println("진짜마지막ㄴㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄴㅁㅇㅁㄺㅂㅈㄱㄹ");
	String page = "";
	if(result > 0) {
		response.sendRedirect("/sixDestiny/proSelectOne.bo?num=" + boardNo);

	}

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
