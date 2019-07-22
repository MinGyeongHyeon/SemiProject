<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.model.vo.*"%>
<%
	UserBoard ub = (UserBoard) request.getAttribute("ub");
%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>자유게시판 글보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div>

		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목 : <%=ub.getbNm()%></th>
						<th>글쓴이 : <%=ub.getbUserNick() %></th>
						<th> 작성날짜 : <%=ub.getbDate() %></th>
						<th>추천수 : <%=ub.getRecCon() %></th>
						<th>조회수 : <%=ub.getInqCon() %></th>
						<th><input type="button" value="추천"> <input
							type="button" value="신고"></th>
					</tr>
				</thead>
			</table>
		</div>


		<div style="padding: 30px" align="center">
			<img
				src="https://image-notepet.akamaized.net/resize/620x-/seimage/20190222%2F88df4645d7d2a4d2ed42628d30cd83d0.jpg"
				alt="Nature">
			<p style="width: 1000px; padding: 80px;"><%=ub.getbCon() %></p>
		</div>

		<hr>

		<div align="center" style="padding: 20px">

			<div>댓글쓴이 : 댓글내용입니다</div>
			<div>댓글쓴이 : 댓글내용입니다</div>
			<div>댓글쓴이 : 댓글내용입니다</div>

		</div>
		<hr>

		댓글 <input type="text" style="width: 600px"> <input
			type="submit" value="댓글 달기">
			<% if(loginUser != null && loginUser.getNickNm().equals(ub.getbUserNick())){ %>
				<button onclick="location.href='<%=request.getContextPath()%>/select.bo?num=<%=ub.getuNo()%>'">수정하기</button>
				<% } %>

	</div>

<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
