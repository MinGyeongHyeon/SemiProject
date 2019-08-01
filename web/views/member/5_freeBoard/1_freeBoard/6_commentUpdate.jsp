<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int thisCommentNo = Integer.parseInt(request.getParameter("thisCommentNo"));
  
	String msg = (String) request.getAttribute("msg");

    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

</head>
<body>
	<form action="<%= request.getContextPath() %>/updateCom.ub" method="post">

	<div style="text-align:center;">
	<h2><%=thisCommentNo %>번 댓글 수정</h2>
	<br>
	<textArea id="comcon" name="comcon" style="resize: none; width: 300px; height: 50px; "placeholder="글자 수는 60자로 제한" maxlength="60"></textArea>
	<br>
	<input type="submit" class="btn btn-default" style="outline:none;" value="확인">
	</div>
	
	</form>
	
	
<script type="text/javascript">

$(function(){
	console.log("바로 실행안돰?>")
	var msg = <%= "'" + msg + "'" %>

	console.log(msg);

	if(msg.length > 5){
	alert(msg);
	window.close();

	}

</script>
</body>
</html>