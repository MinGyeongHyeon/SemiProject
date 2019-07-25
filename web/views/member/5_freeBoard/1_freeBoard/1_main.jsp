<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.free.model.vo.*"%>

<%
	ArrayList<UserBoard> list = (ArrayList<UserBoard>) request.getAttribute("list");
	ArrayList<UserBoard> best = (ArrayList<UserBoard>) request.getAttribute("best");
	PageInfoFreeBoard pi = (PageInfoFreeBoard) request.getAttribute("pi");
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
.div1 {
	overflow: hidden;
	text-overflow: ellipsis;
}
p{
	margin : 0px;
}
.row {
	width: 100%;
	padding-left: auto;
	padding-right: auto;
}

.title {
	text-align: left;
	margin: 10 20;
	padding-left: 200px;
}

div {
	font-family: 'Sunflower', sans-serif;
}

.text {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 150px;
	width: 800px;
}
.thumbnail .caption p{
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
     width: 110px;
    height: 46px;
   display: block; 
}

th{
	text-align:center;
}
</style>
<title>자유게시판 메인</title>

</head>
<body>

	<div style="height: 700px;">
		<h3>인기글 BEST 5</h3>
		<hr>

		<div class="container" style="height: 1000px; width: 70%;">

			<div class="row" style="margin-left: 89px;">
			<% for(UserBoard ubbest : best){ %>
				<div class="col-md-2">
					<div class="thumbnail" style="width:150px; height:150px; padding:10px;">
						
								
							<div class="caption">
								<a href="<%=request.getContextPath()%>/selectOne.bo?num=<%= ubbest.getbNo() %>">
								<p>제목: <%= ubbest.getbNm() %></p>
								<p>카테고리: <%= ubbest.getbKind() %></p>
								<p>추천수 : <%= ubbest.getRecCon() %> </p>
							</div>
						</a>
					</div>
				</div>
				<% } %>
			</div>



			<div style="padding: 30px">

				<div align="right">
					<select onchange="location.href=this.value">
						<option selected disabled="disabled">카테고리</option>
						<option  value="/sixDestiny/selectList.bo">전체</option>
						<option  value="/sixDestiny/selectListCa.bo?category=자랑">자랑</option>
						<option  value="/sixDestiny/selectListCa.bo?category=꿀팁">꿀팁</option>
						<option  value="/sixDestiny/selectListCa.bo?category=잡담">잡담</option>
					</select> 
					<select>
							<option selected>날짜순</option>
							<option>추천순</option>
							<option>조회순</option>
					</select>
				</div>
				<table class="table" id="listArea">
					<thead>
						<tr>
							<th width="50px;">No</th>
							<th width="70px;">카테고리</th>
							<th width="100px;">날짜</th>
							<th width="200px;">제목</th>
							<th width="70px;">작성자</th>
							<th width="50px;">조회수</th>
							<th width="50px;">추천수</th>
						</tr>
					</thead>
					<tbody>
					<% for(UserBoard ub : list){ %>
						<tr>
							<td><%= ub.getbNo() %></td>
							<td><%= ub.getbKind() %></td>
							<td><%= ub.getbDate() %></td>
							<td id="bname"><%= ub.getbNm() %></td>
							<td><%= ub.getbUserNick() %></td>
							<td><%= ub.getInqCon() %></td>
							<td><%= ub.getRecCon() %></td>
							
						</tr>
					<% } %>
					</tbody>
				</table>
			</div>

		</div>

	</div>
	<!-- 전체div -->


	<div align="center">
		
			<select style="height: 27px; margin: 8px">
				<option>제목</option>
				<option>작성자</option>
			</select> 
			<span class="glyphicon glyphicon-search" style="display:inline-block; margin-right: 500px;">
			<input type="text"
				style="width: 250px">
				<button class="main">검색</button>
			</span> 
				
				<% if(loginUser != null){ %>
				<button class="main" onclick="location.href='/sixDestiny/views/member/5_freeBoard/1_freeBoard/2_write.jsp'">글쓰기</button>  
				<% } %>
		

	</div>


	<%-- 페이징처리 --%>
		<div class="pagingArea" align="center">
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
		</div>

	 
		
		
		
<script>
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"rgb(240,240,240)", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"#FFF"});
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			//console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
		});
		
		
		$(".caption").click(function(){
			var num = $(this).val();
			location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
		});
		
		
		
		


	</script>
	

<%@ include file="../../../common/bottom_Include.jsp"%>


</body>
</html>