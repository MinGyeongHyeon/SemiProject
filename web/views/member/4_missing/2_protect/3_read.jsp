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
				
         <tr>   <input type="hidden" value="<%=b.getbNo()%>" name="num"></tr>

				
				
			</tbody>
		</table>
	</table>

	<div align="right">
		<button>신고하기</button>
		<button>추천하기</button>
	</div>

	<hr>

	
	<div>
	<img id="titleImg" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeNm()%>">
					
	</div>

	<table class="type02">
		<tr>
			<th>발견장소</th>
			<td><span><%=b.getMissPlace() %><span>　</span><%=b.getMissPlaceDetail() %></span></td>
			<th>발견날짜</th>
			<td><%=b.getMissDt() %></td>
			<th>성별</th>
			<td><%=b.getMissGender() %></td>
			<th>연락처</th>
			<td><%=b.getMissPhone() %></td>
		</tr>
	</table>
	<div>
		<textarea name="" id="" cols="200" rows="10"></textarea>
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
					 <button type="button" onclick="location.href='<%=request.getContextPath()%>/proUpdate.bo?num=<%=b.getbNo()%>'" id="modified">글 수정</button>
	<%} }%>
	
	

						<% if(loginUser != null){
							
							if( loginUser.getUserId().equals("admin") ||loginUser.getUserNo()==b.getuNo() ){ %>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/proDelete.bo?num=<%=b.getbNo()%>'"  id="deleteBoard">글 삭제</button>
						
				<% }}%>
				
				
				
				<script>
				

				$('#modified').click(function(){

					 location.href="<%= request.getContextPath() %>/proUpdate.bo?num=<%= b.getbNo() %>" ;
				})

				$('#deleteBoard').click(function(){
				
					location.href="<%= request.getContextPath()%>/proDelete.bo?num=<%= b.getbNo()%>" ;
				})

				
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