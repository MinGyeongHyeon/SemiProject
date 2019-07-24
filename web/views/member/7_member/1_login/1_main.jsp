<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<style>
#button {
	background: dimgray;
	Color: white;
}


</style>
<body>
	<div>
		<div>
			<img src="/sixDestiny/views/images/rogin.PNG" style="width: 170px;">
		</div>
		<br> <br> <br>
		<div>
			<button type="button" class="btn btn-info"
				onclick="location.href='2_login.jsp'"
				style="width: 222px; height: 50px; font-family: 'Sunflower', sans-serif;">ID/PW
				로 로그인</button>
		</div>
		<br>
		<div>

			<%-- 카카오톡 로그인 --%>

			<a id="kakao-login-btn"></a> <a
				href="http://developers.kakao.com/logout"></a>
			<script type='text/javascript'>
				//<![CDATA[
				// 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('a8cc106d455abafda8893930cf48c89e');
				// 카카오 로그인 버튼을 생성합니다.
				Kakao.Auth.createLoginButton({
					container : '#kakao-login-btn',
					success : function(authObj) {

						 Kakao.API.request({
							url: '/v1/user/me',
							success : function(res) {
								alert(JSON.stringify(res));
								alert(JSON.stringify(authObj));
								
								var userId = res.id;
								var email = res.kaccount_email;
								var userName = res.properties['nickname'];
								
								$.ajax({
									
									url : "/sixDestiny/kakaologin",
									data : {userId:userId,email:email,userName:userName},
									type:"post",
									success:function(){
										
										
									}
								})
								
								
								//console.log(res.id);
								//console.log(res.kaccount_email);
								//console.log(res.properties['nickname']);
								
								console.log(id);
								console.log(email);
								console.log(name);
								
								//console.log(authObj.access_token); 

								alert(JSON.stringify(authObj));
							
							}
						})
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
					
				});
				
				//]]>
			</script>
			
		</div>
	</div>


   <input type="hidden" id="tocken" name="tocken" value="0">
	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>s