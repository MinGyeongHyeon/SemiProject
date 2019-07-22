<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../common/inner_admin_include.jsp" %>
</head>
<style>

table.apply1 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.apply1 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: lightgray;
}

table.apply1 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.apply2 {
	border-collapse: collapse;
	text-align: top;
	line-height: 1.0;
}

table.apply2 th {
	width: 150px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: lightgray;
}

table.apply2 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}


</style>
<body>

<div>
<h3>입소신청 내역</h3>
<table class="apply1">
	<tbody>
		<tr>

			<th>회원번호</th>

			<th>이름</th>

			<th>아이디</th>

			<th>면담날짜</th>

			<th>입소견번호</th>

			<th>신청서</th>
				<th>진행사항</th>
		</tr>
			<tr>

			<td>102</td>

			<td>오수정</td>

			<td>user02</td>

			<td>2019-05-06</td>

			<td>300</td>

			<td><button>보기</button></td>
			<td>
			<select>
			<option>신청반려</option>
			<option>신청진행중</option>
			<option>면담완료</option>
			<option>입소반려</option>
			<option>입소진행중</option>

			</select>
			</td>
		</tr>




		</tbody>
	</table>

</div>



<div>

<h3>분양신청 내역</h3>
<table class="apply1">
	<tbody>
		<tr>

			<th>회원번호</th>

			<th>이름</th>

			<th>아이디</th>

			<th>면담날짜</th>

			<th>분양견번호</th>

			<th>신청서</th>
				<th>진행사항</th>
		</tr>
			<tr>

			<td>102</td>

			<td>오수정</td>

			<td>user02</td>

			<td>2019-05-06</td>

			<td>300</td>

			<td><button>보기</button></td>
			<td>
			<select>
			<option>신청반려</option>
			<option>신청진행중</option>
			<option>면담완료</option>
			<option>분양반려</option>
			<option>분양진행중</option>

			</select>
			</td>
		</tr>




		</tbody>
	</table>

</div>





<%@ include file="../../common/bottom_Include.jsp"%>
</body>
</html>