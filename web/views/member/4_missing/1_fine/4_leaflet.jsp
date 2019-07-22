<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#totaldiv {
	width: 500px;
	height: 820px;
	margin: 0 auto;
	border: 1px solid gray;
}
</style>
<link rel="stylesheet" href="/css/bootstrap.css">

</head>
<body>

	<div id="totaldiv">
		<table align="center">
			<tr>
				<td><p style="font-size: 30px">강아지를 찾습니다</p></td>
			</tr>
			<tr>
				<td><img style="height: 300px; width: 300px"></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><span>연락처 쓰는칸</span></td>
			</tr>
			<tr>
				<td><span>사례금 쓰는칸</span></td>
			</tr>
			<tr>
				<td><span>장소 쓰는 칸</span></td>
			</tr>
			<tr>
				<td><span>날짜 쓰는 칸</span></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" readonly>특징 쓰는 칸</textarea></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><button onclick="content_print();">출력하기</button></td>
			</tr>
		</table>
	</div>

	<script>
		function content_print() {

			var initBody = document.body.innerHTML;
			window.onbeforeprint = function() {
				document.body.innerHTML = document.getElementById('totaldiv').innerHTML; //원하는 div 영역 프린트
			}
			window.onafterprint = function() {
				document.body.innerHTML = initBody;
			}
			window.print();
		}
	</script>


	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>