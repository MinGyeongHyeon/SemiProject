<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/top_Include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../common/inner_admin_include.jsp" %>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
   td.adtd{
      border-bottom:1px solid #888;
      height:30px;
   }


</style>
</head>
<body>
   <div align="left" style="margin-left:300px;">
      <span><h2>회원 댓글 관리</h2></span>
   </div>

   <table class="adta" style=" border-spacing: 0px;" align="center">
      <tr class="adtr" style="background:rgb(220,220,220);">
         <td class="adtd" style="width:300px;">No.</td>
         <td class="adtd" style="width:500px;">댓글 내용</td>
         <td class="adtd" style="width:300px;">신고수</td>

      </tr>
      <tr class="adtr">
         <td class="adtd">1</td>
         <td class="adtd">자유게시판</td>
         <td class="adtd">12</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">2</td>
         <td class="adtd">입양후기</td>
         <td class="adtd">67</td>
      </tr>
   </table >
   <ul class="pagination">
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
   </ul>


   <br><br>

   <div align="left" style="margin-left:300px;">
      <span><h2>회원 게시글 관리</h2></span>
   </div>

   <table class="adta" style=" border-spacing: 0px;" align="center">
      <tr class="adtr" style="background:rgb(220,220,220);">
         <td class="adtd" style="width:100px;">No.</td>
         <td class="adtd" style="width:300px;">게시판 종류</td>
         <td class="adtd" style="width:500px;">게시글제목</td>
         <td class="adtd" style="width:100px;">신고수</td>
         <td class="adtd" style="width:100px;">조회수</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">1</td>
         <td class="adtd">자유게시판</td>
         <td class="adtd">기욤이</td>
         <td class="adtd">2</td>
         <td class="adtd">12</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">2</td>
         <td class="adtd">입양후기</td>
         <td class="adtd">사랑해</td>
         <td class="adtd">3</td>
         <td class="adtd">67</td>
      </tr>
   </table >
   <table align="center">
      <tr>
         <td>
            <select>
                  <option id="proud">자유게시판</option>
                  <option id="honey">입양후기</option>
                  <option id="chat">찾습니다</option>
                  <option id="chat">보호중입니다</option>
            </select>
         </td>
         <td>
            <select>
                  <option id="proud">신고 높은순</option>
                  <option id="honey">신고 낮은순</option>
            </select>
         </td>
         <td style="width:900px; text-align:right;">
            <select>
                  <option id="proud">글번호</option>
                  <option id="honey">아이디</option>
            </select>
            <input type="search" name="keyword">
            <input type="submit" value="검색">
         </td>
      </tr>
   </table>
   <ul class="pagination">
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
   </ul>

   <br><br>

   <div align="left" style="margin-left:300px;">
      <span><h2>신고 게시글 관리</h2></span>
   </div>

   <table class="adta" style=" border-spacing: 0px;" align="center">
      <tr class="adtr" style="background:rgb(220,220,220);">
         <td class="adtd" style="width:100px;">No.</td>
         <td class="adtd" style="width:300px;">게시판 종류</td>
         <td class="adtd" style="width:500px;">게시글제목</td>
         <td class="adtd" style="width:100px;">신고수</td>
         <td class="adtd" style="width:100px;">작성회원번호</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">1</td>
         <td class="adtd">자유게시판</td>
         <td class="adtd">기욤이</td>
         <td class="adtd">2</td>
         <td class="adtd">12</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">2</td>
         <td class="adtd">입양후기</td>
         <td class="adtd">사랑해</td>
         <td class="adtd">3</td>
         <td class="adtd">67</td>
      </tr>
   </table >
   <table align="center">
      <tr>
         <td style="width:1100px; text-align:left;">
            <select>
                  <option>신고 낮은순</option>
                  <option>신고 높은순</option>
            </select>
         </td>

      </tr>
   </table>
   <ul class="pagination">
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
   </ul>

   <br><br>

   <div align="left" style="margin-left:300px;">
      <span><h2>신고 댓글 관리</h2></span>
   </div>

   <table class="adta" style=" border-spacing: 0px;" align="center">
      <tr class="adtr" style="background:rgb(220,220,220);">
         <td class="adtd" style="width:100px;">No.</td>
         <td class="adtd" style="width:300px;">게시판 종류</td>
         <td class="adtd" style="width:500px;">게시글제목</td>
         <td class="adtd" style="width:100px;">신고수</td>
         <td class="adtd" style="width:100px;">작성회원번호</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">1</td>
         <td class="adtd">자유게시판</td>
         <td class="adtd">기욤이</td>
         <td class="adtd">2</td>
         <td class="adtd">12</td>
      </tr>
      <tr class="adtr">
         <td class="adtd">2</td>
         <td class="adtd">입양후기</td>
         <td class="adtd">사랑해</td>
         <td class="adtd">3</td>
         <td class="adtd">67</td>
      </tr>
   </table >
   <table align="center">
      <tr>
         <td style="width:1100px; text-align:left;">
            <select>
                  <option>신고 낮은순</option>
                  <option>신고 높은순</option>
            </select>
         </td>

      </tr>
   </table>

   <ul class="pagination">
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
   </ul>



  <%@ include file="/views/common/bottom_Include.jsp"%>
</body>
</html>