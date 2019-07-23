<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.parcelout.model.vo.*, java.util.*, com.kh.semi.user.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>

<%

	UserBoard ub = (UserBoard) request.getAttribute("ParceloutBoard");

	ArrayList<Attachment> list = (ArrayList<Attachment>) request.getAttribute("filelist");

	User us = (User) request.getAttribute("User");

	Attachment Img1 = list.get(0);
	Attachment Img2 = list.get(1);
	Attachment Img3 = list.get(2);
	Attachment Img4 = list.get(3);


%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>분양후기 글보기</title>
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
					<td><input style="display: none;" id="uNo" value="<%= ub.getbNo() %>"></td>
						<th>제목 : <%= ub.getbNm() %></th>
						<th>작성자 : <%= us.getNickNm() %></th>
						<th>작성일 : <%= ub.getbDate() %></th>
						<th>조회수 : <%= ub.getInqCon() %></th>
						<th>추천수 : <%= ub.getRecCon() %></th>
						<th><input type="button" value="추천" id="parcleup">
						<% if(loginUser != null) {%>
						<input type="button" value="신고"></th>
						<% } %>
						<% if(loginUser != null) { %>
							<% if(loginUser.getUserNo() == us.getUserNo() || loginUser.getUserId().equals("admin")){ %>
									<th><input type="button" value="수정" id="modified"></th>
									<th><input type="button" value="삭제" id="deleteBoard"></th>
								<% } %>
							<% } %>
					</tr>
				</thead>
			</table>
		</div>


		<div style="padding: 30px" align="center">
			<img src="/sixDestiny/parcelout_uploadFiles/<%= Img1.getChangeNm()%>" alt="Nature">
			<p style="width: 1000px; padding: 80px;">
				<%= ub.getbCon() %>
			</p>
		</div>

		<hr>

		<div align="center" style="padding: 20px">

			<div>댓글쓴이 : 댓글내용입니다 <% if(loginUser != null &&loginUser.getUserId().equals("admin")){ %>  <button>삭제</button>   <% } %></div>
			<div>댓글쓴이 : 댓글내용입니다</div>
			<div>댓글쓴이 : 댓글내용입니다</div>




		</div>
		<hr>

	<% if(loginUser != null) { %>
		댓글 <input type="text" style="width: 600px"> <input
			type="submit" value="댓글 달기">

		<% } %>



	</div>

<script>
	$('#parcleup').click(function(){
		var num = $('#uNo').val();

		$.ajax({
			url:"updateRec.po",
			type:"get",
			data:{num:num},
			success:function(data){
				alert("추천 하셨습니다.");


			}
		});

		<%-- var num = $('#uNo').val();

			console.log(num);


		 location.href="<%= request.getContextPath() %>/updateRec.po?num=" + num; --%>


	})

	$('#modified').click(function(){

		 location.href="<%= request.getContextPath() %>/ParceloutConUpdate.po?num=<%= ub.getbNo() %>" ;
	})

	$('#deleteBoard').click(function(){

		location.href="<%= request.getContextPath()%>/DeleteParcelout.po?num=<%= ub.getbNo() %>" ;
	})

</script>



<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
