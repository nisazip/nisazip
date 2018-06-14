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
       <h1 class="w3-center" style="font-size: 48pt;"><b>5단계</b></h1>    
  </div><br><br>
  <form id="joinForm1" action="<%=request.getContextPath()%>/rInsert5.do" method="post">
  <div style="font-weight: bold; font-size: 29px;" class="w3-center">
       	○회원님의 숙소를 설명해주세요.<br>
        <textarea name="R_DETAIL" id="R_DETAIL" cols="30" rows="3" placeholder="게스트에게 알려주고자 하는 상세내용을 기입하세요"></textarea><br><br>
        ○숙소 규칙을 입력해주세요.<br>
        <div id="pre_set" style="display:none">
    	<input type="text" name="R_RULE" id="R_RULE" value="" style="width:400px;" placeholder="체크인 시간은  OO시 입니다.">
    	<!-- <input type="text" name="R_RULE" value="" style="width:400px;" placeholder="체크인 시간은  OO시 입니다."><br>
    	<input type="text" name="R_RULE" value="" style="width:400px;" placeholder="체크인 시간은  OO시 입니다."><br>
    	<input type="text" name="R_RULE" value="" style="width:400px;" placeholder="체크인 시간은  OO시 입니다.">  -->
    	<input type="button" value="삭제" onclick="remove_item(this)">
		</div>
		<div id="field"></div>
 		<input type="button" value=" 추가 " onclick="add_item()"><br><br />
        ○회원님의 숙소 이름을 정해주세요. <br>
        <input type="text" placeholder="내용을 입력해주세요." size="30" name="R_NAME" id="R_NAME"><br><br>
        <button style="background: green;"><a style="color: white;" href="<%=request.getContextPath()%>/views/room/RoomInsert4.jsp">이전단계</a></button>
        <button style="background: green; color: white;"><div onclick="insertR()">다음단계</div></button>
  </div>
  </form>
   <script>
   function add_item(){
       // pre_set 에 있는 내용을 읽어와서 처리..
       var div = document.createElement('div');
       div.innerHTML = document.getElementById('pre_set').innerHTML;
       document.getElementById('field').appendChild(div);
   }

   function remove_item(obj){
       // obj.parentNode 를 이용하여 삭제
       document.getElementById('field').removeChild(obj.parentNode);
   }
   $( "#joinForm1" ).submit(function( event ) {
		var p1 = $('#R_DETAIL').val();
		var p2 = $('#R_RULE').val();
		var p3 = $('#R_NAME').val();
		
		
  if(p1 == "" || p3 == ""){
  	alert("값을 입력해주세요.");
  } else {
       return true;
  }
		 event.preventDefault();
	});
   </script>
</body>
</html>