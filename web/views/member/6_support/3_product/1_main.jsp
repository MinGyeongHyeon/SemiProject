<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div>

		<h5>육인연의 후원금은 이렇게 쓰여집니다</h5>

		<hr>
		<br> <strong>1. 유기동물후원</strong>
		<h6>
			상처받은 유기동물에게 육인원은 마지막 기회이자 유일한 희망입니다. <br>아픈 유기견들의 생활비, 치료비등을
			후원합니다.
		</h6>

		<strong>2. 화장품동물실험반대</strong>
		<h6>
			국내화장품 개발 과정 중 진행되는 모든 동물실험전면금지에 대한 법개정을 위한 캠페인을 진행중입니다. <br>또한
			동물실험을 하지 않는 착한회사리스트를 추천해드리고 있습니다.
		</h6>

		<strong>3. 공장식축산반대</strong>
		<h6>
			비인도적,동물학대적 공장식 축산을 단계적으로 폐쇄하고 동물복지형축산을 지향하며 <br>동물복지의 사각지대인
			공장식축산의 다양한 문제점을 공론화화여 회원들의 참여를 도모합니다.
		</h6>

		<strong>4. 동물쇼, 전시반대</strong>
		<h6>멸종위기 야생동물을 보호하며, 동물서커스 등 동물을 인간의 오락에 이용하는 활동을 반대하는 캠페인을 진행하고
			있습니다.</h6>

		<strong>5. 모피반대</strong>
		<h6>
			동물의 가죽과 털을 기반으로 하는 제품의 소비를 반대하는 시민참여형 캠페인과 <br>야생동물의 모피를 위한 농장화를
			금지 및 예방하는 캠페인을 추진합니다.
		</h6>

		<strong>6. 동물관련법개정</strong>
		<h6>
			여전히 법의 보호가 부족한 가축동물 및 야생동물에 관한 동물보호법이 동물의 최소한의 복지와 <br> 삶에 있어서의
			기본적인 요구가 지켜질 수 있는 법이 개정될 수 있도록 캠페인을 진행하고 있습니다.
		</h6>

		<strong>7. 동물교육활동</strong>
		<h6>진정성과 현장성, 전문성을 갖춘 동물보호교육을 위해 풀뿌리교육부터 연구사업, 문화활동까지 다방면의 노력을
			기울이고 있습니다.</h6>

		<strong>8. 유기동물지원</strong>
		<h6>
			다치거나 아픈 유기동물을 발견했을 시 보호가 어려운 구조자에게 책임감있게 해당동물의 임시보호와 입양연계, <br>관리
			등이 가능한 구조자분께 병원치료비의 일부를 지원하고, 입양홍보까지 도와드립니다.
		</h6>

		<strong>9. 길고양이지원</strong>
		<h6>
			지역 내 길고양이에게 주도적으로 TNR을 실시하고 길고양이 급식소에 먹이급여와 관리 등 책임있는 돌봄을 계획하시는 <br>분들께
			`길고양이 TNR 지원사업`을 통한 중성화수술과 예방접종을 받을 수 있도록 지원하고 있습니다.
		</h6>
		<hr>

		<br>
		<br>

		<div>

			<strong>위의 사항을 충분히 숙지하였고, 후원신청을 진행하시겠습니까?</strong>
				<input type="checkbox" name="check" id="yes" class="yes">예
				<input type="checkbox" name="check" id="no" class="no">아니요 <br>
			<br><input type="button" value="후원신청" onclick="changeView();";>

		</div>

	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$('input[type="checkbox"][name="check"]').click(
							function() {
								if ($(this).prop('checked')) {
									$('input[type="checkbox"][name="check"]')
											.prop('checked', false);
									$(this).prop('checked', true);
								}
							});
				});

		function changeView() {
			if($('.yes').prop("checked")){
				location.href="/sixDestiny/views/member/6_support/3_product/2_application.jsp";
			}else{
				alert("약관을 동의하셔야 후원신청이 가능합니다.")
			}
		}
	</script>
<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>