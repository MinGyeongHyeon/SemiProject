<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#button {
	background: dimgray;
	Color: white;
	width: 300px;
	height: 50px;s
}

#button2 {
	background: yellow;
	Color: Shaddlebrown;
	width: 300px;
	height: 50px;
	font-weight: bold;
}

.test {
	width: 50%;
	margin: 0 auto;
}

#signuptable {
	margin:0 auto;
	width:400px;
}

.lefttd {
	text-align: left;
}

#hiddentr {
	opacity:0;
}

</style>
<body>
	<div>

		<div>
			<img src="/sixDestiny/views/images/signup.PNG" style="width: 170px;">
		</div>
		<div class="test">
		<form action="#" method="get">
			<table id="signuptable">
				<tr>
					<td colspan="2" class="lefttd">
						<h5>* 은 필수 입력 사항입니다.</h5>
					</td>
				</tr>
				<tr>
					<td class="lefttd"><label>*이름</label></td>
					<td><input type="text" /></td>
					<td></td>
				</tr>
				<tr>
					<td class="lefttd"><label>*닉네임</label></td>
					<td><input type="text" /></td>
					<td class="lefttd">
						<button type="button" onclick="checkNickname();">중복확인</button>
					</td>

				</tr>
				<tr>
					<td class="lefttd"><label>*이메일</label></td>
					<td><input type="text" id="email" name="email"/></td>
					<td class="lefttd">
						<button type="button" id="mailbtn" onclick="sendMail();">인증번호</button>
					</td>
				</tr>
				<tr>
					<td class="lefttd"><h5>추가 입력 사항</h5></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td class="lefttd"><label>주소</label></td>
					<td><input type="text" /></td>
					<td></td>
				</tr>
				<tr>
					<td class="lefttd"><label>반려견 유무</label></td>
					<td colspan="1"><input type="checkbox" />있다 <input type="checkbox" />없다</td>
				</tr>
				<tr>
					<td class="lefttd"><label>가입경로</label></td>
					<td colspan="1">
						<select>
							<option>SNS</option>
							<option>검색</option>
							<option>지인추천</option>
							<option>인터넷광고</option>
							<option>기타</option>
						</select>
					</td>
				</tr>
			</table>
			<br>
			<input type=submit value="회원가입">
		</form>
		</div>
	</div>

<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>