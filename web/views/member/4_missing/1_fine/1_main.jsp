<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.missing.model.vo.*"%>
<%@ include file="../../../common/top_Include.jsp"%>
<%
   ArrayList<HashMap<String, Object>> list =
         (ArrayList<HashMap<String, Object>>) request.getAttribute("list");

/* MissingPageInfo pi = (MissingPageInfo) request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage(); */

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
               <h3>실종 강아지를 찾습니다.</h3>
            </td>
            <td style="padding: 20px;">
               <% if(loginUser != null){ %>
<button type="button" onclick="location.href='/sixDestiny/views/member/4_missing/1_fine/2_write.jsp'" class="btn btn-sm btn-primary">글쓰기</button>
            <% }else{

            %>   <button type="button" onclick='alert("로그인하셔야 사용 가능합니다.")' class="btn btn-sm btn-primary">글쓰기</button>

            <%  } %>


            </td>
            <td style="padding: 20px;"><span>지역</span> <select id="li1">
                  <option selected="selected">전체</option>
                  <option value="서울시">서울시</option>
                  <option value="인천시">인천시</option>
                  <option value="대전시">대전시</option>
                  <option value="울산시">울산시</option>
                  <option value="부산시">부산시</option>
                  <option value="경기도">경기도</option>
                  <option value="강원도">강원도</option>
                  <option value="세종시">세종시</option>
                  <option value="충정남도">충정남도</option>
                  <option value="충정북도">충정북도</option>
                  <option value="전라남도">전라남도</option>
                  <option value="전라북도">전라북도</option>
                  <option value="경상남도">경상남도</option>
                  <option value="경상북도">경상북도</option>
                  <option value="제주도">제주도</option>
            </select></td>
            <td style="padding: 20px;"><span>성별</span> <select id="li2">
                  <option selected="selected">전체</option>
                  <option value="수컷">수컷</option>
                  <option value="암컷">암컷</option>
            </select></td>
            <td style="padding: 20px;"><span>날짜순</span> <select id="li3">
                  <option selected="selected" value="최신순">최신순</option>
                  <option value="오래된순">오래된순</option>
            </select></td>
         </tr>

      </table>
   

         <%
         System.out.print("리스트사이즈?"+list.size());
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
               style="width: 200px; height: 200px; cursor: pointer;" >
              <%}else{ %> 
      
               <% }%>
               </div>
               </td>
         </tr>


         <tr>
            <td id="a"><%=hmap.get("boardNm")%></td>
         </tr>

         <tr>
            <td >사례금 : <%=hmap.get("reward")%>만원</td>
         </tr>
         <tr>
            <td>성별 : <%=hmap.get("gender")%></td>
         </tr>        
          <%
            }
         %>
               </table>
               
               
            
      
      
      
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
                <form  action="<%=request.getContextPath() %>/missingsearch.bo" method="post" >
         <table>
            <tr>
               <td><select
                  style="height: 30px; margin-left: 20px; margin-right: 20px;" name="searchVal">
                     <option selected="selected" value="전체">전체</option>
                     <option vlaue="작성자">작성자</option>
                     <option vlaue="제목">제목</option>
               </select></td>
               <td>

                     <div class="input-group">
                     
                        <input type="text" class="form-control" placeholder="Search"
                           name="search">
                             <%
            for (int i = 0; i < list.size(); i++) {
               HashMap<String, Object> hmap = list.get(i);
         %>
                                      <input type="hidden" value="<%=hmap.get("boardNo")%>" name="num">
                                      <%} %>
                        <div class="input-group-btn">
                           <button class="btn btn-default" type="submit" >
                       
                           </button>
                        </div>
                     </div>
                  </form>
               </td>
            </tr>
         </table>


      </div>

</div>
</form>

<%-- 	<div class="paging" align="center">
			<button  class="paging" onclick="location.href='<%=request.getContextPath() %>/missingListo.bo?currentPage=1'"><<</button>

			<% if(currentPage <= 1)  { %>

				<button  class="paging" disabled><</button>

			<% } else { %>
				<button  class="paging" onclick="location.href='<%= request.getContextPath() %>/missingListo.bo?currentPage=<%= currentPage -1%>'"><</button>

			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
					if(currentPage == p){
				%>
					<button class="paging" disabled><%= p %></button>


					<% }else{ %>
					<button  class="paging" onclick="location.href='<%=request.getContextPath() %>/missingListo.bo?currentPage=<%= p %>'"><%= p %></button>

			<%
				}
					} %>



			<% if(currentPage >= maxPage){ %>
				<button  class="pagination" disabled>></button>
			<% }else{ %>
				<button  class="pagination" onclick="location.href='<%=request.getContextPath() %>/missingListo.bo?currentPage=<%= currentPage + 1 %>'">></button>
			<% } %>
 --%>


               <script>
      $(function() {
         $(".title").click( function() {
 	var num=     $(this).children().eq(0).val();

                           console.log(num);
                


   location.href = "<%=request.getContextPath()%>/missingSelectOne.bo?num=" + num ;
            });
         
         
         
         $("#li1").change(function(){
   			var li = $("#li1").val();
   			
   			
   			$.ajax({
   				url:"missingorder.bo",
   				data:{li:li},
   				type:"get",
   				success:function(data){
   					//console.log(data);
   					var $tables = $(".thumb-list");
   					console.log(data[0].boardNm);
   					$tables.html("");
   					for(var key in data){
   						var $tr = $("<tr>");
   						var $image = $("<td>").html('<img src="/sixDestiny/thumbnail_uploadFiles/"+data[key].changeNm>');		
   						var $boardNm = $("<td>").text(data[key].boardNm).css("width", "100px");
   						var $reward = $("<td>").text(data[key].reward).css("width", "100px");
   						var $gender =  $("<td>").text(data[key].gender).css("width", "100px");
   						$tr.append($image,$boardNm,$reward,$gender);
   					s
   						$tables.append($tr);
   						
   					}
   						
   						
   						
   					
   					
   					
   				},
   				error:function(err){
   					console.log("서버 전송 실패!");
   				},
   				complete:function(data){
   					console.log("무조건 호출되는 함수");
   				}
   			});
         });
         
         
         });


      
      </script>


<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>