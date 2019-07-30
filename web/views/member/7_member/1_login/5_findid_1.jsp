<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>

<%
	User us = (User) request.getAttribute("us");
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>

.finid{
font-family: 'Sunflower';
font-size: : 100px;
}
</style>

<body>
<% if(us != null){ %>
	<pre class="finid"><%= us.getUserNm() %> 님의  아이디는 <%= us.getUserId() %> 입니다 !</pre>
	<%}else if(msg != null){%>
		<pre class="finid"><%= msg %></pre>

		<%} %>


<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>