<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.missing.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>
<%
   ArrayList<HashMap<String, Object>> list =
         (ArrayList<HashMap<String, Object>>) request.getAttribute("list");

MissingPageInfo pi = (MissingPageInfo) request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();

%>
<!DOCTYPE htm>
<html>

<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
table tr td img {
	margin: 10px;
}
.thumb-list {
		width:220px;
		border:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}

</style>


</head>
<body>


	<div class="container" role="main" style="margin-top: 100px;">

		<h1 style="margin-bottom: 50px; display: inline-block;">강아지를 찾습니다</h1>
		<table align="center">
			<tr>
				<td style="padding: 20px;">
					<h3>실종 강아지를 보호중입니다.</h3>
				</td>
				<td style="padding: 20px;">
									<% if(loginUser != null){ %>
<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/sixDestiny/views/member/4_missing/2_protect/2_write.jsp'">글쓰기</button>
				<% }else{

				%>	<button type="button" onclick='alert("로그인하셔야 사용 가능합니다.")' class="btn btn-sm btn-primary">글쓰기</button>

				<%  } %>

				</td>
				<td style="padding: 20px;"><span>지역</span> <select>
						<option selected="selected">전체</option>
						<option>서울시</option>
						<option>인천시</option>
						<option>대전시</option>
						<option>울산시</option>
						<option>부산시</option>
						<option>경기도</option>
						<option>강원도</option>
						<option>세종시</option>
						<option>충정남도</option>
						<option>충정북도</option>
						<option>전라남도</option>
						<option>전라북도</option>
						<option>경상남도</option>
						<option>경상북도</option>
						<option>제주도</option>
				</select></td>
				<td style="padding: 20px;"><span>성별</span> <select>
						<option selected="selected">전체</option>
						<option>수컷</option>
						<option>암컷</option>
				</select></td>
				<td style="padding: 20px;"><span>날짜순</span> <select>
						<option selected="selected">최신순</option>
						<option>오래된순</option>
				</select></td>
			</tr>

		</table>

         <%
            for (int i = 0; i < list.size(); i++) {
               HashMap<String, Object> hmap = list.get(i);
         %>
<table class="thumb-list">

         <tr>
        
         <td >
         <div class="title">
            <input type="hidden" value="<%=hmap.get("boardNo")%>" id="Bno">
<%if(hmap.get("changeNm") !=null){ %>
            <img src="/sixDestiny/thumbnail_uploadFiles/<%=hmap.get("changeNm")%>"
               style="width: 200px; height: 200px; cursor: pointer;">
              <%}else{ %> 
      
               <% }%>
               </div>
               </td>
         </tr>


         <tr>
            <td ><%=hmap.get("boardNm")%></td>
         </tr>


         <tr>
            <td>성별 : <%=hmap.get("gender")%></td>
         </tr>        
          <%
            }
         %>
               </table>
               
               
            
      
               <script>
      $(function() {
         $(".title").click( function() {
 	var num=     $(this).children().eq(0).val();

                           console.log(num);
                


   location.href = "<%=request.getContextPath()%>/proSelectOne.bo?num=" + num ;
            });
         });
      </script>
      
      
<div class="container" align="center" style="margin-top: 50px;">

         <ul class="pagination">
            <li><a href="#"><</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">></a></li>
         </ul>
      </div>

      <div class="container" align="center" style="width: 500px;">
         <table>
            <tr>
               <td><select
                  style="height: 30px; margin-left: 20px; margin-right: 20px;">
                     <option selected="selected">전체</option>
                     <option>작성자</option>
                     <option>제목</option>
               </select></td>
               <td>

                  <form action="/action_page.php">
                     <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search"
                           name="search">
                        <div class="input-group-btn">
                           <button class="btn btn-default" type="submit">
                              <i class="glyphicon glyphicon-search"></i>
                           </button>
                        </div>
                     </div>
                  </form>
               </td>
            </tr>
         </table>


      </div>

</div>

	<div class="paging" align="center">
			<button  class="paging" onclick="location.href='<%=request.getContextPath() %>/proListo.bo?currentPage=1'"><<</button>

			<% if(currentPage <= 1)  { %>

				<button  class="paging" disabled><</button>

			<% } else { %>
				<button  class="paging" onclick="location.href='<%= request.getContextPath() %>/proListo.bo?currentPage=<%= currentPage -1%>'"><</button>

			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
					if(currentPage == p){
				%>
					<button class="paging" disabled><%= p %></button>


					<% }else{ %>
					<button  class="paging" onclick="location.href='<%=request.getContextPath() %>/proListo.bo?currentPage=<%= p %>'"><%= p %></button>

			<%
				}
					} %>



			<% if(currentPage >= maxPage){ %>
				<button  class="pagination" disabled>></button>
			<% }else{ %>
				<button  class="pagination" onclick="location.href='<%=request.getContextPath() %>/proListo.bo?currentPage=<%= currentPage + 1 %>'">></button>
			<% } %>



<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>