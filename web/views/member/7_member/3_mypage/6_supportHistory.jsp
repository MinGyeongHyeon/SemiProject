<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.support.money.model.vo.*, com.kh.semi.support.product.model.vo.*, com.kh.semi.adminboard.model.vo.PageInfo"%>
<%@ include file="../../../common/top_Include.jsp"%>
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
	<%@ include file="../../../common/inner_user_include.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
  <script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
<style>

</style>
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
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원종류</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원금액</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">결제일</td>
        <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">후원취소신청</td>
      </tr>
    </thead>
    <tbody>
      <% for(MoneySup ms : list) {%>
		<tr>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getSupKind() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getSupPc() %></td>
			<td style="font-family: 'Sunflower', sans-serif;"><%= ms.getSupDt() %></td>
			<td style="font-family: 'Sunflower', sans-serif;">
				<% if(ms.getSupKind().equals("정기") && ms.getStatus().equals("Y")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif;" onclick="cancleSupport(<%= ms.getSupAppNo()%>);">후원취소</button>
				<% }else if(ms.getStatus().equals("S")){ %>
					<p style="font-family: 'Sunflower', sans-serif;">신청대기</p>
				<% }else if(!ms.getSupKind().equals("정기") && ms.getStatus().equals("N")){ %>
					<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; background:white;" name="insertMoney" onclick="goMoney(<%= ms.getSupAppNo()%>);">납입하기</button>
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
			<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage=1&currentPage2=1'" class="btn btn-default"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled class="btn btn-default"><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage=<%=currentPage-1%>&currentPage2=1'" class="btn btn-default"><</button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<button disabled class="btn btn-default"><%= p %></button>
			<% 	}else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage=<%=p%>&currentPage2=1'" class="btn btn-default"><%=p %></button>
			<%
				}
				}
			%>

			<% if(currentPage >= maxPage){ %>
				<button disabled class="btn btn-default">></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage=<%=currentPage+1%>&currentPage2=1'" class="btn btn-default">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage=<%=maxPage%>&currentPage2=1'" class="btn btn-default">>></button>
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
      <% for(ProductSup ps : list2) {%>
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
			<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage2=1&currentPage=1'" class="btn btn-default"><<</button>
			<% if(currentPage2 <= 1){ %>
				<button disabled class="btn btn-default"><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage2=<%=currentPage2-1%>&currentPage=1'" class="btn btn-default"><</button>
			<% } %>

			<% for(int p = startPage2; p <= endPage2; p++){
				if(currentPage2 == p){
			%>
					<button disabled class="btn btn-default"><%= p %></button>
			<% 	}else{ %>
					<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage2=<%=p%>&currentPage=1'" class="btn btn-default"><%=p %></button>
			<%
				}
				}
			%>

			<% if(currentPage2 >= maxPage2){ %>
				<button disabled class="btn btn-default">></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage2=<%=currentPage2+1%>&currentPage=1'" class="btn btn-default">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/mySupport.su?currentPage2=<%=maxPage2%>&currentPage=1'" class="btn btn-default">>></button>
		</div>
  </div>
  <script type="text/javascript">
  	$(function(){
  		 setInterval(function()
  			    {
  			       $("button[name=insertMoney]").each(function(){
  			    	  $(this).css("background", "rgb(204, 230, 255)");
  			       });
  			    },500);

  		 setInterval(function()
   			    {
  					$("button[name=insertMoney]").each(function(){
		    	  		$(this).css("background", "white");
		       		});
   			    },1000);
  	});

  	function cancleSupport(monSupNo) {
  		var windowObj;
		if(confirm("해당 정기후원을 취소 신청 하시겠습니까?")){
			var monSupNo = monSupNo;
			/* console.log(monSupNo); */
			windowObj = window.open("/sixDestiny/views/member/7_member/3_mypage/7_supportCancle.jsp?monSupNo="+monSupNo, "window", "width=500,height=300");
			location.href="/sixDestiny/mySupport.su";
			/* $.ajax({
				url:"/sixDestiny/canclesup.mon",
				type:"post",
				data:{monSupNo:monSupNo},
				success:function(data){
					location.href="/sixDestiny/mySupport.su";
					console.log("성공성공!")
				},
				error:function(){

				}
			});*/

		}else{
			return;
		}
	}

  	function goMoney(monSupNo){
  		var monSupNo = monSupNo;
  		var IMP = window.IMP;
  		IMP.init('imp83833982');
  		IMP.request_pay({
  		    pg : 'danal_tpay', //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
  		    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
  		    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
  		    name : '주문명:결제테스트',
  		    amount : 100,
  		    buyer_email : 'iamport@siot.do',
  		    buyer_name : '구매자이름',
  		    buyer_tel : '010-1234-5678', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
  		    buyer_addr : '서울특별시 강남구 삼성동',
  		    buyer_postcode : '123-456',
  		    m_redirect_url : 'http://localhost:8002/sixDestiny/'
  		}, function (rsp) { // callback
            if (rsp.success) {

    			$.ajax({
    				url:"/sixDestiny/insertmoney.mo",
    				type:"post",
    				data:{monSupNo:monSupNo},
    				success:function(data){
    					location.href="/sixDestiny/mySupport.su";
    					console.log("성공성공!")
    				},
    				error:function(){

    				}
    			});
            } else {

            }
        });
  	};

  	function goRegMoney(monSupNo){
  		var monSupNo = monSupNo;
  		BootPay.request({
  			price: 0, // 0으로 해야 한다.
  			application_id: "5d38293e02f57e00381e9c2b",
  			name: '육인연 정기후원', //결제창에서 보여질 이름
  			pg: 'danal',
  			method: 'card_rebill', // 빌링키를 받기 위한 결제 수단
  			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
  			user_info: {
  				username: '사용자 이름',
  				email: '사용자 이메일',
  				addr: '사용자 주소',
  				phone: '010-1234-4567'
  			},
  			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
  			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
  			extra: {
  				start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
  				end_at: '2022-05-10' // 정기결제 만료일 -  기간 없음 - 무제한
  			}
  		}).error(function (data) {
  			//결제 진행시 에러가 발생하면 수행됩니다.
  			console.log(data);
  		}).cancel(function (data) {
  			//결제가 취소되면 수행됩니다.
  			console.log(data);
  		}).done(function (data) {
  			// 빌링키를 정상적으로 가져오면 해당 데이터를 불러옵니다.
  			var billing = data["billing_key"];
  			$.ajax({
  				url:"/sixDestiny/updateBill.mon",
  				type:"post",
  				data:{billing:billing, monSupNo:monSupNo},
  				success:function(data){
  					location.href="/sixDestiny/mySupport.su";
  				},
  				error:function(){
  					console.log("에러!")
  				}
  			});
  		});
  	};
  </script>

	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>


















