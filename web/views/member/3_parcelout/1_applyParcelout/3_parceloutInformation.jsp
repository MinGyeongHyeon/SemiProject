<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.kh.semi.parcelout.model.vo.*"%>
    
    <% ParcelOut pco = (ParcelOut)request.getAttribute("pco"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="outer">
	
	<br>
	<h3>분 양 신 청 서</h3>
	<br>
	
	<table id="table">
	<tr>
		<td><b>분양신청번호</b></td>
		<%=pco.getSelAppDt() %>
	</tr>
	
	
	
	
	
	</table>





</div>
</body>
</html>