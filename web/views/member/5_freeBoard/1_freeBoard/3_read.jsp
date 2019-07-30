<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.free.model.vo.*, java.util.*"%>
<%
	UserBoard ub = (UserBoard) request.getAttribute("ub");
	ArrayList<UserBoardAttachment> fileList = (ArrayList<UserBoardAttachment>) request.getAttribute("fileList");
	UserBoardAttachment titleImg = fileList.get(0);
	int recCount = (int) request.getAttribute("recCount");

%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판 글보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>

.btn btn-default{
	height:50px;
}
</style>

</head>
<body>

	<div>
	

		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><%=ub.getbNo()%></th>
						<th>카테고리 : <%=ub.getbKind() %></th>
						<th>제목 : <%=ub.getbNm()%></th>
						<th>글쓴이 : <%=ub.getbUserNick() %></th>
						<th> 작성날짜 : <%=ub.getbDate() %></th>
						<th>조회수 : <%=ub.getInqCon() %></th>
						
						<th >추천수 : <span id="recCount"> <%=recCount  %></span></th>
						<% if(loginUser != null && !loginUser.getNickNm().equals(ub.getbUserNick())) {%>
						<th id="heart">	</th>
						<th style="padding-bottom: 0px;"><input type="button" value="신고" id="reportPr" style="outline-style:none;" class="btn btn-default" onclick="report(<%= loginUser.getUserNo()%>)"></th>
						<% } %>
						<% if(loginUser != null && loginUser.getNickNm().equals(ub.getbUserNick())){ %>
						
							<th style="padding-bottom: 0px;"><button class="btn btn-default" onclick="updateBoard()">글수정</button></th>
								<th style="padding-bottom: 0px;"><button class="btn btn-default" onclick="deleteBoard()">글삭제</button></th>
							
							<% } %>
						
					</tr>
				</thead>
			</table>
		</div>


		<div style="padding: 30px" align="center">
			
				<img onerror="this.style.display='none'" id="titleImg" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeNm()%>">
			
			<p style="width: 1000px; padding: 80px;"><%=ub.getbCon() %></p>
		</div>

		<hr>
		

		
			<table class="ui single line table" style="width:70%; text-align:center; margin-left:auto; margin-right:auto;">
				  <thead>
				    <tr>
				      <th>댓글번호</th>
				      <th>작성자</th>
				      <th>내용</th>
				      <th>날짜</th>
				      <%if(loginUser != null){ %>
				      <th>신고</th>
				      <th>수정 삭제</th>
				      <%} %>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>123</td>
				      <td id="comwriter">트월킹지효</td>
				      <td>ㄴㅇ놀엏라ㅗ헔ㄱㄷㅈㄱㄷㅅㅁ굔여샤ㅕㅏ롷ㄹㅇㄴㄷㅅㄱ묜ㅇ샤ㅕ라ㅗㅎㅇㄹㅇㅎㄴㄷㅅㄱ묜샤여ㅣㅗㅓㅇㅎㄹㅇㄱㄷㅅㅛㄱㅁㄴ샤아호롱ㅎㄴㄷ</td>
				      <td>19/07/30</td>
				      
				 <% if(loginUser != null){%>
				 
				     
				      <td style="padding:3px;"><input type="button" value="신고" id="reportPr" style="outline-style:none;" class="btn btn-default"></td>
			    	  <td style="padding:3px;">	
				      	<div class="ui buttons">
					  	<button class="ui button">수정</button>
					  	<button class="ui button">삭제</button>
						</div>
						</td>
						<%} %>
					    </tr>
					  
					
				    
				  </tbody>
				</table>
			

		
		<hr>
		<% if(loginUser != null){ %>
		댓글 : <input type="text" id="comcon" style="width: 800px" placeholder="글자 수는 60자로 제한" maxlength="60"> 
			<input type="button" value="댓글 달기" class="btn btn-default" onclick="comment()">
			<%} %>
			
			

	</div>
	<script >
	function deleteBoard(){
	if(confirm("정말 삭제 하시겠습니까?")){
		var nno = $("th").parent().children().eq(0).text();
	
			$.ajax({
				url:"/sixDestiny/delete.ub",
				type:"post",
				data:{nno:nno},
				success:function(){
					alert("삭제가 완료되었습니다.");
					location.href="/sixDestiny/selectList.bo?what=writer&search=&alignment=date&category=all&currentPage=1";
				},
				error:function(){
					alert("삭제도중 에러가 났습니다.");
					location.href="/sixDestiny/selectList.bo?what=writer&search=&alignment=date&category=all&currentPage=1";
				}
			});
		}
	}
	
	function updateBoard(){
		if(confirm("정말 수정 하시겠습니까? \n[사진은 수정이 불가합니다.]")){
			var bno = $("th").parent().children().eq(0).text();
		
				$.ajax({
					url:"/sixDestiny/update.ubr",
					type:"post",
					data:{bno:bno},
					success:function(data){
						console.log(data['bNo']);
						console.log(data);
						location.href="/sixDestiny/views/member/5_freeBoard/1_freeBoard/4_update.jsp?bNo=" + data['bNo'] +"&bcon="+data['bCon']+"&bKind="+data['bKind']+"&bNm="+data['bNm'];
					},
					error:function(){
						console.log("사진 수정폼으로 이동 실패");
				
					}
				});
			}
		}
	
	
	 function report(data){
		var test = <%= ub.getbNo() %>; //현제 게시글 번호
		var test2 = data;// 신고할 사람의 번호
		var test3 = <%= ub.getuNo() %>;   //해당게시글을 쓴유저의 번호
	
		window.open("/sixDestiny/views/member/5_freeBoard/1_freeBoard/5_report.jsp?test=" + test + "," + test2 + "," + test3,"PopupWin","width=480,height=300","resizable=no");
		
	 }
	 
	 
	 function insertRec() {
		 	var thisBoardNo = $("th").parent().children().eq(0).text();
			var nowLoginUser= <%=loginUser.getUserNo()%>;
		 	
		 
			 $.ajax({
				url:"updateRec.ub",
				data:{thisBoardNo:thisBoardNo,nowLoginUser:nowLoginUser},
				type:"get",
				success:function(data){
					console.log("결과? : " + data);
					if(data==1){
						alert("추천이 완료되었습니다.")
						
					}else{
					alert("이미 추천하신 글입니다")
					}
					 heart();
					 count();
					
				
			 }
			 })
	 }
	 

	 function deleteRec() {
		 	var thisBoardNo = $("th").parent().children().eq(0).text();
			var nowLoginUser= <%=loginUser.getUserNo()%>;
		 	
		 
			 $.ajax({
				url:"deleteRec.ub",
				data:{thisBoardNo:thisBoardNo,nowLoginUser:nowLoginUser},
				type:"get",
				success:function(data){
					console.log("결과? : " + data);
					if(data==1){
					alert("추천이 취소되었습니다.")
					
					}else{
						alert("이미 취소하신 추천입니다")
					}
					 heart();
					 count();
				}
			
			 });
	 }
	 
	
		 $(document).ready(function(){
			 heart();

		});
		function heart(){
			var thisBoardNo = $("th").parent().children().eq(0).text();
			var nowLoginUser= <%=loginUser.getUserNo()%>;
			var red = $('<button class="parcleup" id="redHeart" style="background: none; outline-color:pink; border: none;" onclick="deleteRec()"><img src="/sixDestiny/images/redheart.png" width="25px;" height="20px;" id="imgtest"></button>');
			var gray = $('<button class="parcleup" id="grayHeart" style="background: none; outline-color:pink; border: none;" onclick="insertRec()"><img src="/sixDestiny/images/grayheart.png" width="25px;" height="20px;" id="imgtest"></button>');
			
			 $.ajax({
					url:"checkHeart.ub",
					data:{thisBoardNo:thisBoardNo, nowLoginUser:nowLoginUser},
					type:"get",
					success:function(data){
						console.log(data["heart"])
						if(data["heart"]!=1){
							$("thead tr th#heart").append(red);
							$("#grayHeart").remove();
						}else{
							$("thead tr th#heart").append(gray);
							$("#redHeart").remove();
							
						
						}
						 $("#recCount").html(data["recCount"]);  
						
						
						
					}
				})
		}
		
		function count(){
			var thisBoardNo = $("th").parent().children().eq(0).text();
			
			 $.ajax({
					url:"countRec.ub",
					data:{thisBoardNo:thisBoardNo},
					type:"get",
					success:function(data){
						
						console.log("성공")
					}
				})
		
	}
		
		
		function comment(){
			var thisBoardNo = $("th").parent().children().eq(0).text();
			var nowLoginUser= <%=loginUser.getUserNo()%>;
			var comcon = $("#comcon").val();
			 $.ajax({
					url:"insertComment.ub",
					data:{thisBoardNo:thisBoardNo, nowLoginUser:nowLoginUser, comcon:comcon},
					type:"get",
					success:function(data){
						
						console.log(data["result"])
						console.log(data["commentList"])
						console.log(data["commentList"][0])
					}
				})
		
	}
	
	
	
	</script>
<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>
