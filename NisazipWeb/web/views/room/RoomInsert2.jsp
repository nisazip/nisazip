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
  <div class="w3-container" style="margin-top:" id="showcase">
       <h1 class="w3-center" style="font-size: 48pt;"><b>2단계</b></h1>    
  </div><br><br>
  <form id="joinForm" action="<%=request.getContextPath()%>/rInsert2.do" method="post">

  <div style="font-weight: bold; font-size: 29px;" class="w3-center">
      ○회원님의 숙소에는 무엇이 있나요?<br><br>
        침실 개수: &nbsp; <input type="number" max="4" min="1" class="w3-center" name="ROOM_NUM" id="ROOM_NUM">개 <br><br>
        침대 개수: &nbsp; <input type="number" max="4" min="1" class="w3-center" name="BED_NUM" id="BED_NUM">개 <br><br>
        욕실 개수: &nbsp; <input type="number" max="4" min="1" class="w3-center" name="TOILET_NUM" id="TOILET_NUM">개 <br><br>

        ○편의 시설은 어떤 것 들이 있나요?(체크박스에 체크해 주세요.)<br><br>
    	<input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="WIFI"><label for="WIFI">&nbsp;WIFI</label>&nbsp; 
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="헤어드라이어"><label for="헤어드라이어">&nbsp;헤어드라이어</label> &nbsp;
   		<input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="TV"> <label for="TV">&nbsp;TV</label>&nbsp;
   		<input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="건조기"><label for="건조기">&nbsp;건조기</label><br>
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="다리미"><label for="다리미">&nbsp;다리미</label>&nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="주방"><label for="주방">&nbsp;주방</label> &nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="세탁기"><label for="세탁기">&nbsp;세탁기</label> &nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="에어컨"><label for="에어컨">&nbsp;에어컨</label><br>
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="난방"><label for="난방">&nbsp;난방</label>&nbsp; 
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="주차장"><label for="주차장">&nbsp;주차장</label> &nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="간단한 세면도구"><label for="간단한 세면도구">&nbsp;간단한 세면도구</label><br><br>
		
		
        <button style="background: green;"><a style="color: white;" href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp">이전단계</a></button>
        <button style="background: green; color: white;" onclick="insertR()">다음단계</button>
  </div>       
  </form>
  
  
  <script>
  $( "#joinForm" ).submit(function( event ) {
		var p1 = $('#ROOM_NUM').val();
		var p2 = $('#BED_NUM').val();
		var p3 = $('#TOILET_NUM').val();
		
		
      if(p1 == "" || p2 == "" || p3 == ""){
      	alert("값을 입력해주세요.");
      } else {
           return true;
      }
		 event.preventDefault();
	});
  </script> 
</body>
</html>