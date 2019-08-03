<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  <%@ include file="../../common/top_Include.jsp"%>
  <%
  ArrayList<HashMap<String, Object>> list =
  (ArrayList<HashMap<String, Object>>) request.getAttribute("static");
  ArrayList<HashMap<String, Object>> list2 =
  (ArrayList<HashMap<String, Object>>) request.getAttribute("static2");
  ArrayList<HashMap<String, Object>> list3 =
  (ArrayList<HashMap<String, Object>>) request.getAttribute("static3");
  ArrayList<HashMap<String, Object>> list4 =
  (ArrayList<HashMap<String, Object>>) request.getAttribute("static4");

  %>
<!DOCTYPE html>
<html>
<%@ include file="../../common/inner_admin_include.jsp" %>
  <head>
  <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      
      
      <%System.out.print( list.get(0).get("reason1"));%>
      
      
      
      function drawChart() {
////////////////////////후원끊는이유///////////////////////////////////////////
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['금전적 부담',   <%=list4.get(0).get("can1")%> ],
          ['보호소에 대한 불만',   <%=list4.get(0).get("can2")%> ],
          ['타 사이트 이용',  <%=list4.get(0).get("can3")%> ],
          ['기타',  <%=list4.get(0).get("can4")%> ],

        ]);

        var options = {
          title: '후원을 끊는 이유'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);


     ////////////////////////////월별가입한 회원수//////////////////////////////
          var data = google.visualization.arrayToDataTable([

            ['월', '회원수'],
            ['1월',  30],
            ['2월',  76],
            ['3월',  35],
            ['4월',  30],
            ['5월',  80],
            ['6월',  15],
            ['7월',  5],
            ['8월',  50],
            ['9월',  40],
            ['10월',  80],
            ['11월',  20],
            ['12월',  60]

          ]);

          var options = {
            title: '월별 가입한 회원 수',
            curveType: 'function',
            legend: { position: 'bottom' }
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);


          //////////////////////기부금액///////////////////////
          var data = google.visualization.arrayToDataTable([
              ['월별', '기부금',],
              ['1월', 8175000],
              ['2월', 3792000],
              ['3월', 2695000],
              ['4월', 2099000],
              ['5월', 8175000],
              ['6월', 3792000],
              ['7월', 2695000],
              ['8월', 2099000],
              ['9월', 3792000],
              ['10월', 2695000],
              ['11월', 2099000],
              ['12월', 1526000]
            ]);

            var options = {
              title: '기부 금액',
              chartArea: {width: '50%'},

            };

            var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

            chart.draw(data, options);


          ///////////////////////////회원 탈퇴 사유/////////////////////////////////////////////////////
            var data = google.visualization.arrayToDataTable([
                ['T', 'H'],
                ['서비스 이용 불필요',      <%=list.get(0).get("reason1")%> ],
                ['사이트 불신',       <%=list.get(0).get("reason2")%> ],
                ['재가입',   <%=list.get(0).get("reason3")%> ],
                ['컨텐츠 부족',   <%=list.get(0).get("reason4")%> ],
                ['기타',  <%=list.get(0).get("reason5")%> ],

              ]);

              var options = {
                title: '회원탈퇴사유'
              };

              var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

              chart.draw(data, options);

              ///////////////분양 많이 받은 견종/////////////////////
              var data = google.visualization.arrayToDataTable([
                  ['T', 'H'],
                  ['말티즈',   <%=list2.get(0).get("dog_kind1")%> ],
                  ['코카스파니엘',  <%=list2.get(0).get("dog_kind2")%> ],
                  ['비글',  <%=list2.get(0).get("dog_kind3")%> ],
                  ['믹스견',  <%=list2.get(0).get("dog_kind4")%> ],
                  ['푸들',  <%=list2.get(0).get("dog_kind5")%> ]


                ]);

                var options = {
                  title: '분양 견종'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart3'));

                chart.draw(data, options);



                /////////////////////////////분양강아지나이/////////////////////////
                var data = google.visualization.arrayToDataTable([

                    ['나이', '나이'],
                    ['1살',  30],
                    ['2살',  76],
                    ['3살',  35],
                    ['4살',  30],
                    ['5살',  80],
                    ['6살',  15],
                    ['7살',  5],
                    ['8살',  50],
                    ['9살',  40],
                    ['10살',  80],
                    ['11살',  20],
                    ['12살',  60],
                    ['13살',  60],
                    ['14살',  60],
                    ['15살',  60]

                  ]);

                  var options = {
                    title: '분양견 나이',
                    curveType: 'function',
                    legend: { position: 'bottom' }
                  };

                  var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

                  chart.draw(data, options);

                  ///////////////////////////////////기부물풀 목록//////////////////
                  var data = google.visualization.arrayToDataTable([
                      ['목록', '기부물품양',],
                      ['기부물품1', 45],
                      ['기부물품2', 78],
                      ['기부물품3', 75],
                      ['기부물품4', 12],
                      ['기부물품5', 24],
                      ['기부물품6', 64],
                      ['기부물품7', 86],
                      ['기부물품8', 76],
                      ['기부물품9', 12]

                    ]);

                    var options = {
                      title: '기부 금액',
                      chartArea: {width: '50%'},

                    };

                    var chart = new google.visualization.BarChart(document.getElementById('chart_div2'));

                    chart.draw(data, options);

                    /////////////////////////가입경로//////////////////////
                    var data = google.visualization.arrayToDataTable([
                        ['T', 'H'],
                        ['sns',     <%=list3.get(0).get("root1")%>],
                        ['검색',      <%=list3.get(0).get("root2")%>],
                        ['광고',  <%=list3.get(0).get("root3")%>],
                        ['지인추천',  <%=list3.get(0).get("root4")%>],
                        ['기타', <%=list3.get(0).get("root5")%>],



                      ]);

                      var options = {
                        title: '회원 가입 경로'
                      };

                      var chart = new google.visualization.PieChart(document.getElementById('piechart4'));

                      chart.draw(data, options);
                      /////////////별점////////////////////

        }

    </script>
  </head>
  <body>
    <table>
       <tr>
          <td>   <div id="piechart" style="width: 700px; height: 400px;"></div></td>
          <td><div id="curve_chart" style="width:700px; height: 400px;"></div></td>
       </tr>
       <tr>
          <td><div id="chart_div" style="width: 700px; height: 400px;"></div></td>
          <td><div id="piechart2" style="width: 700px; height: 400px;"></div></td>
       </tr>
       <tr>
          <td><div id="piechart3" style="width: 700px; height: 400px;"></div></td>
          <td><div id="curve_chart2" style="width: 700px; height: 400px;"></div></td>
       </tr>
       <tr>
          <td><div id="chart_div2" style="width: 700px; height: 400px;"></td>
          <td><div id="piechart4" style="width: 700px; height: 400px;"></td>
       </tr>
    </table>



     <%@ include file="../../common/bottom_Include.jsp"%>

  </body>


</html>