<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#border {
	height: 500px;
	width: 800px;
	border: 1px solid black;
	margin: 0 auto;
	font-family: 'Sunflower', sans-serif;
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
	padding-left: 5px;
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


 	<form action="<%= request.getContextPath() %>/upload.po" method="post" encType="multipart/form-data">
		<h3>분양후기 글쓰기</h3>

		<div id="border">
			<br>
			<br>


			<table id="ta">
				<tr>
					<td class="title"><label>제목</label></td>
					<td style="text-align: left"><input type="text" size="55" name="title"></td>
					<td><input type="hidden" name="starRev" id="starRev"></td>
				</tr>

				<tr>

					<td class="title"><label>후기별점</label></td>
					<td style="text-align: left">

						<div class="starRev">
							<span class="starR" >1</span> <span class="starR">2</span> <span
								class="starR">3</span> <span class="starR" >4</span> <span
								class="starR">5</span>

						</div>
					</td>
				</tr>

				<tr>
					<td class="title"><label>내용</label></td>

					<td style="text-align: left"><textarea name="content" id="" cols="60" rows="15" style="resize:none;"></textarea></td>


				</tr>
				<tr>
					<td><input type="text" value="<%= loginUser.getUserNo() %>" style="display:none" name="userNo"></td>
				</tr>




				<tr>
					<td class="title"><label>사진첨부</label></td>
					<td style="text-align: left"><div id="fileArea">
					<input type="file" id="parcelout_uploadFiles1" name="parcelout_uploadFiles1">

				</div></td>
				</tr>


				<tr>

				</tr>




			</table>

		</div>
		<br>
		<br>
		<button type="submit">작성</button>

	</form>
	<script>
		$('.starRev span').click(function() {
			$('#starRev').val($(this).text())

			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});




	</script>
<%@ include file="../../../common/bottom_Include.jsp"%>


</body>
</html>
