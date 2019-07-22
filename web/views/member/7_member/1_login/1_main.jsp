<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
#button {
	background: dimgray;
	Color: white;
	width: 300px;
	height: 50px;
}

#button2 {
	background: yellow;
	Color: Shaddlebrown;
	width: 300px;
	height: 50px;
	font-weight: bold;
}
</style>
<body>
	<div>
		<div>
			<img src="/sixDestiny/views/images/rogin.PNG" style="width: 170px;">
		</div>
		<br>
		<br>
		<br>
		<div>
			<button type="button" class="btn btn-info" onclick="location.href='2_login.jsp'"
					style="width:300px; height:80px; font-family: 'Sunflower', sans-serif; ">ID/PW 로
				로그인</button>
		</div>
		<br>
		<div>
			<button type="button" class="btn btn-warning"
					style="width:300px; height:80px; font-family: 'Sunflower', sans-serif;">카카오톡으로 로그인</button>
		</div>
	</div>

<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>