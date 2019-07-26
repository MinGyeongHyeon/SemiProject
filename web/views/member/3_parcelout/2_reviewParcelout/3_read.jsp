<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.parcelout.model.vo.*, java.util.*, com.kh.semi.user.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>

<%

	UserBoard ub = (UserBoard) request.getAttribute("ParceloutBoard");

	ArrayList<Attachment> list = (ArrayList<Attachment>) request.getAttribute("filelist");

	User us = (User) request.getAttribute("User");

	ArrayList<Coment> cm = (ArrayList<Coment>) request.getAttribute("coment");

	Attachment Img1 = list.get(0);




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
					<td><input style="display: none;" id="bNo" value="<%= ub.getbNo() %>">
					<% if(loginUser != null) {%>
						<input type="hidden" id="uNo" value="<%= loginUser.getUserNo() %>">
					<% } %>
					</td>
						<th>제목 : <%= ub.getbNm() %></th>
						<th>작성자 : <%= us.getNickNm() %></th>
						<th>작성일 : <%= ub.getbDate() %></th>
						<th>조회수 : <%= ub.getInqCon() %></th>
						<th>추천수 : <%= ub.getRecCon() %></th>
						<th><input type="button" value="추천" id="parcleup">
						<% if(loginUser != null) {%>
						<input type="button" value="신고" id="reportPr"></th>
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
			<table id="replySelectTable" border="0" align="conter">
				<tbody>
				<% if(cm != null){ %>
				<% for(int i = 0 ; i < cm.size(); i++){ %>
					<tr>
						<td>
						<input type="hidden" value="<%= cm.get(i).getConNo()%>">
						<input type="hidden" value="<%= cm.get(i).getuNo()%>">
							<label><%= cm.get(i).getNickNm() %></label>
							<label><%= cm.get(i).getComent() %></label>
						</td>
					</tr>
					<% } %>
				<% } %>
				</tbody>
			</table>

			<%-- <% if(loginUser != null &&loginUser.getUserId().equals("admin")){ %>  <button>삭제</button>   <% } %> --%>

			</div>





		</div>
		<hr>

	<% if(loginUser != null) { %>
		댓글 <input type="text" style="width: 600px" id="coment">
		<input type="button" value="댓글 달기" id="comHs">

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

	})


	$('#modified').click(function(){

		 location.href="<%= request.getContextPath() %>/ParceloutConUpdate.po?num=<%= ub.getbNo() %>" ;
	})

	$('#deleteBoard').click(function(){

		location.href="<%= request.getContextPath()%>/DeleteParcelout.po?num=<%= ub.getbNo() %>" ;
	})


	$('#reportPr').click(function(){
		var test = <%= ub.getbNo() %>;
		var test2 = $('#uNo').val();
		var test3 = <%= us.getUserNo()%>;
		window.open("/sixDestiny/views/member/3_parcelout/2_reviewParcelout/6_report.jsp?test=" + test + "," + test2 + "," + test3,"PopupWin","width=480,height=300","resizable=no");
	})

	$('#comHs').click(function(){

		var coment = $('#coment').val();
		var uNo = $('#uNo').val();
		var bNo = $('#bNo').val();


		$.ajax({
			url:"Insert.coment",
			data:{coment:coment , uNo:uNo , bNo:bNo},
			type:"get",
			success:function(data){


				var $replySelectTable = $('#replySelectTable tbody');
				$replySelectTable.html("");
				var $coment = $('#coment');
				$coment.val("");


				for(var key in data){
					var $tr = $('<tr>');
					var $input = $('<input value=' + data[key].conNo + " >" );
					$input.attr('type','hidden');
					var $input2 = $('<input value=' + data[key].uNo + '>' );
					$input2.attr('type','hidden');
					var $nickNm = $("<td>").text(data[key].nickNm).css("width","100px");
					var $coment = $("<td>").text(data[key].coment).css("width","400px");


					$tr.append($input);
					$tr.append($input2);
					$tr.append($nickNm);
					$tr.append($coment);

					$replySelectTable.append($tr);

				}



			}
		})

		console.log(coment);
		console.log(uNo);
		console.log(bNo);
	})




</script>



<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
