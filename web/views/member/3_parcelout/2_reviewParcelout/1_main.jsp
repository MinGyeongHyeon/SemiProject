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
						<img src="/sixDestiny/parcelout_uploadFiles/<%=hmap2.get("changeNm2")%>" alt="Lights" style="width: 80%; height: 60px;">
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

 		if($(this).val() == '1'){

			var ajax = $(this).val();


			$('#parcelout').remove();
			$('.parceloutt').remove();

			 $.ajax({
				url:"selectOutList.tn?",
				data:{ajax:ajax},
				type:"get",
				success:function(data){
					console.log(data);
				var $testdiv = $('#testdiv');


					for(var i in data){

						var $divt = $('<div>');
						var $div = $('<div>');
						var $div2 = $('<div>');
						var $img = $('<img>');
						var $input = $('<input>');
						var $p = $('<p>');
						var $div4 = $('<div>');
						var $p2 = $('<p>');
						var $p3 = $('<p>');

						$divt.addClass('parceloutt')
						$div.attr("style",'display:inline-block');
						$div2.addClass('pracelout');
						$img.attr({'src':'/sixDestiny/parcelout_uploadFiles/'+ data[i].changeNm , 'style' :'width: 150px; height: 150px;' , 'align' :'left' });
						$div4.addClass('title');
						$input.attr({'type':'hidden', 'value': data[i].boardNo ,'id':'boardNo'});
						$p.html('제목 : ' + data[i].boardNm + '<br>' + '조회수 : ' + data[i].inqCount +'<br>' +'추천수 : ' + data[i].recCount +'<br>' +'작성일 : ' + data[i].boardDt);
						$p2.attr('id','boarduno');
						$p2.html('작성자 : ' + data[i].nickNm);
						$p3.addClass('text');

						$div4.append($input);
						$div4.append($p);
						$div4.append($p2);
						$div4.append($p3);
						$div2.append($img);

						$div.append($div2);
						$div.append($div4);

						$divt.append($div);

						$('#testdiv').before($divt);





					}
					$('.title').click(function(){
						var num = $(this).children().eq(0).val();

						location.href="<%= request.getContextPath() %>/selectParceloutOne.tn?num=" + num

					})


				}
			})

			sort = 1;
		} else if($(this).val() == '2'){

			var ajax = $(this).val();

				$('#parcelout').remove();
				$('.parceloutt').remove();
				 $('ul').remove();

			 $.ajax({
				url:"SelectSort.re",
				data:{ajax:ajax},
				type:"get",
				success:function(data){
					console.log(data);


					for(var i = 0; i < data.length-1; i++){

						var $divt = $('<div>');
						var $div = $('<div>');
						var $div2 = $('<div>');
						var $img = $('<img>');
						var $input = $('<input>');
						var $p = $('<p>');
						var $div4 = $('<div>');
						var $p2 = $('<p>');
						var $p3 = $('<p>');




						$divt.addClass('parceloutt')
						$div.attr("style",'display:inline-block');
						$div2.addClass('pracelout');
						$img.attr({'src':'/sixDestiny/parcelout_uploadFiles/'+ data[i].changeNm , 'style' :'width: 150px; height: 150px;' , 'align' :'left' });
						$div4.addClass('title');
						$input.attr({'type':'hidden', 'value': data[i].boardNo ,'id':'boardNo'});
						$p.html('제목 : ' + data[i].boardNm + '<br>' + '조회수 : ' + data[i].inqCount +'<br>' +'추천수 : ' + data[i].recCount +'<br>' +'작성일 : ' + data[i].boardDt);
						$p2.attr('id','boarduno');
						$p2.html('작성자 : ' + data[i].nickNm);
						$p3.addClass('text');

						$div4.append($input);
						$div4.append($p);
						$div4.append($p2);
						$div4.append($p3);
						$div2.append($img);

						$div.append($div2);
						$div.append($div4);

						$divt.append($div);

						console.log(data[5].getListCount);
						console.log(data);

						$('#testdiv').before($divt);



					}

					var currentPage = data[5].currentPage;
					var getListCount = data[5].getListCount;
					var limit = data[5].limit;
					var maxPage = data[5].maxPage;
					var startPage = data[5].startPage;
					var endPage = data[5].endPage;

				 	var $ul = $('<ul>');

					var $li1 = $('<li>');
					var $li2 = $('<li>');
					var $li3 = $('<li>');
					var $li4 = $('<li>');
					var $li5 = $('<li>');

					var $a1 = $('<a>');
					var $a2 = $('<a>');

					var $a4 = $('<a>');
					var $a5 = $('<a>');

					$ul.addClass('pagination');

					$a1.attr('href', '<%= request.getContextPath()%>/SelectSort.re?currentPage=1');
					$a1.html('◀◀');
					$li1.append($a1);
					$ul.append($li1);

					$a2.attr('href','<%=request.getContextPath()%>/SelectSort.re?currentPage=<%=(int)(Math.floor(currentPage/10))*10%>');
					$a2.html('◀');
					$li2.append($a2);
					$ul.append($li2);

					for(var p = startPage; p <= endPage; p++){
						$a3 = $('<a>');
						$a3.attr('href','<%=request.getContextPath()%>/SelectSort.re?currentPage='+ p);
						$a3.html(p);
						$li3.append($a3);
					$ul.append($li3);
					}

					$a4.attr('href', '<%=request.getContextPath()%>/SelectSort.re?currentPage=<%=(int)(Math.ceil(currentPage/10))*10+11%>');
					$a4.html('▶');
					$li4.append($a4);
					$ul.append($li4);

					$a5.attr('href','<%=request.getContextPath()%>/SelectSort.re?currentPage=<%=maxPage%>');
					$a5.html('▶▶');
					$li5.append($a5);
					$ul.append($li5);







					$('.pagingArea').before($ul);



					$('.title').click(function(){
						var num = $(this).children().eq(0).val();

						location.href="<%= request.getContextPath() %>/selectParceloutOne.tn?num=" + num

					})




				}
			})

		}else{

			var ajax = $(this).val();


				$('#parcelout').remove();
				$('.parceloutt').remove();

			 $.ajax({
				url:"SelectSort.iq",
				data:{ajax:ajax},
				type:"get",
				success:function(data){
					console.log(data);


					for(var i in data){

						var $divt = $('<div>');
						var $div = $('<div>');
						var $div2 = $('<div>');
						var $img = $('<img>');
						var $input = $('<input>');
						var $p = $('<p>');
						var $div4 = $('<div>');
						var $p2 = $('<p>');
						var $p3 = $('<p>');

						$divt.addClass('parceloutt')
						$div.attr("style",'display:inline-block');
						$div2.addClass('pracelout');
						$img.attr({'src':'/sixDestiny/parcelout_uploadFiles/'+ data[i].changeNm , 'style' :'width: 150px; height: 150px;' , 'align' :'left' });
						$div4.addClass('title');
						$input.attr({'type':'hidden', 'value': data[i].boardNo ,'id':'boardNo'});
						$p.html('제목 : ' + data[i].boardNm + '<br>' + '조회수 : ' + data[i].inqCount +'<br>' +'추천수 : ' + data[i].recCount +'<br>' +'작성일 : ' + data[i].boardDt);
						$p2.attr('id','boarduno');
						$p2.html('작성자 : ' + data[i].nickNm);
						$p3.addClass('text');

						$div4.append($input);
						$div4.append($p);
						$div4.append($p2);
						$div4.append($p3);
						$div2.append($img);

						$div.append($div2);
						$div.append($div4);

						$divt.append($div);




						$('#testdiv').before($divt);





					}
					$('.title').click(function(){
						var num = $(this).children().eq(0).val();

						location.href="<%= request.getContextPath() %>/selectParceloutOne.tn?num=" + num

					})




				}
			})
		}
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


<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>