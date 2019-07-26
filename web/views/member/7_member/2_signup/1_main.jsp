<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
	width: 300px;
	height: 50px;
}

#button2 {
	background: yellow;
	Color: Shaddlebrown;
	width: 300px;
	height: 50px;
	font-weight: bold;
}
</style>
<body>
	<div>
	
		<div>
			<img src="/sixDestiny/views/images/signup.PNG" id="img"
				style="width: 170px;">
		</div>
		
		<br> <br> <br>
		
		<div>
			<button class="btn btn-info" id="button"
				onclick="location.href='/sixDestiny/views/member/7_member/2_signup/2_acceptterms.jsp'"
				style="width: 222px; height: 50px; font-family: 'Sunflower', sans-serif;">ID/PW
				로 회원가입</button>
		</div>
		
		<br>
		
		<div>

			<%-- 카카오톡 회원가입 --%>

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
								//var gender = res.properties['custom_field1'];
								
								$.ajax({
									
									url : "/sixDestiny/kakaosignup",
									data : {userId:userId,email:email,userName:userName},
									type:"post",
									success:function(data){
										console.log(data.substr(14,1));
										console.log(data.substr(2,10));
										var result = data.substr(14,1);
										<%--result가 1이면 DB에없는 신규회원으로 추가정보입력받아야함--%>
										if(result = 1){								
											/* location.href = "/sixDestiny/views/member/7_member/2_signup/4_signupKakao.jsp?"+data.substr(2,10);
											console.log(data); */
											
										}else{								
											location.href = "/sixDestiny/index.jsp";
											console.log(data);
										}
									}
								})
								
								alert("카카오톡 계정으로 로그인에 성공하였습니다");
								//console.log(res.id);
								//console.log(res.kaccount_email);
								//console.log(res.properties['nickname']);
								
								console.log(userId);
								console.log(email);
								console.log(userName);
								
								//console.log(authObj.access_token); 
								//alert(JSON.stringify(authObj));
							}
						})
					},
					fail : function(err) {
						//alert(JSON.stringify(err));
						alert("ERROR");
					}
					
				});
				
				//]]>
			</script>
			
		</div>
		
		
		
		
		
	</div>
	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>