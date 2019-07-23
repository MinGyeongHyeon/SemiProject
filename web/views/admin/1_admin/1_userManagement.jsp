<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.kh.semi.board.free.model.vo.*"%>
<%@ include file="../../common/top_Include.jsp" %>
<%
   ArrayList<User> list = (ArrayList<User>) request.getAttribute("list");
/* PageInfo pi = (PageInfo) request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage(); */
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
      <table class="table" style="text-align:center;">
         <thead >
         <tr>

            <th style="text-align:center;">회원번호</th>
            <th style="text-align:center;">아이디</th>
            <th style="text-align:center;">이름</th>
            <th style="text-align:center;">닉네임</th>
            <th style="text-align:center;">성별</th>
            <th style="text-align:center;">이메일</th>
            <th style="text-align:center;">연락처</th>
            <th style="text-align:center;">가입일자</th>
            <th style="text-align:center;">탈퇴</th>

         </tr>
         </thead>

        <tbody>
         <% for(User u : list){ %>

         <tr>
            <td><%=u.getUserNo() %></td>
            <td><%=u.getUserId() %></td>
            <td onclick="showUser();" id="td1"><%=u.getUserNm() %></td>
            <td><%=u.getNickNm() %></td>
            <td><%=u.getGender()  %></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getPhone() %></td>
            <td><%=u.getEnrollDt() %></td>
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

  <%-- 페이징처리 --%>
		<%-- <div class="pagingArea" align="center">
		<ul class="pagination">


			<% if(currentPage != 1){ %>
			<li><a href="<%=request.getContextPath()%>/selectList.bo?currentPage=1">◀◀</a></li>

			<% }%>


			<% if(10 >= currentPage){ %>


			<% }else if(currentPage%10 != 0){ %>
			<li><a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=(int)(Math.floor(currentPage/10))*10%>">◀</a></li>
			<%}else{ %>
			<li><a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=(int)(Math.floor((currentPage-1)/10))*10%>">◀</a></li>
			<%} %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<li ><a style="background:rgb(240,240,240); font-weight:bold;" href="#" disabled><%= p %></a></li>

			<% } else { %>
			<li><a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>" disabled><%= p %></a></li>

			<%
				}
			   }
			%>

			<% if(currentPage >= maxPage){ %>

			<% }else if(Math.floor(maxPage/10)*10 >= currentPage){ %>
			<li><a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=(int)(Math.ceil(currentPage/10))*10+11%>">▶</a></li>

			<% }%>

			<% if(currentPage < maxPage){ %>
			<li><a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=maxPage%>">▶▶</a></li>
			<%} %>
		</ul>
		</div> --%>




   </div>
<%@ include file="../../common/bottom_Include.jsp"%>
</body>
</html>