<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.entrance.model.vo.*, com.kh.semi.adminboard.model.vo.PageInfo"%>
<%
	ArrayList<EntranceDogInfo> list = (ArrayList<EntranceDogInfo>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h1 style="font-family: 'Sunflower', sans-serif;">신청 내역</h1>
  <br><br>
  <p style="font-family: 'Sunflower', sans-serif; font-size:1.3em">육인연 회원들의 입소신청 내역 현황입니다.</p>
  <br>
  <table class="table table-hover">
    <thead>
      <tr>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">내역번호</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">회원번호</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">회원이름</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">신청일자</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">면담희망 일자</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">신청서</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">신청현황</td>
      </tr>
    </thead>
    <tbody>
      <% for(EntranceDogInfo dog : list) {%>
		<tr>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getEntAppNo() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getUserNo() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getUserNm() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getWriteDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= et.getSelHopeDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif;" onclick="viewEntranceApply();">신청서</button>
			</td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<% if(et.getAppSit().equals("N")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="entranceApplyKind(<%= et.getEntAppNo() %>);">신청 수락 및 반려</button>
				<% }else if(et.getAppSit().equals("I")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">입소신청 반려</p>
				<% }else if(et.getAppSit().equals("E")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="endEntranceApply(<%= et.getEntAppNo() %>);">입소상담 확정</button>
				<% }else{ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="viewEntranceDog(<%= et.getEntAppNo() %>);">입소완료</button>
				<% } %>
			</td>
		</tr>
      <% } %>
    </tbody>
  </table>
 </div>

</body>
</html>