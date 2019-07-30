<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = Integer.parseInt(request.getParameter("userNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
  <script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
  <link href="https://fonts.googleapis.com/css?family=Gaegu|Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
	<br><br>
	<div>
		<table style="margin:0 auto">
			<tr align="center">
				<td style="font-family: 'Sunflower', sans-serif;"><input class="btn btn-default" style="font-family: 'Sunflower', sans-serif;" type="button" onclick="gochat();" value="상담요청하기"></td>
			</tr>
			<tr><td><br><br></td></tr>
			<tr>
				<td><textarea rows="15" cols="50" style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td><input id="charComment" type="text" style="width:100%"></td>
			</tr>
		</table>
	</div>

<script type="text/javascript">
	$(function(){
		/* gochat2(); */
	})

	function gochat(){
		var wsUri = "ws://localhost:8002/sixDestiny/confirm";
		ws = new WebSocket(wsUri);
		//서버 시작할 때 동작
		ws.onopen = function(evt){
			var confirm = "confirm";

			console.log(confirm);

			ws.send(confirm);

		}

		//서버로부터 메세지를 전달 받을 때 동작하는 메소드
		ws.onmessage = function(event){
			onMessage(event);
		}

		//서버에서 에러가 발생할 경우 동작할 메소드
		ws.onerror = function(event){
			onError(event);
		}

		//서버와의 연결이 종료될 경우 동작하는 메소드
		ws.onclose = function(event){
			onClose(event);
		}

	}

	function send(msg){
		ws.send(msg);
	}

	function onMessage(event){
		var serverMessage = event.data;

		var productName = serverMessage[0];
		var startPrice = serverMessage[1];
		var currentPrice = serverMessage[1];
		var remainHour = serverMessage[2];
		var remainMin = serverMessage[3];
		var remainSec = serverMessage[4];

		$remainTime = $("#remainTime");

		$remainTime.html(remainHour + " : " + remainMin + " : " + remainSec);
	}


</script>
</body>
</html>