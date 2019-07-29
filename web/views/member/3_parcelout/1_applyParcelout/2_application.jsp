<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>

<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style>
#border {
	height: 2150px;
	width: 800px;
	margin-left:auto;
	margin-right:auto;
}



.entancetr {
	margin: 0 auto;
	height: 40px;
}

#ta {
	height: 400px;
	width: 700px;
	margin: 0 auto;
}

.entancetd {
	text-align: left;
}

input[type=text] {
	padding-left: 5px;
}

p {
	text-align: left;
}

</style>


</head>
<body>
<script>
$(function() {
    $( "#testDatepicker" ).datepicker({
    });
});
$(function(){
	$("#testDatepicker").on("change paste keyup", function() {
		   $("#selectEntrance").css("opacity", "1");
	});
});
</script>


	<form action="<%= request.getContextPath() %>/Insert.po" method="post">
		<h3>분양 설문조사</h3>
	<input type="hidden" value="<%= loginUser.getUserNo() %>" name="userNo">

		<div id="border">
			<br> <br>


			<table id="ta">

				<tr class="entancetr">
					<td class="entancetd"><p>1. 입양을 원하시는 가장 큰 이유는 무엇인가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q1" size="90" name="applic1"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>2. 입양을 결정하시기까지 얼마나 많은 시간을 고민하셨나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q2" size="90" name="applic2"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>3. 키우고 있는 반려동물이 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q3" size="90" name="applic3"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>4. 몇인가구이시며 가족구성원이 어떻게 되시나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"  value="1" name="applic4">1인가구 <input
						type="radio" value="2" name="applic4">2인가구 <input
						type="radio" value="3" name="applic4">3인가구 이상</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>5. 반려동물을 개인 사정으로 유기 시킨경험이 있으신가요? 있으시다면 이유는 무멋인가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" name="applic5" value="Y" ><label>예</label>
						<input type="text" name="applic6" size="20" id="test" > <input
						type="radio" name="applic5" value="N" ><label>아니요</label></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>6. 입양결정에 가족 모두가 동의 하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" value="1" name="applic7">동의 <input
						type="radio" value="2" name="applic7">일부동의 <input
						type="radio" value="3" name="applic7">반대</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>7. 주거형태는 어떻게 되나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" value="1" name="applic8">단독주택 <input
						type="radio"  value="2" name="applic8">공동주택 <input
						type="radio"  value="3" name="applic8">아파트</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>8. 임대주택의 경우 집주인의 동의를 얻으셨나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" value="1" name="applic9">예 <input
						type="radio"  value="2" name="applic9">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>9. 소음이나 위생 등으로 인한 이웃과의 마찰로 입양동물의 양육이 불가능해질 경우 어떻게
							하실건가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q9" size="70" name="applic10"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>10. 이사 또는 해외로 이주 시 반려동물의 거취문제에 대해 어떻게 생각하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q10" size="70" name="applic11"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>11. 앞으로 결혼, 임신, 출산 등 가족의 변화가 있는 경우 반려동물의 거취문제에 대해
							어떻게 생각하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q11" size="70" name="applic12"></td>
				</tr>



				<tr class="entancetr">
					<td class="entancetd"><p>12. 입양 시에, 유기동물의 구조와 치료, 보호비로 사용되는 일정금액의 맞음비 7만원을
							납부해주셔야 합니다. (임시보호의 경우 제외) 동의하십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"  value="1" name="applic13">예 <input
						type="radio"  value="2" name="applic13">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>13. 동물 관련 활동경험이 있으신가요? 또는 평소 알고 있던 동물단체들이 있다면 아는대로
							적어주세요.</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="text" id="q13" size="70" name="applic14"></td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>14. 길고양이에게 밥을 주신 적이 있으신가요? 유기동물 구조 경험이 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"value="1" name="applic15">예 <input
						type="radio" value="2" name="applic15">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>15. 본인에게 병력이나 전염병이 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"  value="1" name="applic16">예 <input
						type="radio" value="2" name="applic16">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>16. 분양받은 반려견들에게 자신의 생활비 제외하고 양육비를 얼마정도 예상하시나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"  value="1" name="applic17">0 ~
						50,000 미만 <input type="radio"  value="2" name="applic17">50,000
						~ 100,000 미만 <input type="radio"  value="3" name="applic17">
						100,000 이상</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>17. 분양받은 반려견이 질병에 걸렸을시 얼마정도의 치료비를 사용하실수 있으신가요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"  value="1" name="applic18">0 ~
						50,000 미만 <input type="radio" value="2" name="applic18">50,000
						~ 100,000 미만 <input type="radio" value="3" name="applic18">
						100,000 이상</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>18. 반려동물의 수명은 15년 이상입니다. 10년이상 키우실 수 있으십니까?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio"  value="1" name="applic19">예 <input
						type="radio" value="2" name="applic19">아니요</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><p>19. 동물보호법<a href="/www.law.go.kr/법령/동물보호법">(www.law.go.kr/법령/동물보호법)</a>에 대하여 동의하시나요?</p>
					</td>
				</tr>
				<tr class="entancetr">
					<td class="entancetd"><input type="radio" value="1" name="applic20">예 <input
						type="radio" value="2" name="applic20">아니요</td>
				</tr >

			<tr class="entancetr">
						<td style="height:30px">1:1면담 예약</td>
					</tr>
						<tr>
						<td colspan="2" style="height:30px" >
							<input type="text" style="height:30px; width:22%;" id="testDatepicker" placeholder="클릭하세요" name="applic21">
						</td>
						</tr>
					<tr class="entancetr">
						<td colspan="2">
							<select style="height:30px; width:25%; opacity:0;" id="selectEntrance" name="applic22">
								<option>09:00~10:00</option>
								<option>10:00~11:00</option>
								<option>11:00~12:00</option>
								<option>14:00~15:00</option>
								<option>15:00~16:00</option>
								<option>16:00~17:00</option>
								<option>17:00~18:00</option>
							</select>
						</td>
					</tr>

				<tr >
					<td ><button type="submit" id="sub" disabled>제출</button></td>
				</tr>


			</table>

		</div>

	</form>
	<br />
	<div align="center" style="text-align: center;">
	<button id="btn" >확인</button>
	</div>






	<script>
		$(document).ready(function() {

			// 라디오버튼 클릭시 이벤트 발생
			$("input:radio[name=applic5]").click(function() {

				if ($("input:radio[name=applic5]:checked").val() == "Y") {

					$("input:text[name=applic6]").attr("disabled", false);

				} else if ($("input[name=applic5]:checked").val() == "N") {
					$("input:text[name=applic6]").attr("disabled", true);

				}
			});
		});





			$('#btn').click(function(){

				var i = 0;

				var deprivation1 = $('input[name=applic7]:checked').val(); //3
				var deprivation2 = $('input[name=applic9]:checked').val(); //2
				var deprivation3 = $('input[name=applic13]:checked').val(); //2
				var deprivation4 = $('input[name=applic20]:checked').val(); //2




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

					}else{
						if(deprivation1 == 3 || deprivation2 == 2 || deprivation3 == 2 || deprivation4 == 2){
							alert("자격 박탈 되셨습니다.. 신중히 읽어보시고 대답해주세요..")
						}else{
							$('#sub').attr("disabled" , false)

						}


					}

				}else{

					if(i <= 19){

						alert("값을 모두 쓰셔야합니다");

					}else{
						if(deprivation1 == 3 || deprivation2 == 2 || deprivation3 == 2 || deprivation4 == 2){
							alert("자격 박탈 되셨습니다.. 신중히 읽어보시고 대답해주세요..")
						}else{
							$('#sub').attr("disabled" , false)

						}
					}
				}




			})



	</script>
		<script>
$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });
});
</script>


	<%@ include file="../../../common/bottom_Include.jsp"%>
</body>
</html>