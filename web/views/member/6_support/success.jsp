<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Gaegu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gaegu|Sunflower:300&display=swap" rel="stylesheet">

<style>
.display{
	display: inline;
	font-family: 'Gaegu', cursive;
	font-size: 30px;
}
.Name{
	display: inline;
	font-family: 'Gaegu', cursice;
	font-size: 50px;
}
.mainbutton{
	margin-top: 3%;
	margin-left: 40%;
}


</style>
</head>
<body>


<div>
	<h2 class="Name" ><%= loginUser.getUserNm() %></h2> <p class="display">님이 요청 하신 후원 신청이 완료 되었습니다. <br />
	물품 후원 일 경우 배송사는 편하신 곳으로 선택하시어 <br /> 꼭 배송비 선불로 지불하여 주시기 바랍니다.
	<br /> 다시한번  </p> <h2 class="Name"><%= loginUser.getUserNm() %> </h2> <p class="display">님  감사합니다!</p>
</div>

<div>
	<button class="mainbutton" onclick="location.href='../../../../sixDestiny'">메인으로</button>
</div>



<%@ include file="../../common/bottom_Include.jsp"%>
</body>
</html>