<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
<%-- <% if(msg.equals("Ż��")){%>
		alert("ȸ������������ �����Ͽ����ϴ�.")

<% }else{%>
alert("ȸ������������ �Ϸ��Ͽ����ϴ�.")

<% }%> --%>
</script>
	<form action="/sixDestiny/update.user" method="post">
	<div align="center" style="border:1px solid; width:500px; height:auto; margin:0 auto;">
	<table>

	<tr>
		<td><div style="color:black; padding:5px; width:100px">�̸�</div></td>
		<td><%= loginUser.getUserNm()%></td>
	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px">���̵�</div></td>
		<td><%= loginUser.getUserId()%><input name="userId" type="hidden" value="<%= loginUser.getUserId()%>"></td>
	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px">�г���</div></td>
		<td><input type="text" name="nickNm" value="<%= loginUser.getNickNm()%>"></td>
		<td><input type="button" value="�ߺ�Ȯ��"> <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>"></td>

	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px" >�̸���</div></td>
		<td><input type="text" name="email" value="<%= loginUser.getEmail()%>"></td>
	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px">�������</div></td>
		<td>
		<select name="year">
<%for(int year=1981; year<=1998; year++) {%>
	<%if(loginUser.getUserHb() != null && year == Integer.parseInt(loginUser.getUserHb().toString().substring(0, 4))) { %>
		<option selected><%=year %></option>
	<%} else {%>
		<option><%=year %></option>
	<%}%>
<%} %>
		</select>

		<select name="month">
		<%for(int month=1; month<=12; month++) {%>
	<%if(loginUser.getUserHb() != null && month == Integer.parseInt(loginUser.getUserHb().toString().substring(5, 7))) { %>
		<option selected><%=month %></option>
	<%} else {%>
		<option><%=month %></option>
	<%}%>
<%} %>
		</select>
		
		<select name="day">
			<%for(int day=1; day<=31; day++) {%>    
	<%if(loginUser.getUserHb() != null && day == Integer.parseInt(loginUser.getUserHb().toString().substring(8, 10))) { %>
		<option selected><%=day %></option>
	<%} else {%>
		<option><%=day %></option>
	<%}%>
<%} %>
		</select>
		</td>
	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px">����</div></td>
		<td><%= loginUser.getGender()%></td>
	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px" >�ּ�</div></td>
		<td><input type="text" name="address" value="<%= loginUser.getAddress()%>"></td>
	</tr>

	<tr>
		<td><div style="color:black; padding:5px; width:100px">�ݷ��� ����</div></td>
		<td>
	<% if(loginUser.getDogYn().equals("Y")) {%>
		<input type="radio" value="Y" name="dogYn" checked>�ִ�
		<input type="radio" value="N" name="dogYn">����
	<% } else{ %>
		<input type="radio" value="Y" name="dogYn" >�ִ�
		<input type="radio" value="N" name="dogYn" checked>����
	<%} %>
		</td>
	</tr>

	</table>
	<input type="submit" value="Ȯ��" >
	</div>
	</form>
<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>