<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>입소신청</title>
<style>
.entranceDiv td {
	font-family: 'Sunflower', sans-serif;
}

.entranceDiv input {
	border:none;
	text-align:center;
}

#selectarea1, #selectarea2, #selectarea3 {
	opacity:0;
}
</style>
</head>
<body>
	<script type="text/javascript">
	$(function() {
	    $( "#testDatepicker" ).datepicker({
	    });
	});
	</script>
	<div class="entranceDiv">
		<h1 style="font-family: 'Sunflower', sans-serif;">입소신청</h1>
		<br>
		<br><br>
		<form action="/sixDestiny/apply.en" method="post">
		<div align="center">
			<div style="width:70%">
				<table border="1" style="width:100%; height: 30px; text-align:center;">
					<tr>
						<td colspan="3" style="font-size:2em; font-family: 'Sunflower', sans-serif;">신청인정보</td>
					</tr>
					<tr>
						<td style="width:166px">이름</td>
						<td colspan="2"><input style="width:100%; height: 30px;" type="text" value="<%=loginUser.getUserNm()%>"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td colspan="2">
							<input style="width:30%; height: 30px;" type="text" placeholder="010"> -
							<input style="width:30%; height: 30px;" type="text" > -
							<input style="width:30%; height: 30px;" type="text" >
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td colspan="2">
							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">남자</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">여자</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td colspan="2"><input type="date" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="password" id="zipAddr"
							style="width:100%; height: 30px;"></td>
						<td>
							<button type="button" class="btn btn-default"
								onclick="fn_setAddr();"
								style="font-family: 'Sunflower', sans-serif; width:100%; height: 30px;">검색</button>
						</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td colspan="2"><input type="text" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td style="height:30px" rowspan="2">1:1면담 예약</td>
						<td colspan="2" style="height:30px">
							<input type="text" id="testDatepicker" placeholder="클릭하세요">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<select style="height:30px; width:100%; opacity:0;" id="selectEntrance">
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
				</table>
			</div>
			<script type="text/javascript">
				$(function(){
					$("#testDatepicker").on("change paste keyup", function() {
						   $("#selectEntrance").css("opacity", "1");
					});
				});

				function open1() {
					$("#selectarea1").css("opacity", "1");
				}

				function open2() {
					$("#selectarea2").css("opacity", "1");
				}

				function open3() {
					$("#selectarea3").css("opacity", "1");
				}
			</script>
			<br><br><br><br><br>
			<div style="width:70%">
				<table style="width:100%; height: 30px; text-align:center;" border="1">
					<tr>
						<td colspan="2" style="font-size:2em;">입소견정보</td>
					</tr>
					<tr>
						<td style="width:166px">이름</td>
						<td><input type="text" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">남자</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">여자</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
    					</td>
					</tr>
					<tr>
						<td>견종</td>
						<td>
							<select style="width:100%; height: 30px;">
								<option>코카스파니엘</option>
								<option>요크셔테리어</option>
								<option>푸들</option>
								<option>말티즈</option>
								<option>웰시코기</option>
								<option>포메라니안</option>
								<option>스피치</option>
								<option>닥스훈트</option>
								<option>사모예드</option>
								<option>골든리트리버</option>
								<option>허스키</option>
								<option>쉐퍼드</option>
								<option>믹스</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>몸무게</td>
						<td><input type="number" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>키</td>
						<td><input type="number" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td style="height:30px" rowspan="2">접종유무</td>
						<td>
							<span class="button-checkbox">
        						<button onclick="open1();" type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">유</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">무</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">
							<div id="selectarea1">
							<input type="checkbox">종합백신 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">광견병 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">코로나(장염) &nbsp;&nbsp;&nbsp;
							<input type="checkbox">켄넬코프(호흡기) &nbsp;&nbsp;&nbsp;
							<input type="checkbox">신종플루
							</div>
						</td>
					</tr>
					<tr>
						<td style="height:30px" rowspan="2">병력</td>
						<td>
							<span class="button-checkbox">
        						<button onclick="open2();"  type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">유</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">무</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">
						<div id="selectarea2">
							<input type="checkbox">귀염증 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">내부기생충 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">관절염 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">위염 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">옴
						</div>
						</td>
					</tr>
					<tr>
						<td style="height:30px" rowspan="2">수술여부</td>
						<td>
							<span class="button-checkbox">
        						<button onclick="open3();"  type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">유</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">무</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">
						<div id="selectarea3">
							<input type="checkbox">중성화 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">성대수술 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">쓸개골탈구 &nbsp;&nbsp;&nbsp;
							<input type="checkbox">심장수술
						</div>
						</td>
					</tr>
					<tr>
						<td>취미</td>
						<td><input type="text" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>알레르기</td>
						<td><input type="text" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>짖음정도</td>
						<td><span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">상</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">중</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
    						<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">하</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    					</td>
					</tr>
					<tr>
						<td>배변활동</td>
						<td>
							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">상</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">중</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
    						<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">하</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td>활동량</td>
						<td>
							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">상</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">중</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
    						<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">하</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td>분리불안</td>
						<td>
							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">유</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">무</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td>모색</td>
						<td><input type="text" style="width:100%; height: 30px;"></td>
					</tr>
					<tr>
						<td>순종여부</td>
						<td>
							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">예</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">아니요</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td>등록여부</td>
						<td>
							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">예</button>
        						<input type="checkbox" class="hidden"  />
    						</span>
    							<span class="button-checkbox">
        						<button type="button" class="btn" data-color="info" style="font-family: 'Sunflower', sans-serif; width:170px; height:30px">아니요</button>
        					<input type="checkbox" class="hidden"  />
    						</span>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<td>

						</td>
					</tr>
					<tr>
						<td style="height:150px">기타사항</td>
						<td><textarea style="width:100%; height:80%; resize: none; border:none;"></textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<br><br><br>
		<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif;">신청서 제출</button>
		</form>
	</div>

		<script type="text/javascript">
	$(function(){
		$('.fileopacity1').click(function(){
			$('#fileopa1').css('opacity','1');
		});
	});

	$(function(){
		$('.fileopacity2').click(function(){
			$('#fileopa2').css('opacity','1');
		});
	});

	$(function(){
		$('.filehidden1').click(function(){
			$('#fileopa1').css('opacity','0');
		});
	});

	$(function(){
		$('.filehidden2').click(function(){
			$('#fileopa2').css('opacity','0');
		});
	});

	$(document).ready(
			function() {
				<%for (int i = 1; i < 11; i++) {%>
				$('input[type="checkbox"][id="check<%=i%>"]').click(
						function() {
							if ($(this).prop('checked')) {
								$('input[type="checkbox"][id="check<%=i%>"]')
										.prop('checked', false);
								$(this).prop('checked', true);
							}
						});
				<%}%>
			});
	</script>
		<script type="text/javascript">
	function fn_setAddr() {
		var width = 500;
		var height = 600;
		daum.postcode.load(function(){
			new daum.Postcode({
				oncomplete: function(data){
					$("#zipAddr").val(data.address);
				}
			}).open({
				left: (window.screen.width / 2) - (width / 2),
				top: (window.screen.height / 2) - (height / 2)
			});
		});
	}
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