<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>13_입소신청_신청서작성</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>

	<div style="border: 1px solid; width: 600px; margin: 0 auto;" id="div1">
		<h2>회원가입</h2>

		<b>서비스 약관 동의</b><br>
		<div style="border: 1px solid; padding: 10px;">
			<b>제 1조(목적)</b><br> 어쩌고 저쩌고<br> <b>제 2조(약관의 효력 및 변경)</b><br>
			어쩌고 저쩌고<br>
		</div>
		<input type="checkbox" name="join_agree1" id="agreebut1">위 내용에 동의합니다. <br>
		<br>
		<br> <b>개인정보 수집 및 이용 동의</b><br>
		<div style="border: 1px solid;">
			<b>보유 및 이용기간</b><br> 어쩌고 저쩌고<br> <b>동의거부 권리 및 불이익 내용</b><br>
			어쩌고저쩌고<br>
		</div>
		<input type="checkbox" name="join_agree2" id="agreebut2">위 내용에 동의합니다. <br>
		<br> <input id="signbut" type="button" value="회원가입"> <br>
		<br>
	</div>

	<script type="text/javascript">
		$(function(){
			$('#signbut').click(function(){
				if($('#agreebut2').is(":checked") == true && $('#agreebut2').is(":checked") == true){
					location.href="/sixDestiny/views/member/7_member/2_signup/3_signupHomepage.jsp";
				}else{
					alert("약관을 모두 동의하셔야 회원가입이 가능합니다.")
				}
			});
		});
	</script>


	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>