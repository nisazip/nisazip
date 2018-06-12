<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
<%
	Trip tregist = (Trip)session.getAttribute("tregist");
%>

<!DOCTYPE html>
<html>
 <head>
 	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Roboto">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Montserrat">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
		<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
 </head>
<body>
	
	<%@ include file="../common/header.jsp"%><br><br><br><br><br><br>
	
	<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large"
		style="z-index: 3; width: 300px; font-weight: bold; padding-top: 0px !important;"
		id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div id="memberJoin"
			style="width: 300px; height: 80px; font-size: 13px; background: white;margin-top: 5px;">
		</div>
		<div class="w3-bar-block w3-padding">
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/views/regist/1trip_name.jsp'">트립 등록하기</div> <br>
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/tripSelectList.trip'">등록된 Trip 보기</div><br>
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/TripReservationList.trip'">등록 Trip 예약자 명단</div> <br> 
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Trip_statistics.trip'">My Trip 통계보기</div>
		</div>
	</nav>
    <!-- !PAGE CONTENT! -->
    <form action="<%=request.getContextPath()%>/insertMaxPeople.trip" method="post">
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <h1 class="w3-jumbo">
                    <b>트립 등록하기</b>
                </h1>
                <h1 class="w3-xxxlarge w3-text-green">
                    <b>Fifth.</b>
                </h1>
                <hr style="width:50px;border:5px solid green" class="w3-round">
            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                
            </div>
            <div style="font-weight: bold; font-size: 29px;" class="w3-center">
                회원님의 Trip에 참여할 인원수를 입력하세요
                <br><br>
                최대 인원수 : &nbsp; <input type="number" id="maxPeople" name="maxPeople" style="width:200px;" min="1" max="20" class="w3-center" placeholder="최대인원 수"> 명 <br><br>
                <br>
                <a href="<%=request.getContextPath() %>/views/regist/4trip_lang.jsp" id="btn_style"  class="w3-padding-large w3-button w3-center">이전단계</a>
                <button type="submit" id="btn_style1" class="w3-padding-large w3-button w3-center">다음단계</button>
            </div>
        </div>
    </form>
    		<script>   
   $(function(){
		$("#btn_style1").click(function(event){
			var maxPeople = $('#maxPeople').val();
			if(maxPeople == 0){
	        	alert("Trip의 최대인원을 설정해주세요!");
	    
			} else {
				 return true;
			}
			event.preventDefault();
		})
	});
   </script>
</body>
</html>