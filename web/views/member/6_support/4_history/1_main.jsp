<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE htm>
<html>

<head>
<meta charset=UTF-8">
<title>Insert title here</title>


<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>

	<div style="height:650px; text-align:center;">

	<h1>후원내역보기</h1>
	<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
				<table>
						<tr>
							<td><button class="btn btn-default" onclick="location.href='/sixDestiny/views/member/6_support/4_history/2_write.jsp'">글작성</button></td>
						</tr>
				</table>
	<% } %>
	<table>
		<tr>
			<td style=" padding-left:200px; width:1000px; text-align:left;"><a href="#" style="text-decoration:none;  color:red; font-size:1.2em;">◀ </a>7월 사용내역<a href="#" style="text-decoration:none; color:red; font-size:1.2em;"> ▶</a></td>
			<td><input type="button" value="영수증 출력하기" style=" padding:5px;border-radius: 10px; outline: none;"></td>
		</tr>
	</table>
	<br>
	<table align="center">
		<tr>
			<td style="width:350px; border-top:1px solid #999; border-bottom:1px solid #999;"></td>
			<td style="width:350px; border-top:1px solid #999; border-bottom:1px solid #999;">kyj9168님</td>
			<td style="width:350px; border-top:1px solid #999; border-bottom:1px solid #999;">2019-07-04</td>
		</tr>
	</table>

	<div style="margin:50px auto 50px auto; border:1px solid red; width:500px; height:300px;">영수증이미지???</div>

	<div style="text-align:left; padding:20px; border-radius:5px; margin:50px auto 50px auto; border:1px solid #999; width:800px; height:100px;">


	나비를 부탁해 님의 후원 내역은 100000원이고 사용내역은 사료 10000입니다.



	</div>

	</div>







<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>