<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#stuff {
	background: grey;
	margin: 0 auto;
	border-style: outset;
	border-top-left-radius: 60px;
	border-bottom-right-radius: 60px;
	border-top-right-radius: 60px;
	border-bottom-left-radius: 60px;
	width: 60%;
}

table tr td.category {
	font-weight: bold;
	width: 80px;
	height: 40px;
	text-align: center;
	background: rgb(204, 230, 255);
	font-family: 'Gaegu', cursive;
}

table tr td.category2 {
	padding-left: 20%;
	font-family: 'Gaegu', cursive;
}

input {
	font-family: 'Gaegu', cursive;
}

span {
	font-family: 'Gaegu', cursive;
	font-weight: bold;
}

#F {
	font-family: 'Gaegu', cursive;
}
</style>
</head>
<body>

	<h1 align="center" style='font-family: Gaegu, cursive;'>물품 후원 신청</h1>
	<h3 align="center" style='font-family: Gaegu, cursive;'>신청인 정보</h3>

	<form action="" method="">


		<div align="center" id="stu">
			<table id="table">
				<tr>
					<td class="category"><label>이름</label></td>
					<td class="category2"><label><%= loginUser.getUserNm() %></label></td>
					<td><br />
					<br /></td>
				</tr>
				<tr>
					<td class="category"><label>연락처</label></td>
					<td class="category2"><input type="tel" name="phone"></td>
					<td><br />
					<br /></td>
				</tr>
				<tr>
					<td class="category">성별</td>
					<td class="category2"><input type="radio" name="gender">남자</td>
					<td id="F"><input type="radio" name="gender">여자</td>
					<td><br />
					<br /></td>
				</tr>
				<tr>
					<td class="category"><label>생년월일</label></td>
					<td class="category2"><input type="date" name="birth"></td>
					<td><br />
					<br /></td>
				</tr>
				<tr>
					<td class="category"><label>주소</label></td>
					<td class="category2"><input type="text" name="address"></td>
					<td><br />
					<br /></td>
				</tr>
				<tr>
					<td class="category"><label>후원품종류</label></td>
					<td class="category2"><select name="spon" id="">
							<option value="사료 및 간식">사료 및 간식</option>
							<option value="이불및 담요">이불 및 담요</option>
							<option value="건강용품">건강용품</option>
							<option value="장난감 및 의류">장난감 및 의류</option>
					</select></td>
					<td><br />
					<br /></td>
				</tr>
			</table>
			<br />
			<br />
			<br />
			<br />
		</div>

		<div id="stuff">
			<br />
			<h1 style='color: red; font-family: Gaegu, cursive;'>※필독!
				주의사항※</h1>
			<span>물품 후원시 상품배송은 반드시 선불로 보내주셔야 합니다. <br> 선불이 아닐경우 발송자에게
				반송되오니 다시한번 확인하시어 <br> 착오없이 진행해주시기 바랍니다. 보내실 배송사는 어느곳이어도 <br>
				성관없습니다. 배송지 주소는 다음과 같습니다.<br> 배송지 주소
			</span>

			<h3 style='color: red; font-family: Gaegu, cursive;'>서울시 강남구
				역삼동 xxx-xx</h3>
			<br /> <input type="submit" value="다음">

		</div>
	</form>




<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>