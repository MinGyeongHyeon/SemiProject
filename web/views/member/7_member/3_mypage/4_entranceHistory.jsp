<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.entrance.model.vo.*, com.kh.semi.parcelout.model.vo.*"%>
 <%
	ArrayList<Entrance> list = (ArrayList<Entrance>) request.getAttribute("entranceList");
	ArrayList<ParcelOut> list2 = (ArrayList<ParcelOut>) request.getAttribute("parceloutList");
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
    <%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../../../common/inner_user_include.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
  <script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
</head>
<body>
	<div class="container">
  <h1 style="font-family: 'Sunflower', sans-serif;">후원 내역</h1>
  <br><br>
  <p style="font-family: 'Sunflower', sans-serif; font-size:1.3em"><%=loginUser.getNickNm()%>님의 금전후원 내역 현황입니다.</p>
  <br>
  <table class="table table-hover">
    <thead>
      <tr>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">신청일자</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">상담 희망일자</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">신청서보기</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">신청처리</td>
      </tr>
    </thead>
    <tbody>
      <% for(Entrance et : list) {%>
		<tr>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getWriteDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getSelHopeDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif;" onclick="viewEntranceApply();">신청서</button>
			</td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<% if(et.getAppSit().equals("N")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">신청수락 대기</p>
				<% }else if(et.getAppSit().equals("I")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="entranceReault();">입소신청 반려</button>
				<% }else if(et.getAppSit().equals("E")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="entranceSel();">입소상담 수락</button>
				<% }else if(ms.getStatus().equals("T")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">납입대기</p>
				<% }else if(ms.getSupKind().equals("정기") && ms.getStatus().equals("N")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="goRegMoney(<%= ms.getSupAppNo()%>);">납입하기</button>
				<% }else if(ms.getStatus().equals("C")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">취소대기</p>
				<% }else if(ms.getStatus().equals("E")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">취소완료</p>
				<% }else{ %>
					<p style="font-family: 'Sunflower', sans-serif;">후원완료</p>
				<% } %>
			</td>
		</tr>
      <% } %>
    </tbody>
  </table>
  <div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage=1&currentPage2=1'" class="btn btn-default"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled class="btn btn-default"><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage=<%=currentPage-1%>&currentPage2=1'" class="btn btn-default"><</button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<button disabled class="btn btn-default"><%= p %></button>
			<% 	}else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage=<%=p%>&currentPage2=1'" class="btn btn-default"><%=p %></button>
			<%
				}
				}
			%>

			<% if(currentPage >= maxPage){ %>
				<button disabled class="btn btn-default">></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage=<%=currentPage+1%>&currentPage2=1'" class="btn btn-default">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage=<%=maxPage%>&currentPage2=1'" class="btn btn-default">>></button>
		</div>

  <br><br><br>
  <p style="font-family: 'Sunflower', sans-serif; font-size:1.3em"><%=loginUser.getNickNm()%>님의 금전후원 내역 현황입니다.</p>
  <br>
  <table class="table table-hover">
    <thead>
      <tr>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">카테고리</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원물품</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원일</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원물품현황</td>
      </tr>
    </thead>
    <tbody>
      <% for(ParcelOut ps : list2) {%>
		<tr>
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
					인수완료
				<%}else{%>
					인수중
				<% } %>
			</td>
		</tr>
      <% } %>
    </tbody>
  </table>
	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage2=1&currentPage=1'" class="btn btn-default"><<</button>
			<% if(currentPage2 <= 1){ %>
				<button disabled class="btn btn-default"><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage2=<%=currentPage2-1%>&currentPage=1'" class="btn btn-default"><</button>
			<% } %>

			<% for(int p = startPage2; p <= endPage2; p++){
				if(currentPage2 == p){
			%>
					<button disabled class="btn btn-default"><%= p %></button>
			<% 	}else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage2=<%=p%>&currentPage=1'" class="btn btn-default"><%=p %></button>
			<%
				}
				}
			%>

			<% if(currentPage2 >= maxPage2){ %>
				<button disabled class="btn btn-default">></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage2=<%=currentPage2+1%>&currentPage=1'" class="btn btn-default">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/myApply.ap?currentPage2=<%=maxPage2%>&currentPage=1'" class="btn btn-default">>></button>
		</div>
  </div>
</body>
</html>