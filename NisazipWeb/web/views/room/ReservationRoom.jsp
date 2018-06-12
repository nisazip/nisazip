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
    <h3 class="w3-padding-64">네가 사는 그집</h3>
  </div>
  <div class="w3-bar-block">
    
    <a href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp" class="w3-bar-item w3-button w3-hover-white">숙소 등록하기</a>  
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">등록 숙소 보기</div> 
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Rstatistics.no'">통계 페이지</div>
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomReservationList.no'">등록 숙소 예약자 명단</div>
</div>
</nav>
	<h1>테스트</h1>
	<h1 style="margin-left: 400px; margin-top: 170px; color: green;">예약 상세페이지</h1><br /><br />
	<h3 style="margin-left: 400px;">숙소 등록번호: <%=res.getR_id()%></h3>
	<h3 style="margin-left: 400px;">예약 번호: <%=res.getR_reser_no()%></h3>
	<h3 style="margin-left: 400px;">회원 아이디: <%=res.getUser_id()%></h3>
	<h3 style="margin-left: 400px;">총액: 1박당 가격 * 날짜(일수) * 인원수(명) [부가세 10% 포함] : <%=res.getTotal_price()%>원</h3>
	<h3 style="margin-left: 400px;">체크인 날짜 : <%=res.getCheck_in()%></h3>
	<h3 style="margin-left: 400px;">체크아웃 날짜 : <%=res.getCheck_out()%></h3>
	<h3 style="margin-left: 400px;">인원수 : <%=res.getPeople()%>명</h3><br /><br />
	<button style="margin-left: 400px; color: green; width: 250px; height: 50px;">결제하기</button>
</body>
</html>