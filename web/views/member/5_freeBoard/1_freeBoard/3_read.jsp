<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.free.model.vo.*, java.util.*"%>
<%
	UserBoard ub = (UserBoard) request.getAttribute("ub");
	ArrayList<UserBoardAttachment> fileList = (ArrayList<UserBoardAttachment>) request.getAttribute("fileList");
	UserBoardAttachment titleImg = fileList.get(0);
%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>자유게시판 글보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div>
	

		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><%=ub.getbNo()%></th>
						<th>카테고리 : <%=ub.getbKind() %></th>
						<th>제목 : <%=ub.getbNm()%></th>
						<th>글쓴이 : <%=ub.getbUserNick() %></th>
						<th> 작성날짜 : <%=ub.getbDate() %></th>
						<th>추천수 : <%=ub.getRecCon() %></th>
						<th>조회수 : <%=ub.getInqCon() %></th>
						<% if(loginUser != null){ %>
						<th><input type="button" value="추천">  <input type="button" value="신고" id="reportPr" onclick="report(<%= loginUser.getUserNo()%>)"></th>
					<%} %>
					</tr>
				</thead>
			</table>
		</div>


		<div style="padding: 30px" align="center">
			
				<img onerror="this.style.display='none'" id="titleImg" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeNm()%>">
			
			<p style="width: 1000px; padding: 80px;"><%=ub.getbCon() %></p>
		</div>

		<hr>

		<div align="center" style="padding: 20px">

			<div>댓글쓴이 : 댓글내용입니다</div>
			<div>댓글쓴이 : 댓글내용입니다</div>
			<div>댓글쓴이 : 댓글내용입니다</div>

		</div>
		<hr>
		<% if(loginUser != null){ %>
		댓글 <input type="text" style="width: 600px"> <input
			type="submit" value="댓글 달기">
			<%} %>
			
			<% if(loginUser != null && loginUser.getNickNm().equals(ub.getbUserNick())){ %>
				<button onclick="updateBoard()">수정하기</button>
				<button onclick="deleteBoard()">삭제하기</button>
				<% } %>

	</div>
	<script >
	function deleteBoard(){
	if(confirm("정말 삭제 하시겠습니까?")){
		var nno = $("th").parent().children().eq(0).text();
	
			$.ajax({
				url:"/sixDestiny/delete.ub",
				type:"post",
				data:{nno:nno},
				success:function(){
					alert("삭제가 완료되었습니다.");
					location.href="/sixDestiny/selectList.bo?what=writer&search=&alignment=date&category=all&currentPage=1";
				},
				error:function(){
					alert("삭제도중 에러가 났습니다.");
					location.href="/sixDestiny/selectList.bo?what=writer&search=&alignment=date&category=all&currentPage=1";
				}
			});
		}
	}
	
	function updateBoard(){
		if(confirm("정말 수정 하시겠습니까? \n[사진은 수정이 불가합니다.]")){
			var bno = $("th").parent().children().eq(0).text();
		
				$.ajax({
					url:"/sixDestiny/update.ubr",
					type:"post",
					data:{bno:bno},
					success:function(data){
						console.log(data['bNo']);
						console.log(data);
						location.href="/sixDestiny/views/member/5_freeBoard/1_freeBoard/4_update.jsp?bNo=" + data['bNo'] +"&bcon="+data['bCon']+"&bKind="+data['bKind']+"&bNm="+data['bNm'];
					},
					error:function(){
						console.log("사진 수정폼으로 이동 실패");
				
					}
				});
			}
		}
	
	
	 function report(data){
		var test = <%= ub.getbNo() %>; //현제 게시글 번호
		var test2 = <%= ub.getuNo() %>;   //해당게시글을 쓴유저의 번호
		var test3 = data;// 신고할 사람의 번호
	
		
		window.open("/sixDestiny/views/member/5_freeBoard/1_freeBoard/5_report.jsp?test=" + test + "," + test2 + "," + test3,"PopupWin","width=480,height=300","resizable=no");
	}) 
	
	</script>
<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
