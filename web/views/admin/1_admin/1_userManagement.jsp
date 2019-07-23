<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="../../common/top_Include.jsp"%>
<%
   ArrayList<User> list = (ArrayList<User>) request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
	<%@ include file="../../common/inner_admin_include.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function showUser(){
		window.open("views/admin/1_admin/showUser.jsp","ȸ������","width=500,height=500,left=100,top=50");
	}



</script>


<style>
   #outer{
      width:1000px;
      margin:0 auto;
      text-align:left;
   }

   #order{
      align:center;
   }
   
   #btn1{
  
    border-radius: 0.35em;
   	border: 1;
   	outline : 0; 
   }
   
   #btn1:hover{
   	background-color:lightgray;
   }

   
   #td1:hover{
   	font-weight:bold;
   }


</style>
</head>
<body>

   <div>
   
   <div id="outer">
   	<form id="form1" action="<%= request.getContextPath() %>/deleteuser" method="post">
      <table class="table">
         <thead>
         <tr>
         <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>생년월일</th>
            <th>성별</th>
            <th>이메일</th>
            <th>HP</th>
            <th>탈퇴</th>
         </tr>
         </thead>
        
        <tbody>
         <% for(User u : list){ %>
        
         <tr>
            <td><%=u.getUserNo() %></td>
            <td><%=u.getUserId() %></td>
            <td onclick="showUser();" id="td1"><%=u.getUserNm() %></td>
            <td><%=u.getNickNm() %></td>
            <td><%=u.getUserHb() %></td>
            <td><%=u.getGender() %></td>
            <td><%=u.getEmail() %></td>
            <td><%=u.getPhone() %></td>
         	<td>
         	<button class="btn btn-default" id="btn1" onclick="deleteUser(<%=u.getUserNo() %>);">탈퇴</button>
         	</td>
         </tr>
         <% } %>
         	</tbody>
         	
         	<script>
         		function deleteUser(userNo){
         			$("#form1").attr("action","<%=request.getContextPath()%>/deleteuser?userNo="+userNo);
         		}

         	</script>

      </table>
      </form>
      
   </div>

   <div id="order">
   <ul class="pagination pagination-sm">
     <li><a href="#">1</a></li>
     <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
     <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
   </ul>
   </div>




   </div>
<%@ include file="../../common/bottom_Include.jsp"%>
</body>
</html>