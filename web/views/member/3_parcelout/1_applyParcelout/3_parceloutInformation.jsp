<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.kh.semi.parcelout.model.vo.*"%>
    
    <% ParcelOut pco = (ParcelOut)request.getAttribute("pco"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>신청서 상세내역</title>
<style>
table {
  border-collapse: collapse;
  width: 90%;
  margin:0 auto;
}

#outer{
	text-align:center;
	margin: 0 auto;
	font-family: 'Do Hyeon', sans-serif;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
<div id="outer">
	<br>
	<h2>분 양 신 청 서</h2>
	<br>
	<table id="table">
	<tr>
		<td><b>분양신청번호</b></td>
		<td><%=pco.getPcoAppNo() %><td>
	</tr>
	
	<tr>
		<td><b>회원번호</b></td>
		<td><%=pco.getUserNo() %></td>
	</tr>
	
	<tr>
		<td><b>면담희망 일자</b></td>
		<td><%=pco.getSelAppDt()%></td>
	</tr>
	
	<tr>
		<td><b>상태</b></td>
		<td><%=pco.getPcoSit() %></td>
	</tr>
	
	<tr>
		<td><b>분양반려이유</b></td>
		<td><%=pco.getCompanionRs() %></td>
	</tr>
	
	
	
	
	
	</table>
<br><br>
</div>
</body>
</html>