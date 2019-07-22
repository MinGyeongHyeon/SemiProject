<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html  lang="ko">
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">

<title>후원취소</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
<style>

	div{
	font-family: 'Do Hyeon', sans-serif;
	}

	#div1{
		margin:0 auto;
	}

	#div2{
		margin:30px;
	}
	.text1{
		width:300px;
	}

@import url('https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap&subset=korean');

</style>
</head>

<body>

<div>

<div id="div1">
<input type="button" value="개인정보"> &nbsp;
<input type="button" value="신청내역"> &nbsp;
<input type="button" value="내 게시글"> &nbsp;
<input type="button" value="후원내역"> &nbsp;


<br>
<br>

<h2>취소사유를 선택해주세요</h2>

<br>

<input type="radio" name="후원취소" value="reason1">금전적 부담으로 인하여 <br><br>
<input type="radio" name="후원취소" value="reason2">보호소에 대한 불만으로 인하여 <br><br>
<input type="radio" name="후원취소" value="reason3">타 사이트 이용을 위해 <br><br>
<input type="radio" name="후원취소" value="reason4">기타 &nbsp; <input type="text" class="text1" placeholder="내용을 입력해주세요"><br>





</div>


<div id="div2">

<input type="submit" value="취소신청">


</div>

</div>

<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>