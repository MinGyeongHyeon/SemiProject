<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.missing.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>
<%
Missing b = (Missing) request.getAttribute("b");
	ArrayList<MissingAttachment> fileList = 
			(ArrayList<MissingAttachment>) request.getAttribute("fileList");
	MissingAttachment titleImg = fileList.get(0);
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#bt1 {
	background: dimgray;
	Color: white;
	width: 100px;
	height: 50px;
}

.div2 {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: skyblue;
	border-bottom: 3px solid #036;
}

table.type01 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.type01 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: lightgray;
}

table.type01 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type02 {
	border-collapse: collapse;
	text-align: top;
	line-height: 1.0;
}

table.type02 th {
	width: 150px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: lightgray;
}

table.type02 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

textarea {
	width: 100%;
}

.reply_reply {
	border: 2px solid #FF50CF;
}

.reply_modify {
	border: 2px solid #FFBB00;
}

/*  .btn-like {
  color: transparent;
  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
}
.btn-like:hover {
  text-shadow: 0 0 0 #ea0;
}
.btn-like.done {
  color: inherit;
  text-shadow: 0;
}
.btn-like.done:hover {
  color: transparent;
  text-shadow: 0 0 0 #777;
}   */


.a{
color:red;
}
.b{
color:blue;
}
#1{
color:red;

}
#2{
color:blue;
}

</style>
<link rel="stylesheet" href="/css/bootstrap.css">

</head>
<body>
	<div class="div2">
		<img src="views/images/dog.png">
	</div>
	<table align="center">
	

	
	
		<caption></caption>
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
		<table class="type01">
			<tbody>
				<tr>
					<th>작성자</th>
				<td><%=b.getuName()%></td> 
					<th>작성시간</th>
					<td><%=b.getbDate() %></td>
					<th>추천수</th>
					<td><%=b.getRecCon() %></td>
					<th>조회수</th>
					<td><%=b.getInqCon() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=b.getbNm() %></td>
				</tr>
				
         <tr>   <input type="hidden" value="<%=b.getbNo()%>" name="num" id="num"></tr>

				
				
			</tbody>
		</table>
	</table>

	<div align="right">
	<%System.out.print("뭐냐고고오오오오옹"+b.getUu()); %>

<% if(loginUser != null){ %> 
					 <button type="button" id="report" onclick="report(<%=loginUser.getUserNo()%>);">신고하기</button>
					 <div class="ddd">
					 <%if(b.getUu()==0){ %>
					 	<button class="btn-like" id="1" <%-- onclick="upbnt(<%=loginUser.getUserNo()%>)" --%>>👍1</button>
					 	<%}else{ %>
					 	
					 	<button class="btn-like" id="1" <%--  onclick="upbnt(<%=loginUser.getUserNo()%>)" --%>>👍2</button>
	<%} %>
	</div>
	<%} %>
	
 
	</div>

	<hr>

	<div align="right">
		<button id="bt1" onclick="location.href='<%=request.getContextPath()%>/missingpaper.bo?num=<%=b.getbNo()%>'" id="paper">전단지 생성</button>
	</div>
	<div>
	<img id="titleImg" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeNm()%>">
					
	</div>

	<table class="type02">
		<tr>
			<th>실종장소</th>
			<td><span><%=b.getMissPlace() %><span>　</span><%=b.getMissPlaceDetail() %></span></td>
			<th>실종날짜</th>
			<td><%=b.getMissDt() %></td>
			<th>성별</th>
			<td><%=b.getMissGender() %></td>
			<th>사례금</th>
			<td><%=b.getRewardPc() %></td>
			<th>연락처</th>
			<td><%=b.getMissPhone() %></td>
		</tr>
	</table>
	<div>
		<textarea name="" id="" cols="200" rows="10"><%=b.getbCon() %></textarea>
	</div>
	<hr>
	<input type="hidden" id="" name="" value="" />
	<div align="center">
		</br> </br>
		<table border="1" width="1200px">
			<tr>
				<td colspan="2" align="right">

<% if(loginUser != null){ 
          if(loginUser.getUserNo()==b.getuNo() ){%>
					 <button type="button" onclick="location.href='<%=request.getContextPath()%>/missingUpdate.bo?num=<%=b.getbNo()%>'" id="modified">글 수정</button>
	<%} }%>
	
	

						<% if(loginUser != null){
							
							if( loginUser.getUserId().equals("admin") ||loginUser.getUserNo()==b.getuNo() ){ %>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/missingDelete.bo?num=<%=b.getbNo()%>'"  id="deleteBoard">글 삭제</button>
						
				<% }}%>
				
				
				
				<script>
				

				$('#modified').click(function(){

					 location.href="<%= request.getContextPath() %>/missingUpdate.bo?num=<%= b.getbNo() %>" ;
				});

				$('#deleteBoard').click(function(){
				
					location.href="<%= request.getContextPath()%>/missingDelete.bo?num=<%= b.getbNo()%>" ;
				});
				
				$('#paper').click(function(){
				
					location.href="<%= request.getContextPath()%>/missingpaper.bo?num=<%= b.getbNo()%>" ;
				});
				
			
				
				function report(data){
					var test = <%= b.getbNo() %>;
					var test2 = data;		
					var test3 = <%=b.getuNo()%>
					console.log("뀨");
					console.log(test2);
					window.open("/sixDestiny/views/member/4_missing/1_fine/6_report.jsp?test=" + test + "," + test2 + "," + test3 ,"PopupWin","width=480,height=300","resizable=no");
				}

				
				</script>
		
	<!-- 	<script src="//code.jquery.com/jquery.min.js"></script> -->
<script>



<%-- 
function upbnt(data){
	console.log("ddddddddd");
	var test = <%= b.getbNo() %>;
	var test2= data;
 	var result=<%=b.getUu()%>
 	
 	
	$.ajax({
			url:"missingrec.bo",
			data:{test:test,test2:test2,result:result},
			type:"get",
			success:function(data){
				console.log(data);
				var $div = $(".ddd");
					$div.html("");
				console.log("보드"+test);
				console.log("re"+result);
					var $btn = $("<button>");
					$btn.text("👍");
				 $div.append($btn);
				if(result==0){

					$btn.addClass("a");
				}else{
					
					$btn.addClass("b");
				}
				
			}
	});

}
 --%>

<%-- 
	<%}else{%>
	$(this).toggleClass("done");
	var test = <%= b.getbNo() %>;
	var test2= <%=loginUser.getUserNo()%>
	console.log('추천');
 location.href="<%= request.getContextPath() %>/missingrec.bo?test="+test+"&&test2="+test2; 

	<%}%> --%>

	$(function(){

	$('#1').click(function(){
	
		console.log("ddddddddd");
		var test = <%= b.getbNo() %>;
		var test2= data;
	 	var result=<%=b.getUu()%>
	 	
	 	
		$.ajax({
				url:"missingrec.bo",
				data:{test:test,test2:test2,result:result},
				type:"get",
				success:function(data){
					console.log(data);
					var $div = $(".ddd");
						$div.html("");
					console.log("보드"+test);
					console.log("re"+result);
					
						var $btn = $("<button>");
						$btn.text("👍");
					 $div.append($btn);
					if(result==0){

						$btn.addClass("a");
					}else{
						
						$btn.addClass("b");
					}
					
				}
		});

		
	})
	;
	
	});	
	
	
	
</script> 


			</tr>
			<tr>
				<td width="900px">제목: 댓글</td>
				<td>작성자: 전지용</td>
			</tr>

		</table>
		<table border="1" width="1200px" id="reply_area">
			<tr reply_type="all">
				<td colspan="4"></td>
			</tr>
			<!-- 댓글 공간 -->
		</table>
		<table border="1" width="1200px" bordercolor="#46AA46">
			<tr>
				<td width="500px">이름: <input type="text" id="reply_writer"
					name="reply_writer" style="width: 170px;" maxlength="10"
					placeholder="작성자" /> 패스워드: <input type="password"
					id="reply_password" name="reply_password" style="width: 170px;"
					maxlength="10" placeholder="패스워드" />
					<button id="reply_save" name="reply_save">댓글 등록</button>
				</td>
			</tr>
			<tr>
				<td><textarea id="reply_content" name="reply_content" rows="4"
						cols="50" placeholder="댓글을 입력하세요."></textarea></td>
			</tr>
		</table>
		<table width="1200px">
			<tr>
				<td align="right">
					<button id="list" name="list">게시판</button>
				</td>
			</tr>
		</table>
	</div>
<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>