<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.model.vo.*"%>

<%
	ArrayList<UserBoard> list = (ArrayList<UserBoard>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
    <%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

.caption{
  font-size: 20px;
}
#test{
	margin-top: 5%;
}
#test2{
	margin-top:10%
}
#test tr th{
	width: 450px;
}
#test2 tr th{
	width: 300px;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
</head>
<body>

<div>

	<table align="center" class="boder" border="1" id=test>
	  <caption class="caption"><b>내 댓글 확인</b></caption>
		<tr>
			<th style="text-align:center;">게시판 종류</th>
			<th style="text-align:center;">댓글 내용</th>
		</tr>

	</table>

	<table align="center" class="boder" border="1" id="test2" >
	<caption class="caption"><b>내 게시글 확인</b></caption>
		<tr>
			<th style="text-align:center;" hidden>게시판 번호</th>
			<th style="text-align:center;">게시판 종류</th>
			<th style="text-align:center;">게시글 제목</th>
			<th style="text-align:center;">날짜</th>
			<th style="text-align:center;">추천수</th>
		</tr>
		<tbody>
		<% for(UserBoard ub : list){ %>
		<tr>
			<td hidden><%= ub.getbNo() %></td>
			<td><%= ub.getbKind() %></td>
			<td id="bname"><%= ub.getbNm() %></td>
			<td><%= ub.getbDate() %></td>
			<td><%= ub.getRecCon() %></td>
				
		</tr>
		<%} %>
		</tbody>
	</table>


</div>
<%-- 페이징처리 --%>
		<div class="pagingArea" align="center">
		<ul class="pagination">
			
			
			<% if(currentPage != 1){ %>
			<li><a href="<%=request.getContextPath()%>/mypage.bo?currentPage=1">◀◀</a></li>
			
			<% }%>
			
			
			<% if(10 >= currentPage){ %>
			
			
			<% }else if(currentPage%10 != 0){ %>
			<li><a href="<%=request.getContextPath()%>/mypage.bo?currentPage=<%=(int)(Math.floor(currentPage/10))*10%>">◀</a></li>
			<%}else{ %>
			<li><a href="<%=request.getContextPath()%>/mypage.bo?currentPage=<%=(int)(Math.floor((currentPage-1)/10))*10%>">◀</a></li>
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<li ><a style="background:rgb(240,240,240); font-weight:bold;" href="#" disabled><%= p %></a></li>
					
			<% } else { %>
			<li><a href="<%=request.getContextPath()%>/mypage.bo?currentPage=<%=p%>" disabled><%= p %></a></li>
				
			<% 
				}
			   } 
			%>
			
			<% if(currentPage >= maxPage){ %>
			
			<% }else if(Math.floor(maxPage/10)*10 >= currentPage){ %>
			<li><a href="<%=request.getContextPath()%>/mypage.bo?currentPage=<%=(int)(Math.ceil(currentPage/10))*10+11%>">▶</a></li>
			
			<% }%>
			
			<% if(currentPage < maxPage){ %>
			<li><a href="<%=request.getContextPath()%>/mypage.bo?currentPage=<%=maxPage%>">▶▶</a></li>
			<%} %>
		</ul>
		</div>

<script>
	$(function(){

		var $tableBody = $("#test tbody");

		var $tr = $("<tr>");
		var $Kinds = $("<td>").text('테스트');
		var $Contents = $("<td>")

		var $test = $("<a href='#'>").text('링크 테스트');


		$Contents.append($test);
		$tr.append($Kinds);
		$tr.append($Contents);


		$tableBody.append($tr);

	});
	
	$("#test2 td").mouseenter(function(){
		$(this).parent().css({"background":"rgb(240,240,240)", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"#FFF"});
	}).click(function(){
		var num = $(this).parent().children().eq(0).text();
		
		//console.log(num);
		
		location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
	});

	
</script>


<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>