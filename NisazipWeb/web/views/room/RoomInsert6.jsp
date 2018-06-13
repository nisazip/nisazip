<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.Room"%>
<%
	Room r = (Room)request.getAttribute("room");
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
	<%-- <div class="w3-top">
        <div class="w3-bar w3-white w3-card">
          <a href="#" class="w3-padding-large w3-button w3-right">로그인</a>
          <a href="#" class="w3-padding-large w3-button w3-right">마이페이지</a>
          <a href="#" class="w3-padding-large w3-button w3-right">메시지</a>
          <div class="w3-dropdown-hover w3-right">
              <button class="w3-padding-large w3-button">호스팅 <i class="fa fa-caret-down"></i></button>     
              <div class="w3-dropdown-content w3-bar-block w3-card-4">
                <a href="<%=request.getContextPath()%>/view/Room.jsp" class="w3-bar-item w3-button" id="home">숙소</a>
                <a href="#" class="w3-bar-item w3-button" id="trip">트립</a>
                                               
              </div>
            </div>
          <a href="#" class="w3-bar-item w3-padding-large w3-button w3-right">트립보기</a>
          <a href="#" class="w3-bar-item w3-padding-large w3-button w3-right">숙소보기</a>
          <a href="<%=request.getContextPath()%>/view/semi.html" class="w3-bar-item w3-padding-large w3-button w3-right">홈</a>
        </div>
      </div> --%>
      <%@ include file="../common/header.jsp" %>  <br /><br /><br /><br /><br /><br /><br /><br /><br />
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large w3-padding" style="z-index:0;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"></h3>
  </div>
  <div class="w3-bar-block">
    
    <a href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp" class="w3-bar-item w3-button w3-hover-white">숙소 등록하기</a>  
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">등록 숙소 보기</div> 
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Rstatistics.no'">통계 페이지</div>
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomReservationList.no'">등록 숙소 예약자 명단</div>
</div>
</nav>
    <!-- Header -->
  <div class="w3-container" id="showcase">
       <h1 class="w3-center" style="font-size: 48pt;"><b>6단계</b></h1>    
  </div><br><br>
  <form id="joinForm1" action="<%=request.getContextPath()%>/rInsert6.do" method="post">

  <%-- <div style="font-weight: bold; font-size: 29px;" class="w3-center">
       ○숙박가능한 날짜를 체크해주세요.<br><br>
        <input type="date" placeholder="시작날짜" name="R_START_DATE"> ~ <input type="date" placeholder="종료날짜" name="R_END_DATE"><br><br>
        <div><a href="<%=request.getContextPath()%>/view/RoomInsert5.jsp">이전단계</a></div>
        <div onclick="insertR()">다음단계</div>
  </div> --%>
  	<div style="font-weight: bold; font-size: 29px;" class="w3-center">
                회원님의 숙소에 예약 가능 기간과 예약 종료 기간을 설정하세요.
                <p>
                    <br> 시작일 :
                    <input type="text" name="R_START_DATE" class="datepicker1" id="datepicker1" />
                    <br>
                    <br> 종료일 :
                    <input type="text" name="R_END_DATE" class="datepicker2" id="datepicker2" />
                </p><br />
                <button style="background: green;"><a style="color: white;" href="<%=request.getContextPath()%>/views/room/RoomInsert5.jsp">이전단계</a></button>
        		<button style="background: green; color: white;"><div onclick="insertR()">다음단계</div></button>
            </div>

        </div>
   
  </form>
  <script>
  $( "#joinForm1" ).submit(function( event ) {
		var p1 = $('#datepicker1').val();
		var p2 = $('#datepicker2').val();
		
		
		
 if(p1 == "" || p2 == ""){
 	alert("날짜를 입력해주세요.");
 } else {
      return true;
 }
		 event.preventDefault();
	});
  
  $(function() {
      // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
      // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

      //시작일.
      $('.datepicker1').datepicker({
         
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
          changeMonth: true,             //월변경가능
          changeYear: true,             //년변경가능
          showMonthAfterYear: true,       //년 뒤에 월 표시
          minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
          dateFormat: 'yymmdd',
          onClose: function( selectedDate ) {    
              // 시작일(fromDate) datepicker가 닫힐때
              // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
              $(".datepicker2").datepicker( "option", "minDate", selectedDate );
          }                
      });

      //종료일
      $('.datepicker2').datepicker({
         dateFormat: 'yymmdd',
          minDate: 0,
          monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
          changeMonth: true, //월변경가능
          changeYear: true, //년변경가능
          showMonthAfterYear: true, //년 뒤에 월 표시
          //minDate: 0, // 오늘 이전 날짜 선택 불가
          onClose: function( selectedDate ) {
              // 종료일(toDate) datepicker가 닫힐때
              // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
              $(".datepicker1").datepicker( "option", "maxDate", selectedDate );
          }                
      });
  });
  </script>
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
 
</body>
</html>