<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.support.money.model.vo.*, com.kh.semi.support.product.model.vo.*, com.kh.semi.adminboard.model.vo.PageInfo"%>
<%@ include file="../../common/top_Include.jsp"%>
<%
	ArrayList<MoneySup> list = (ArrayList<MoneySup>) request.getAttribute("moneyList");
	ArrayList<ProductSup> list2 = (ArrayList<ProductSup>) request.getAttribute("productList");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	PageInfo pi2 = (PageInfo) request.getAttribute("pi2");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int listCount2 = pi2.getListCount();
	int currentPage2 = pi2.getCurrentPage();
	int maxPage2 = pi2.getMaxPage();
	int startPage2 = pi2.getStartPage();
	int endPage2 = pi2.getEndPage();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%@ include file="../../common/inner_admin_include.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>
	<div class="container">
  <h1 style="font-family: 'Sunflower', sans-serif;">후원 내역</h1>
  <br><br>
  <p style="font-family: 'Sunflower', sans-serif; font-size:1.3em">육인연 회원들의 금전후원 내역 현황입니다.</p>
  <br>
  <table class="table table-hover">
    <thead>
      <tr>
     	<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">내역번호</td>
      	<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">회원번호</td>
      	<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">회원이름</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원종류</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원금액</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">결제일</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원현황</td>
      </tr>
    </thead>
    <tbody>
      <% for(MoneySup ms : list) {%>
		<tr>
			<td style="font-family: 'Sunflower', sans-serif;" id="monSupNo"><%=ms.getSupAppNo()%></td>
			<td style="font-family: 'Sunflower', sans-serif;" id="userNo"><%= ms.getUserNo()%></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getUserNm()%></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getSupKind() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getSupPc() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getSupDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<% if(ms.getStatus().equals("S")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif;" name="okApply" onclick="okApply(<%=ms.getSupAppNo()%>);">신청승인</button>
				<% }else if(ms.getStatus().equals("T")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="okMoney" onclick="okMoney(<%=ms.getSupAppNo()%>);">납입확인</button>
				<% }else if(ms.getStatus().equals("N")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">입금대기</p>
				<% }else if(ms.getStatus().equals("C")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="okCancle" onclick="okCancle(<%=ms.getSupAppNo()%>);">취소처리</button>
				<% }else{ %>
					<p style="font-family: 'Sunflower', sans-serif;">후원완료</p>
				<% } %>
			</td>
		</tr>
      <% } %>
    </tbody>
  </table>
  <div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage=1&currentPage2=1'" class="btn btn-default"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled class="btn btn-default"><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage=<%=currentPage-1%>&currentPage2=1'" class="btn btn-default"><</button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<button disabled class="btn btn-default"><%= p %></button>
			<% 	}else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage=<%=p%>&currentPage2=1'" class="btn btn-default"><%=p %></button>
			<%
				}
				}
			%>

			<% if(currentPage >= maxPage){ %>
				<button disabled class="btn btn-default">></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage=<%=currentPage+1%>&currentPage2=1'" class="btn btn-default">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage=<%=maxPage%>&currentPage2=1'" class="btn btn-default">>></button>
		</div>

  <br><br><br>
  <p style="font-family: 'Sunflower', sans-serif; font-size:1.3em">육인연 회원들의 물품후원 내역 현황입니다.</p>
  <br>
  <table class="table table-hover">
    <thead>
      <tr>
      	<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">내역번호</td>
      	<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">회원번호</td>
      	<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">회원이름</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">카테고리</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원물품</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원일</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원현황</td>
      </tr>
    </thead>
    <tbody>
      <% for(ProductSup ps : list2) {%>
		<tr>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ps.getSupPdNo()%></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ps.getUserNo()%></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ps.getUserNm()%></td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<% if(ps.getCtgCd().equals("C1")) {%>
					사료 및 간식
				<% }else if(ps.getCtgCd().equals("C2")) {%>
					이불 및 담요
				<% }else if(ps.getCtgCd().equals("C3")) {%>
					건강용품
				<% }else{ %>
					장난감 및 의류
				<% } %>
			</td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ps.getPdNm() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ps.getSupDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<% if(ps.getStatus().equals("Y")){ %>
					후원완료
				<%}else{%>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="confirmPost" onclick="confirmPost(<%= ps.getSupPdNo()%>)">인수확인</button>
				<% } %>
			</td>
		</tr>
      <% } %>
    </tbody>
  </table>
	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage2=1&currentPage=1'" class="btn btn-default"><<</button>
			<% if(currentPage2 <= 1){ %>
				<button disabled class="btn btn-default"><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage2=<%=currentPage2-1%>&currentPage=1'" class="btn btn-default"><</button>
			<% } %>

			<% for(int p = startPage2; p <= endPage2; p++){
				if(currentPage2 == p){
			%>
					<button disabled class="btn btn-default"><%= p %></button>
			<% 	}else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage2=<%=p%>&currentPage=1'" class="btn btn-default"><%=p %></button>
			<%
				}
				}
			%>

			<% if(currentPage2 >= maxPage2){ %>
				<button disabled class="btn btn-default">></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage2=<%=currentPage2+1%>&currentPage=1'" class="btn btn-default">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/selectAllUser.su?currentPage2=<%=maxPage2%>&currentPage=1'" class="btn btn-default">>></button>
		</div>
  </div>
  <script type="text/javascript">
  	$(function(){
  		setInterval(function()
  			    {
  			       $("button[name=okMoney]").each(function(){
  			    	  $(this).css("background", "rgb(204, 230, 255)");
  			       });
  			    },500);

  		 setInterval(function()
   			    {
   			       $("button[name=okMoney]").each(function(){
   			    	  $(this).css("background", "white");
   			       });
   			    },1000);

  		setInterval(function()
  			    {
  			       $("button[name=okApply]").each(function(){
  			    	  $(this).css("background", "rgb(204, 230, 255)");
  			       });
  			    },500);

  		 setInterval(function()
   			    {
   			       $("button[name=okApply]").each(function(){
   			    	  $(this).css("background", "white");
   			       });
   			    },1000);

  		setInterval(function()
  			    {
  			       $("button[name=okCancle]").each(function(){
  			    	  $(this).css("background", "rgb(204, 230, 255)");
  			       });
  			    },500);

  		 setInterval(function()
   			    {
   			       $("button[name=okCancle]").each(function(){
   			    	  $(this).css("background", "white");
   			       });
   			    },1000);

  		setInterval(function()
  			    {
  			       $("button[name=confirmPost]").each(function(){
  			    	  $(this).css("background", "rgb(204, 230, 255)");
  			       });
  			    },500);

  		 setInterval(function()
   			    {
   			       $("button[name=confirmPost]").each(function(){
   			    	  $(this).css("background", "white");
   			       });
   			    },1000);

  	});

  	function okApply(monSupNo) {
		if(confirm("신청승인 처리 하시겠습니까?")){
			var monSupNo = monSupNo;

			$.ajax({
				url:"/sixDestiny/okApply.mon",
				type:"post",
				data:{monSupNo:monSupNo},
				success:function(data){
					location.href="/sixDestiny/selectAllUser.su";
					console.log("성공성공!")
				},
				error:function(){

				}
			});

		}else{
			return;
		}
	}

  	function okMoney(monSupNo) {
		if(confirm("납입완료 처리 하시겠습니까?")){
			var monSupNo = monSupNo;

			$.ajax({
				url:"/sixDestiny/okMoney.mon",
				type:"post",
				data:{monSupNo:monSupNo},
				success:function(data){
					location.href="/sixDestiny/selectAllUser.su";
					console.log("성공성공!")
				},
				error:function(){

				}
			});

		}else{
			return;
		}
	}

  	function confirmPost(monSupNo) {
		if(confirm("인수완료 처리 하시겠습니까?")){
			var monSupNo = monSupNo;

			$.ajax({
				url:"/sixDestiny/confirmPost.pro",
				type:"post",
				data:{monSupNo:monSupNo},
				success:function(data){
					location.href="/sixDestiny/selectAllUser.su";
					console.log("성공성공!")
				},
				error:function(){

				}
			});

		}else{
			return;
		}
	}

  	function okCancle(monSupNo) {
		if(confirm("정기후원 취소 처리 하시겠습니까?")){
			var monSupNo = monSupNo;

			$.ajax({
				url:"/sixDestiny/okCancle.pro",
				type:"post",
				data:{monSupNo:monSupNo},
				success:function(data){
					location.href="/sixDestiny/selectAllUser.su";
					console.log("성공성공!")
				},
				error:function(){

				}
			});

		}else{
			return;
		}
	}
  </script>
	<%@ include file="../../common/bottom_Include.jsp"%>
</body>
</html>