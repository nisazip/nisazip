<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.R_RESERVATION"%>
<%
	R_RESERVATION res = (R_RESERVATION)request.getAttribute("res");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
/* .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1} */
</style>
<body>

      <%@ include file="../common/header.jsp" %>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large w3-padding" style="z-index:0;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>네가 사는</b><br><b>그집</b></h3>
  </div>
  <div class="w3-bar-block">
    
    <a href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp" class="w3-bar-item w3-button w3-hover-white">숙소 등록하기</a>  
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">등록 숙소 보기</div> 
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Rstatistics.no'">통계 페이지</div>
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomReservationList.no'">등록 숙소 예약자 명단</div> 
</div>
</nav>
<div>
	<h1 class="w3-center" style="color: green; font-size: 38pt; margin-left: -50px;"><b><i> 등록 숙소 예약자 정보</i></b></h1>
</div>
	<h4 style="margin-top: 100px; margin-left:500px; font-size: 22pt;">예약 번호: <%=res.getR_reser_no() %></h4><br /><br />
	<%-- <h4 style="margin-left:500px;">유저 아이디: <%=res.getUser_id() %></h4><br /><br /> --%>
	<table class="table" border="3px; solid;" style="font-size: 15px; margin-left:502px; text-align: center; width: 50%">
    <thead>
      <tr>
        <th>고객아이디</th>
        <th>체크인 날짜</th>
        <th>체크아웃 날짜</th>
        <th>인원 수</th>
        <th>총 가격</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=res.getUser_id() %></td>
        <td><%=res.getCheck_in() %></td>
        <td><%=res.getCheck_out() %></td>
        <td><%=res.getPeople() %></td>
        <td><%=res.getTotal_price() %></td>
      </tr>
      
    </tbody>
  </table>
</body>
</html>