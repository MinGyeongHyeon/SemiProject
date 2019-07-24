<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.user.model.vo.User, java.util.*, com.kh.semi.board.parcelout.model.vo.PageInfo" %>

<%@ include file="../../../common/top_Include.jsp"%>

<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("filelist");
	ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>) request.getAttribute("filelist2");

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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
.div1 {
	overflow: hidden;
	text-overflow: ellipsis;
}

.row {
	width: 100%;
	padding-left: auto;
	padding-right: auto;
}

.title {
	text-align: left;
	margin: 10 20;
	padding-left: 200px;
}

div {

	font-family: 'Sunflower', sans-serif;


}

.text {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 150px;
	width: 800px;
}



</style>
<title>Insert title here</title>


</head>
<body>

	<div style="height: 1800px;">
		<h3>인기글 BEST 5</h3>
		<hr>
	<div>
		<div class="container" style="height: 1000px; width: 70%;">

			<div class="row" style="margin-left: 89px;">
		 	<% for(int i = 0 ; i < list2.size(); i++) {
					HashMap<String,Object> hmap2 = list2.get(i);

					String Con2 = (String) hmap2.get("boardCon2");
					String Nm2 = (String) hmap2.get("boardNm2");
					String Nick = (String) hmap2.get("nickNm2");
				%>

				<div class="col-md-2" style="display: inline-block;'">
					<div class="thumbnail">
								<input type="hidden" value="<%= hmap2.get("boardNo2") %>">

								<% if(Nm2.length() > 5) { %>
								<p>제목 : <%= Nm2.substring(0, 5) + "...." %></p>
								<% }else{ %>
								<p>제목 : <%= Nm2 %></p>
								<% } %>

								<p>조회수 : <%= hmap2.get("inqCount2") %></p>
								<p>추천수 : <%= hmap2.get("recCount2") %></p>
								<% if(Nick.length() > 5){ %>
								<p>작성자 : <%= Nick.substring(0, 5) + "...." %></p>
								<% }else{ %>
								<p>작성자 : <%= Nick %></p>

								<% } %>





						<div class="testtt">
						<img src="/sixDestiny/parcelout_uploadFiles/<%=hmap2.get("changeNm2")%>" alt="Lights" style="width: 120px; height: 120px;">
						</div>
							<div class="caption">
							<% if(Con2.length() > 3 ){ %>
								 <p>내용 : <%= Con2.substring(0, 3) + "...." %> </p>
								 <% }else{ %>
								  <p>내용 : <%= Con2 %></p>
								  <% } %>
							</div>

					</div>
				</div>


				<% } %>
</div>
<hr />
<br /><br />


				<div align="right">

					<select class="Sort">
						<option selected value="1">최신순</option>
						<option value="2">추천순</option>
						<option value="3">조회순</option>
					</select>
				</div>


<div id="testdiv">

		<div id="parcelout">

			<% for(int i = 0; i < list.size(); i++){
					HashMap<String,Object> hmap = list.get(i);
					String sub = (String) hmap.get("boardCon");
			%>
			 <div style="display: inline-block;" >
			<%-- 					<p><%= hmap.get("boardKind") %></p> --%>

				<div class="pracelout">
				<img src="/sixDestiny/parcelout_uploadFiles/<%=hmap.get("changeNm")%>" align="left" style="width: 150px; height: 150px">
				</div>

				<div class="title">
						<input type="hidden" value="<%= hmap.get("boardNo")%>" id="boardNo">
								<p id="boardP">제목 : <%= hmap.get("boardNm") %><br>
								조회수 : <%= hmap.get("inqCount") %><br>
								추천수 : <%= hmap.get("recCount") %><br>
								작성일 : <%= hmap.get("boardDt") %></p>
					<p id="boarduno">작성자 : <%= hmap.get("nickNm") %></p>
					<p class="text">글 : <% if(sub.length() > 15 ) { %>
										<%= sub.substring(0, 14) + "...." %>
								<% }else{ %>
								<%= sub %>
								<%} %>
					</p>
				</div>
			</div>
			<% } %>
		</div>
</div>

	<script>

	$('.title').click(function(){
		var num = $(this).children().eq(0).val();

		location.href="<%= request.getContextPath() %>/selectParceloutOne.tn?num=" + num

	})
	$('.thumbnail').click(function(){
		var num = $(this).children().eq(0).val();

		location.href="<%= request.getContextPath() %>/selectParceloutOne.tn?num=" + num
	})

	$('.Sort').change(function(){

		<%-- if($(this).val() == '1'){
			location.href="<%=request.getContextPath()%>/selectOutList.tn" ;
		}else if($(this).val() == '2'){
			location.href="<%=request.getContextPath()%>/SelectSort.re" ;
		} --%>





 		if($(this).val() == '1'){

			var ajax = $(this).val();

			$('#parcelout').remove();

			 $.ajax({
				url:"selectOutList.tn?",
				data:{ajax:ajax},
				type:"get",
				success:function(data){
					console.log(data);
				var $testdiv = $('#testdiv');

					for(var i in data){

						var $div = $('<div>');
						var $div2 = $('<div>');
						var $img = $('<img>');
						var $div3 = $('<div>');
						var $input = $('<input>');
						var $p = $('<p>');

						$div.attr("style",'display:inline-block');
						$div2.addClass('pracelout');
						$img.attr({'src':'/sixDestiny/parcelout_uploadFiles/'+ data[i].changeNm , 'style' :'width: 150px; height: 150px;' });
						$div3.addClass('title');
						$input.attr({'type':'hidden', 'value': data[i]}.boardNo ,'id':'boardNo');





					/* 	$testdiv.append($img); */




					}



				}
			})


		}  /* else if($(this).val() == '2'){
			var ajax2 = $(this).val();

			$.ajax({
				url:
				data:
				type:"get",
				success:function(data){

				}
			})

		}else{
			var ajax3 = $(this).val();

			$.ajax({
				url:
				data:
				type:"get",
				success:function(data){

				}
			})

		} */
	})





	</script>
			<hr>


	<form action="<%= request.getContextPath()%>/outSelect.po" method="get">
	<div align="center">
		<p>
			<select style="height: 27px; margin: 8px" name="outselect" class="outselect">
				<option value="BOARD_NM">제목</option>
				<option value="NICK_NM">작성자</option>
			</select> <span class="glyphicon glyphicon-search"></span> <input type="text"
				style="width: 250px" name="selectinput" id="selectinput">
				<input type="submit" value="검색" id="outselect">
				<span></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<% if(loginUser != null){ %>
				<input type="button" value="글쓰기" onclick="location.href='/sixDestiny/views/member/3_parcelout/2_reviewParcelout/2_write.jsp'">
				<% } %>
		</p>

	</div>
</form>

	<%-- <div class="pagination" align="center">
			<button  class="pagination" onclick="location.href='<%=request.getContextPath() %>/selectOutList.tn?currentPage=1'"><<</button>

			<% if(currentPage <= 1)  { %>

				<button  class="pagination" disabled><</button>

			<% } else { %>
				<button  class="pagination" onclick="location.href='<%= request.getContextPath() %>/selectOutList.tn?currentPage=<%= currentPage -1%>'"><</button>

			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
					if(currentPage == p){
				%>
					<button class="pagination" disabled><%= p %></button>


					<% }else{ %>
					<button  class="pagination" onclick="location.href='<%=request.getContextPath() %>/selectOutList.tn?currentPage=<%= p %>'"><%= p %></button>

			<%
				}
					} %>



			<% if(currentPage >= maxPage){ %>
				<button  class="pagination" disabled>></button>
			<% }else{ %>
				<button  class="pagination" onclick="location.href='<%=request.getContextPath() %>/selectOutList.tn?currentPage=<%= currentPage + 1 %>'">></button>
			<% } %> --%>

			<div class="pagingArea" align="center">
		<ul class="pagination">


			<% if(currentPage != 1){ %>
			<li><a href="<%=request.getContextPath()%>/selectOutList.tn?currentPage=1">◀◀</a></li>

			<% }%>


			<% if(10 >= currentPage){ %>


			<% }else if(currentPage%10 != 0){ %>
			<li><a href="<%=request.getContextPath()%>/selectOutList.tn?currentPage=<%=(int)(Math.floor(currentPage/10))*10%>">◀</a></li>
			<%}else{ %>
			<li><a href="<%=request.getContextPath()%>/selectOutList.tn?currentPage=<%=(int)(Math.floor((currentPage-1)/10))*10%>">◀</a></li>
			<%} %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<li ><a style="background:rgb(240,240,240); font-weight:bold;" href="#" disabled><%= p %></a></li>

			<% } else { %>
			<li><a href="<%=request.getContextPath()%>/selectOutList.tn?currentPage=<%=p%>" disabled><%= p %></a></li>

			<%
				}
			   }
			%>

			<% if(currentPage >= maxPage){ %>

			<% }else if(Math.floor(maxPage/10)*10 >= currentPage){ %>
			<li><a href="<%=request.getContextPath()%>/selectOutList.tn?currentPage=<%=(int)(Math.ceil(currentPage/10))*10+11%>">▶</a></li>

			<% }%>

			<% if(currentPage < maxPage){ %>
			<li><a href="<%=request.getContextPath()%>/selectOutList.tn?currentPage=<%=maxPage%>">▶▶</a></li>
			<%} %>
		</ul>
		</div>

			<%-- <script>
				$('#outselect').click(function(){
					var outselect = $('.outselect').val();
					var selectinput = $('#selectinput').val();


					location.href="<%= request.getContextPath()%>/outSelect.po?outselect="+ outselect + "?selectinput=" + selectinput;

				})

			</script> --%>

<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>