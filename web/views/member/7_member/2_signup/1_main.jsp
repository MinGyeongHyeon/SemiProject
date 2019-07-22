<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
			<img src="/sixDestiny/views/images/signup.PNG" id="img"
				style="width: 170px;">
		</div>
		<br> <br> <br>
		<div>
			<button id="button"
				onclick="location.href='/sixDestiny/views/member/7_member/2_signup/2_acceptterms.jsp'">ID/PW
				로 회원가입</button>
		</div>
		<br>
		<div>
			<button id="button2"
				onclick="location.href='/sixDestiny/views/member/7_member/2_signup/4_signupKakao.jsp'">카카오 계정으로 회원가입</button>
		</div>
	</div>
	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>