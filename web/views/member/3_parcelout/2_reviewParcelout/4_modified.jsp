<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.board.model.vo.*"%>

    <%

    UserBoard ub = (UserBoard) request.getAttribute("ub");

    %>
<%@ include file="../../../common/top_Include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#border {
	height: 500px;
	width: 800px;
	border: 1px solid black;
	margin: 0 auto;
}

#btn {
	margin: 0 auto;
}

tr {
	margin: 0 auto;
}

#ta {
	height: 400px;
	width: 650px;
	margin: 0 auto;
}

tr {
	height: 40px;
}

table tr td {
	/* text-align: left; */
}

table tr td.title {
	text-align: center;
}

input[type=text] {
	padding-left: 90px;
}

.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 20px;
	height: 20px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}
</style>

</head>
<body>

<form action="<%= request.getContextPath() %>/UpdateParceloutCon.po" method="post" >
		<h3>분양후기 글쓰기</h3>

		<div id="border">
			<br>
			<br>


			<table id="ta">
				<tr>
					<td class="title"><label>제목</label></td>
					<td style="text-align: left"><input type="text" size="55" name="title" value="<%= ub.getbNm() %>"></td>

				</tr>

				<tr>

					<td class="title"><label>후기별점</label></td>
					<td style="text-align: left">

						<div class="starRev">
							<span class="starR">별1</span> <span class="starR">별2</span> <span
								class="starR">별3</span> <span class="starR">별4</span> <span
								class="starR">별5</span>

						</div>
					</td>
				</tr>

				<tr>
					<td class="title"><label>내용</label></td>

					<td style="text-align: left"><textarea name="content" id="" cols="60" rows="15" style="resize:none;">
						<%= ub.getbCon() %>
					</textarea></td>


				</tr>
				<tr>
					<td><input type="text" value="<%= ub.getbNo() %>" style="display:none" name="boardNo"></td>
				</tr>



				<tr>

				</tr>




			</table>

		</div>
		<br>
		<br>
		<button type="submit">수정</button>

	</form>
	<script>
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});




	</script>
<%@ include file="../../../common/bottom_Include.jsp"%>



</body>
</html>