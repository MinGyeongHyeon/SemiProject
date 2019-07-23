<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

  <button type="button" class="btn btn-default" onclick="location.href='/sixDestiny/userManage'">회원관리</button>
  <button type="button" class="btn btn-default" onclick="location.href='/sixDestiny/views/admin/1_admin/2_applyManagement.jsp'">신청관리</button>
  <button type="button" class="btn btn-default" onclick="location.href='/sixDestiny/views/admin/1_admin/4_scheduleManagement.jsp'">일정관리</button>
  <button type="button" class="btn btn-default" onclick="location.href='/sixDestiny/adselectList.bo'">게시판관리</button>
  <button type="button" class="btn btn-default" onclick="location.href='/sixDestiny/selectAllMonsup'">후원관리</button>
  <button type="button" class="btn btn-default" onclick="location.href='/sixDestiny/views/admin/1_admin/7_statistics.jsp'">통계</button>

</div>
<br><br>

</body>
</html>