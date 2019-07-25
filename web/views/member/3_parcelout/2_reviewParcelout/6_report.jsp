<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.user.model.vo.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {margin:0; padding:0;}
td, p { font-size:12px;}
table.bg {background:url(/images/report/bg.gif) no-repeat center;}
table.choice {width:98%;}
table.choice td { height:25px; text-align:left;font-size:12px;}
p.notice {width:85%; background-color:#fff0f2; margin:8px 10px 10px 10px; padding:10px 10px; text-align:left; line-height:1.4em; border:1px solid #f3e0e2;font-size:12px;}
img, input {border:none}
span.red {color:#da1846}
</style>
<%

	User loginUser = (User) request.getSession().

%>
</head>
<body>
<script>

function check(){
	var radios = document.getElementsByName('reason');
	var value = "";
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].type === 'radio' && radios[i].checked) {
			value = radios[i].value;
		}
	}
	if(value==""){
		window.alert("신고사유를 선택해 주세요...");
		return false;
	}
	return true;
}
</script>

<table width="100%" height="300" border="0" cellspacing="0" cellpadding="0">

  <tbody><tr>
	<td style=" background:black url(/images/m/navi_bg.gif) center repeat;padding:8px 0 8px 0;text-align:center;font-weight:bold;color:white;">
		신고하기
	</td>
  			</tr>
 	 		<tr>
    	<td align="center" valign="top" style="padding-top:5px;">
     <form action="<%= request.getContextPath()%>/InsertReport.ir" method="post">
		<table border="0" cellspacing="0" cellpadding="0" class="choice">
			<tbody><tr>
				<td><input type="hidden" value="<%= request.getParameter("test")%>" name="test"></td>
				<td><input id="reason1" name="reason" type="radio" value="음란성 및 선정성">음란성 및 선정성</td>
				<td><input id="reason2" name="reason" type="radio" value="상업적 광고 홍보">상업적 광고 홍보</td>
				<td><input id="reason5" name="reason" type="radio" value="지나친 욕설 포함">지나친 욕설 포함</td>
			</tr>
			<tr>
				<td><input id="reason6" name="reason" type="radio" value="특정 대상 비난">특정 대상 비난</td>
				<td><input id="reason7" name="reason" type="radio" value="도배/낚시 내용">도배/낚시 내용</td>
			</tr>



		</tbody>
		</table>
				<input type="submit"  value="확인">
	</form>
					<p class="notice"><span class="red">분양 후기 게시판에서는 <b>음란성 / 광고 / 욕설 / 비난 / 도배 를 엄격히 금지</b>합니다. 조금이라도 분란사유라고 생각되면 부담갖지 마시고 제발 신고 부탁 드립니다.</span></p>
	</td>
  </tr>
</tbody>
</table>



</body>
</html>