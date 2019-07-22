<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	width: 600px;
	margin: 0 auto;
}

tr {
	height: 40px;
}

/* table tr td {
   text-align: left;
} */
table tr td.title {
	text-align: center;
}
}
</style>


</head>
<body>

	<form action="<%= request.getContextPath() %>/insert.bo" method="post">

		<h3>자유게시판 글쓰기</h3>

		<div id="border">
			<br> <br>


			<table id="ta">
				<tr>
					<td class="title"><label>제목</label></td>
					<td style="text-align: left;"><input type="text" name="bNm"
						size="40"> 분류 <select name="bKind">
							<option value="자랑">자랑</option>
							<option value="꿀팁">꿀팁</option>
							<option value="잡담">잡담</option>
					</select></td>
				</tr>


				<tr>
					<td class="title"><label>내용</label></td>

					<td style="text-align: left"><textarea name="bCon" rows="20"
							cols="70" style="resize: none;"></textarea></td>


				</tr>
				<tr>
					<td class="title"><label>사진첨부</label></td>
					<td style="text-align: left"><input type="file"></td>
				</tr>


				<tr>
					<input type="hidden" value="<%=loginUser.getUserNo()%>" name="uno">
				</tr>
			</table>
		</div>
		<br> <br> <input type="submit" value="등록하기" id="btn">
		<!-- onclick="location.href='/sixDestiny/views/member/5_freeBoard/1_freeBoard/1_main.jsp'" -->

		<button type="reset">취소하기</button>
	</form>


	<%@ include file="../../../common/bottom_Include.jsp"%>

</body>
</html>