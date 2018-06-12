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
       <h1 class="w3-center" style="font-size: 48pt;"><b>3단계</b></h1>    
  </div><br><br>
<form id="joinForm" action="<%=request.getContextPath()%>/rInsert3.do" method="post">

  <div style="font-weight: bold; font-size: 29px;" class="w3-center">
       ○회원님의 숙소는 어디에 있나요?<br>
    <div data-text-content="true" style="background: Lightgreen; text-align: center; font-size: 30px;" class="">대한민국 제주특별자치도</div>
    <select id="R_LOC" name="R_LOC" style="width: 500px; height: 50px; color: gray; text-align: center;">
                  <option value="지역명" style="color: black">지역을 선택하세요.</option>
                  <option value="제주시">제주시</option>
                  <option value="한경면">한경면</option>
                  <option value="한림읍">한림읍</option>
                  <option value="애월읍">애월읍</option>
                  <option value="조천읍">조천읍</option>
                  <option value="구좌읍">구좌읍</option>
                  <option value="서귀포시">서귀포시</option>
                  <option value="성산읍">성산읍</option>
                  <option value="표선면">표선면</option>
                  <option value="남원읍">남원읍</option>
                  <option value="안덕면">안덕면</option>
                  <option value="대정읍">대정읍</option>
                  <option value="우도면">우도면</option>
                  <option value="추자면">추자면</option>
               </select>   <br><br>
       
    
        우편번호:&nbsp;<input type="text" id="zipCode" name="zipCode">
    <div id="ckZip" onclick="addrSearch();">검색</div><br>
        주소:<input type="text" id="address1" name="address1" size="40;" style="margin-left: 59px;"> <br><br>
        상세주소:&nbsp;<input type="text" id="address2" name="address2" size="40"> <br><br>
    <p>※저희 사이트는 제주도만 가능합니다.</p>
        <button style="background: green;"><a style="color: white;" href="<%=request.getContextPath()%>/views/room/RoomInsert2.jsp">이전단계</a></button>
        <button style="background: green; color: white;"><div onclick="insertR()">다음단계</div></button>
  </div>
</form>
 <script>
 			 
 $( "#joinForm" ).submit(function( event ) {
		var p1 = $('#R_LOC').val();
		var p2 = $('#zipCode').val();
		var p3 = $('#address1').val();
		var re = /제주/;
		
   if(p1 == "" || p2 == "" || p3 == ""){
   	alert("값을 입력해주세요.");
   }/* else if(!(p2.match('/제주/'))){
	   alert("제주도에 있는 지역을 입력해주세요!")
   } */ 
   else {
        return true;
   }
		 event.preventDefault();
	});	
 			 
 			 
				// 참조 API : http://postcode.map.daum.net/guide
				function addrSearch() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = ''; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수

			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    fullAddr = data.roadAddress;

			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    fullAddr = data.jibunAddress;
			                }

			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			                if(data.userSelectedType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }

			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
			                
			                $('#address1').val(fullAddr);

			                // 커서를 상세주소 필드로 이동한다.
			                $('#address2').focus();
			            }
			        }).open();
			    };
			</script> 
</body>
</html>