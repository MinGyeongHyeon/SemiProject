<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#border {
	height: 2000px;
	width: 800px;
	border: 1px solid black;
	margin: 0 auto;
}

#btn {
	margin: 0 auto;
}

.entancetr {
	margin: 0 auto;
	height: 40px;
}

#ta {
	height: 400px;
	width: 600px;
	margin: 0 auto;
}

.entancetd {
	text-align: left;
}

input[type=text] {
	padding-left: 90px;
}

p {
	text-align: left;
}
</style>


</head>
<body>


	<form>
		<h3>분양 설문조사</h3>

		<div id="border">
			<br> <br>


			<table id="ta">

				<tr class="entancetr">
					<td class="entancetd"><p>1. 입양을 원하시는 가장 큰 이유는 무엇인가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q1" size="90"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>2. 입양을 결정하시기까지 얼마나 많은 시간을 고민하셨나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q2" size="90"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>3. 키우고 있는 반려동물이 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q3" size="90"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>4. 몇인가구이시며 가족구성원이 어떻게 되시나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="family" value="1">1인가구 <input
						type="radio" name="gender" value="2">2인가구 <input
						type="radio" name="gender" value="3">3인가구 이상</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>5. 반려동물을 개인 사정으로 유기 시킨경험이 있으신가요? 있으시다면 이유는 무멋인가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="drop" value="yes"><label>예</label>
						<input type="text" name="answer" size="20"> <input
						type="radio" name="drop" value="no"><label>아니요</label></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>6. 입양결정에 가족 모두가 동의 하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree" value="1">동의 <input
						type="radio" name="agree" value="2">일부동의 <input
						type="radio" name="agree" value="3">반대</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>7. 주거형태는 어떻게 되나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="house" value="1">단독주택 <input
						type="radio" name="house" value="2">공동주택 <input
						type="radio" name="house" value="3">아파트</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>8. 임대주택의 경우 집주인의 동의를 얻으셨나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree2" value="1">예 <input
						type="radio" name="agree2" value="2">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>9. 소음이나 위생 등으로 인한 이웃과의 마찰로 입양동물의 양육이 불가능해질 경우 어떻게
							하실건가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q9" size="70"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>10. 이사 또는 해외로 이주 시 반려동물의 거취문제에 대해 어떻게 생각하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q10" size="70"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>11. 앞으로 결혼, 임신, 출산 등 가족의 변화가 있는 경우 반려동물의 거취문제에 대해
							어떻게 생각하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q11" size="70"></td>
				</tr>



				<tr class="entancetr">
					<td class="entancetd"><p>12. 입양 시에, 유기동물의 구조와 치료, 보호비로 사용되는 일정금액의 맞음비 7만원을
							납부해주셔야 합니다. (임시보호의 경우 제외) 동의하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree3" value="1">예 <input
						type="radio" name="agree3" value="2">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>13. 동물 관련 활동경험이 있으신가요? 또는 평소 알고 있던 동물단체들이 있다면 아는대로
							적어주세요.</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q13" size="70"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>14. 길고양이에게 밥을 주신 적이 있으신가요? 유기동물 구조 경험이 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree4" value="1">예 <input
						type="radio" name="agree4" value="2">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>15. 본인에게 병력이나 전염병이 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree5" value="1">예 <input
						type="radio" name="agree5" value="2">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>16. 분양받은 반려견들에게 자신의 생활비 제외하고 양육비를 얼마정도 예상하시나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="money1" value="1">0 ~
						50,000 미만 <input type="radio" name="money1" value="2">50,000
						~ 100,000 미만 <input type="radio" name="money1" value="3">
						100,000 이상</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>17. 분양받은 반려견이 질병에 걸렸을시 얼마정도의 치료비를 사용하실수 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="money2" value="1">0 ~
						50,000 미만 <input type="radio" name="money2" value="2">50,000
						~ 100,000 미만 <input type="radio" name="money2" value="3">
						100,000 이상</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>18. 반려동물의 수명은 15년 이상입니다. 10년이상 키우실 수 있으십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree6" value="1">예 <input
						type="radio" name="agree6" value="2">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>19. 동물보호법(www.law.go.kr/법령/동물보호법)에 대하여 동의하시나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="agree7" value="1">예 <input
						type="radio" name="agree7" value="2">아니요</td>
				</tr>




			</table>





		</div>
		<br> <br>

	</form>
		<button id="btn" >제출</button>


	<script>
		$(document).ready(function() {

			// 라디오버튼 클릭시 이벤트 발생
			$("input:radio[name=drop]").click(function() {

				if ($("input[name=drop]:checked").val() == "yes") {

					$("input:text[name=answer]").attr("disabled", false);

				} else if ($("input[name=drop]:checked").val() == "no") {
					$("input:text[name=answer]").attr("disabled", true);

				}
			});
		});

		$(function(){
			$('#btn').click(function(){

				var i = 0;



				$('input[type=text]').each(function(index, item){

					if($('input[type=text]').eq(index).val() != "" && $('input[type=text]').eq(index).prop("disabled") == false){

					i++;

					}
				})
				$('input[type=radio]').each(function(index, item){
					if($('input[type=radio]').eq(index).is(':checked')){

						i++;
					}
				})

				if($('input[type=radio]').eq(4).is(':checked')){

					if(i <= 18){

						alert("값을 모두 쓰셔야합니다");

					}

				}else{

					if(i <= 19){

						alert("값을 모두 쓰셔야합니다");

					}
				}



			})
		})

	</script>


	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>