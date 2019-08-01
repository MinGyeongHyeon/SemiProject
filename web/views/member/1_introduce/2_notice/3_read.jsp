<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.adminboard.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>
<%
	AdminBoard ab = (AdminBoard) request.getAttribute("ab");
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 글보기 </title>
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

<div class="container">
	<%-- <table border="1" width="100%">
		<tr>
			<td colspan="2" style="font-size:2em; font-weight:bold; font-family: 'Sunflower', sans-serif;">
				<%= ab.getTitle() %>
			</td>
		</tr>
		<tr>
			<td rowspan="3" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">
				<%= ab.getNickNm() %>
			</td>
		</tr>
		<tr>
			<td style="font-weight:bold; font-family: 'Sunflower', sans-serif;">
				<%= ab.getWriteDt() %>
			</td>
		</tr>
		<tr>
			<td rowspan="4"><img src="" alt=""></td>
		</tr>
		<tr>
			<td style="font-weight:bold; font-family: 'Sunflower', sans-serif;">
				조회수 : <%= ab.getRecCount() %>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="font-family: 'Sunflower', sans-serif; height:500px;">
				<%= ab.getAdBoardCon() %>
			</td>
		</tr>
	</table> --%>
	<table class="table table-hover">
				<thead>
					<tr>
					<td><input style="display: none;" value="<%= ab.getTitle() %>">
					<% if(loginUser != null) {%>
						<input type="hidden" value="<%= loginUser.getUserNo() %>">
					<% } %>
					</td>
						<th>제목 : <%= ab.getTitle() %></th>
						<th>작성자 : <%= ab.getNickNm() %></th>
						<th>작성일 : <%= ab.getWriteDt() %></th>
						<th id="thtest2">조회수 : <%= ab.getRecCount() %></th>

						<% if(loginUser != null) { %>
							<% if(loginUser.getUserId().equals("admin")){ %>
									<th><input type="button" value="수정" id="update"></th>
									<th><input type="button" value="삭제" id="delete"></th>
								<% } %>
							<% } %>
					</tr>
				</thead>
			</table>
</div>
	<br>
	<div align="center">
		<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif;" onclick="location.href='<%=request.getContextPath()%>/select.no'">메뉴로 돌아가기</button>
	</div>

<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
