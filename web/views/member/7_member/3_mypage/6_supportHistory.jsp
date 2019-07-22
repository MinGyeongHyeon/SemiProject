<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
<style>
#btn1 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
}

#btn2 {
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-left: -3px;
}

#btn3 {
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
}

#btn4 {
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-left: -3px;
}

#buttongp {
	border: 5px solid skyblue;
	background-color: white;
	color: skyblue;
	padding: 2px;
}

#buttongp:hover {
	color: white;
	background-color: skyblue;
}
#btnsin{
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-left: -3px;
	background-color:skyblue;
}
#btnchiso{
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-left: -3px;
	background-color:orangered;
	color:white;
}

table.type01 {
	border-collapse: collapse;
	text-align: bottom;
	line-height: 1.5;
}

table.type01 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type01 tbody th {
	width: 100px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type01 td {
	width: 50px;
	padding: 5px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type02 {
	border-collapse: collapse;
	text-align: top;
	line-height: 1.0;
}

table.type02 th {
	width: 100px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: lightgray;
}

table.type02 td {
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

textarea {
	width: 100%;
}
</style>
</head>
<body>
	<br />
	<div align="center">
		<img src="/web/images/dog.png">
	</div>
	<br />
	<div id="buttongp">
		<button id="btn1">개인정보</button>
		<button id="btn2">신청내역</button>
		<button id="btn3">내 게시글</button>
		<button id="btn4">후원내역</button>
	</div>
	<h3>입소신청내역</h3>
	<table align="center" class="type01">
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>면담날짜</th>
		<th>입소견번호</th>
		<th>신청서</th>
		<th>진행상황</th>
		<th>취소</th>
		<tr>
			<td>1</td>
			<td>전지용</td>
			<td>jeon</td>
			<td>2019-08-01</td>
			<td>102918</td>
			<td><button id="btnsin">보기</button></td>
			<td>신청접수중</td>
			<td><button id="btnchiso">접수취소</button></td>
		</tr>
		<tr>
			<td>1</td>
			<td>전지용</td>
			<td>jeon</td>
			<td>2019-08-01</td>
			<td>102919</td>
			<td><button id="btnsin">보기</button></td>
			<td>신청접수중</td>
			<td><button id="btnchiso">접수취소</button></td>
		</tr>
		<tr>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
		</tr>
	</table>
	<br />
	<h3>분양신청내역</h3>
	<table align="center" class="type01">
		<th>회원번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>면담날짜</th>
		<th>분양견번호</th>
		<th>신청서</th>
		<th>진행상황</th>
		<th>취소</th>
		<tr>
			<td>1</td>
			<td>전지용</td>
			<td>jeon</td>
			<td>2019-08-01</td>
			<td>102918</td>
			<td><button id="btnsin">보기</button></td>
			<td>신청접수중</td>
			<td><button id="btnchiso">접수취소</button></td>
		</tr>
		<tr>
			<td>1</td>
			<td>전지용</td>
			<td>jeon</td>
			<td>2019-08-01</td>
			<td>102919</td>
			<td><button id="btnsin">보기</button></td>
			<td>신청접수중</td>
			<td><button id="btnchiso">접수취소</button></td>
		</tr>
		<tr>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<td>--</td>
		</tr>
	</table>
	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>


















