<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.user.model.vo.User"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>분양후기 글보기</title>
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
						<th>분양후기 제목을 입력하세요</th>
						<th>글쓴이</th>
						<th>2019-07-12</th>
						<th>추천수:</th>
						<th>조회수:</th>
						<th><input type="button" value="추천">
						<% if(loginUser != null) {%>
						<input type="button" value="신고"></th>
						<% } %>
							<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>

									<th><input type="button" value="삭제"></th>

							<% } %>
					</tr>
				</thead>
			</table>
		</div>


		<div style="padding: 30px" align="center">
			<img
				src="https://image-notepet.akamaized.net/resize/620x-/seimage/20190222%2F88df4645d7d2a4d2ed42628d30cd83d0.jpg"
				alt="Nature">
			<p style="width: 1000px; padding: 80px;">글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@ 글 내용입니다@글
				내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@ 글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@ㅍㅍㅍ글 내용입니다@글 내용입니다@ 글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글 내용입니다@글
				내용입니다@글 내용입니다@</p>
		</div>

		<hr>

		<div align="center" style="padding: 20px">

			<div>댓글쓴이 : 댓글내용입니다 <% if(loginUser != null &&loginUser.getUserId().equals("admin")){ %>  <button>삭제</button>   <% } %></div>
			<div>댓글쓴이 : 댓글내용입니다</div>
			<div>댓글쓴이 : 댓글내용입니다</div>




		</div>
		<hr>

	<% if(loginUser != null) { %>
		댓글 <input type="text" style="width: 600px"> <input
			type="submit" value="댓글 달기">

		<% } %>








	</div>




<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
