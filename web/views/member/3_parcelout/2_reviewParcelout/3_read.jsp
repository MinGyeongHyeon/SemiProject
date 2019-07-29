<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.parcelout.model.vo.*, java.util.*, com.kh.semi.user.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>

<%
	ArrayList<Integer> list2 = null;

	UserBoard ub = (UserBoard) request.getAttribute("ParceloutBoard");

	ArrayList<Attachment> list = (ArrayList<Attachment>) request.getAttribute("filelist");

	User us = (User) request.getAttribute("User");

	ArrayList<Coment> cm = (ArrayList<Coment>) request.getAttribute("coment");

	if(request.getAttribute("list2") != null){
	 list2 = (ArrayList<Integer>) request.getAttribute("list2");

	}

	ArrayList<Integer> list3 = (ArrayList<Integer>) request.getAttribute("list3");

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
						<th id="thtest2">조회수 : <%= ub.getInqCon() %></th>
						<th id="thtest">추천수 : <%= list3.get(0) %></th>

						<% if(loginUser != null) {%>
							<%if (list2.get(0) == 1){ %>
							<th class="classt"><button type="button" id="parcleup" style="background: none;  border: none;"><img src="/sixDestiny/images/test1.png" width="30px;" height="30px;" id="imgtest"></button>
							</th>
							<% }else { %>
						<th class="classt"><button type="button" id="parcleup" style="background: none;  border: none;"><img src="/sixDestiny/images/test3.jpeg" width="30px;" height="30px;" id="imgtest"></button>
							<% } %>
						<th><input type="button" value="신고" id="reportPr"></th>
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
					<tr >
						<td>
						<input type="hidden" value="<%= cm.get(i).getConNo()%>" class="repotCon">
						<input type="hidden" value="<%= cm.get(i).getuNo()%>" class="repotUser">
							<label style="width:100px"><%= cm.get(i).getNickNm() %></label>
							<label style="width:400px"><%= cm.get(i).getComent() %></label>
						<button class="reportCom" style="background: none;  border: none;"><img src="/sixDestiny/images/reportcoment.PNG" width="30px;" height="30px;" id="imgtest"></button>

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
	$('.reportCom').click(function(){
		var cNo = $(this).prevAll('.repotCon').val();
		var uNo = $(this).prevAll('.repotUser').val();
		var u2No = <%= us.getUserNo()%>;

		window.open("/sixDestiny/views/member/3_parcelout/2_reviewParcelout/7_report_coment.jsp?uNo=" + uNo + "&cNo=" + cNo  + "&u2No=" + u2No ,"PopupWin","width=480,height=300","resizable=no");

	})

	$('#parcleup').click(function(){
		var uNo = $('#uNo').val();
		var bNo = $('#bNo').val();

		console.log(uNo);
		console.log(bNo);



		$.ajax({
			url:"updateRec.po",
			type:"get",
			data:{uNo:uNo,bNo:bNo},
			success:function(data){

				if(data[0] == 1){

					var $parcleup = $('#parcleup');

					var $imgtest = $('#imgtest');

					$imgtest.remove();

					var $img2 = ('<img src="/sixDestiny/images/test1.png" width="30px;" height="30px;" id="imgtest" >');

					$parcleup.append($img2);

					var $table = $('#thtest');

					$table.remove();

					var $th = $('<th id="thtest">');
					$th.text("추천수 : " + data[1]);
					var $th2 = $('#thtest2');


					$th2.after($th);



				}else{

					$.ajax({
						url:"DeleteRec.dr",
						data:{uNo:uNo,bNo:bNo},
						type:"post",
						success:function(data){
							if(data[0] > 0){

								var $parcleup = $('#parcleup');

								var $imgtest = $('#imgtest');

								$imgtest.remove();

								var $img2 = ('<img src="/sixDestiny/images/test3.jpeg" width="30px;" height="30px;" id="imgtest" >');

								$parcleup.append($img2);

								var $table = $('#thtest');

								$table.remove();

								var $th = $('<th id="thtest">');
								$th.text("추천수 : " + data[1]);
								var $th2 = $('#thtest2');


								$th2.after($th);


							}



						}

					})



			}
			}

			});

		});

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
					var $td = $('<td>');
					var $button = $('<button style="background: none; border:none;" class="reportCom">');
					var $img = $('<img src="/sixDestiny/images/reportcoment.PNG" width="30px;" height="30px;" id="imgtest">');
					var $input = $('<input value=' + data[key].conNo + " >" );
					$input.attr('type','hidden');
					var $input2 = $('<input value=' + data[key].uNo + '>' );
					$input2.attr('type','hidden');
					var $nickNm = $("<label>").text(data[key].nickNm).css("width","100px");
					var $coment = $("<label>").text(data[key].coment).css("width","400px");


					$button.append($img);
					$td.append($input);
					$td.append($input2);
					$td.append($nickNm);
					$td.append($coment);
					$td.append($button);
					$tr.append($td);

					$replySelectTable.append($tr);


				}

				$('.reportCom').click(function(){
					var cNo = $(this).prevAll('.repotCon').val();
					var uNo = $(this).prevAll('.repotUser').val();
					var u2No = <%= us.getUserNo()%>;

					window.open("/sixDestiny/views/member/3_parcelout/2_reviewParcelout/7_report_coment.jsp?uNo=" + uNo + "&cNo=" + cNo  + "&u2No=" + u2No ,"PopupWin","width=480,height=300","resizable=no");

				})

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
