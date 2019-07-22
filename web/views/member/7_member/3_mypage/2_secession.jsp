<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
<style>
#button {
	background: dimgray;
	Color: white;
	width: 300px;
	height: 50px;
	margin: 30px;
}
#div1{
	background: skyblue;
	Color: #000;
	margin: 30px;
}
#div2{
	Color:red;
	margin: 80px;
}
</style>
</head>
<body>
	<h2 id="div2">탈퇴 사유</h2>
	<form action="<%=request.getContextPath()%>/usersec" method="post">
		<div id="div1">
			<select  name="leaveRsCd">
				<option value="L1">서비스 이용 불필요</option>
				<option value="L2">사이트 불신</option>
				<option value="L3">재가입을 위해서</option>
				<option value="L4">컨텐츠 부족</option>
				<option value="L5">기타</option>
			</select>
		</div>
		<div>
			<button id="submit" onclick="location.href='/sixDestiny/index.jsp'">탈퇴</button>
		
		</div>
	</form>
	
	
	
	
	
	
	
	
<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>