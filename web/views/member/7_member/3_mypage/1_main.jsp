<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html >
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
#mypage {
	margin-left: 38%;
	width:500px;
	font-family: 'Nanum Gothic', sans-serif;
}

table tr td.category {
	background: rgb(204, 230, 255);
	width: 95px;
	height: 45px;
	font-weight: bold;
}

table tr td.category2 {
	padding-left: 10%;
}

#under{
	margin-left: 10%;
}

</style>

<title>Insert title here</title>
<%@ include file="../../../common/inner_user_include.jsp" %>
</head>
<body>

	<%--전체 div --%>
	<div id="mypage">
	
		<div>
			<form>
			<br>
				<table>
					<tr>
						<td><br></td>
					</tr>
					<tr class=category3>
						<td class=category><label for="">이름 </label></td>
						<td class="category2"><label><%=loginUser.getUserNm()%></label></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr class=category3>
						<td class=category><label>아이디 </label></td>
						<td class="category2"><label><%=loginUser.getUserId()%></label></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td class=category><label for="">닉네임</label></td>
						<td class="category2"><label><%=loginUser.getNickNm()%></label></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td class=category><label for="">이메일</label></td>
						<td class="category2"><label><%=loginUser.getEmail()%></label></td>
					</tr>
					<tr>
						<td><br></td>
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
						<td><br></td>
					</tr>
					
					<tr>
						<td class=category><label for="">생년월일</label></td>
						<td class="category2">
							<%if(loginUser.getUserHb()==null) {%>
							<label>정보없음</label>
							<%}else{ %>
							<label><%=loginUser.getUserHb()%></label>
							<%} %>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td class=category><label for="">성별</label></td>
						<td class="category2">
							<%if(loginUser.getGender()==null) {%>
							<label>정보없음</label>
							<%}else{ %>
							<label><%=loginUser.getGender()%></label>
							<%} %>
						</td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">주소</label></td>
						<td class="category2">
							<%if(loginUser.getAddress()==null) {%>
							<label>정보없음</label>
							<%}else{ %>
							<label><%=loginUser.getAddress()%></label>
							<%} %>
						</td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<tr>
						<td class=category><label for="">반려견 유무</label></td>
						<td class="category2">
							<%if(loginUser.getDogYn()==null) {%>
							<label>정보없음</label>
							<%}else{%>
							<label><%=loginUser.getDogYn()%></label>
							<%} %>
						</td>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					</table>
				</form>
			</div>	
				
			<br>
				
			<div id="under">
				<table>
					<tr>
						<td><input type="button" value="회원정보 수정"  class="btn btn-default" onclick="location.href='/sixDestiny/views/member/7_member/3_mypage/3_modify.jsp'"></td>
						<td ><input type="button" style="margin-left:50px;" value="회원 탈퇴" class="btn btn-default" onclick="location.href='/sixDestiny/views/member/7_member/3_mypage/2_secession.jsp'">
						</td>
					</tr>
				</table>
			</div>
				
			
	</div>


<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>