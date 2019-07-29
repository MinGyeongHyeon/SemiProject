<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html >
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Gaegu&display=swap"
	rel="stylesheet">

<style>
#mypage {
	margin: 0 auto;
	width:500px;
}

#mypagebutton {
	margin-left: 40%;
}

.test {
	margin-top: 5%;
}

table tr td.category {
	background: rgb(204, 230, 255);
	width: 75px;
	height: 50px;
	font-weight: bold;
}

table tr td.category2 {
	padding-left: 20%;
}

.submit2 {
	margin-left: 80%;
}

.br {
	margin: 0 auto;
}

label {
	font-family: 'Gaegu', cursive;
}
</style>

<title>Insert title here</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
</head>
<body>


	<div id="mypage">
		<div>
			<form action="">
			<br>
				<table>
					<tr>
						<td><br /></td>
					</tr>
					<tr class=category3>
						<td class=category><label for="">이름 </label></td>
						<td class="category2"><label><%=loginUser.getUserNm()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr class=category3>
						<td class=category><label>아이디 </label></td>
						<td class="category2"><label><%=loginUser.getUserId()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">닉네임</label></td>
						<td class="category2"><label><%=loginUser.getNickNm()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">이메일</label></td>
						<td class="category2"><label><%=loginUser.getEmail()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					
					<tr>
						<td class=category><label for="">핸드폰번호</label></td>
						<td class="category2">
							<% if(loginUser.getPhone()==null) { %>
							<label>정보없음</label>
							<%} else {%>
							<%=loginUser.getPhone()%>
							<%} %>
						</td>
					</tr>
					
					<tr>
						<td><br /></td>
					</tr>
					
					<tr>
						<td class=category><label for="">생년월일</label></td>
						<td class="category2"><label><%=loginUser.getUserHb()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">성별</label></td>
						<td class="category2"><label><%=loginUser.getGender()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">주소</label></td>
						<td class="category2"><label><%=loginUser.getAddress()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">반려견 유무</label></td>
						<td class="category2"><label><%=loginUser.getDogYn()%></label></td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
				</table>
				
				<br>
				
				<table class="br">
					<tr>
						<td><input type="button" value="회원정보 수정" onclick="location.href='/sixDestiny/views/member/7_member/3_mypage/3_modify.jsp'"></td>
						<td><input type="button" value="회원 탈퇴" class="submit2" onclick="location.href='/sixDestiny/views/member/7_member/3_mypage/2_secession.jsp'">
						</td>
					</tr>
				</table>
			</form>

		</div>


	</div>


<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>