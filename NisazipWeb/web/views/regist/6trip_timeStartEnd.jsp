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
	<form action="<%=request.getContextPath()%>/insertTime.trip"
		method="post">
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-jumbo">
					<b>트립 등록하기</b>
				</h1>
				<h1 class="w3-xxxlarge w3-text-green">
					<b>Sixth.</b>
				</h1>
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">

			</div>
			<div style="font-weight: bold; font-size: 29px;" class="w3-center">
				회원님의 Trip에 시작시간과 종료시간을 설정하세요.
				<div style="font-weight: bold; font-size: 29px;" class="w3-center">
					<br> <select id="startTime" name="startTime"
						style="width: 500px; height: 50px; color: gray; text-align: center;">
						<option value="00:00">오전 12:00 KST</option>
						<option value="00:30">오전 12:30 KST</option>
						<option value="01:00">오전 1:00 KST</option>
						<option value="01:30">오전 1:30 KST</option>
						<option value="02:00">오전 2:00 KST</option>
						<option value="02:30">오전 2:30 KST</option>
						<option value="03:00">오전 3:00 KST</option>
						<option value="03:30">오전 3:30 KST</option>
						<option value="04:00">오전 4:00 KST</option>
						<option value="04:30">오전 4:30 KST</option>
						<option value="05:00">오전 5:00 KST</option>
						<option value="05:30">오전 5:30 KST</option>
						<option value="06:00">오전 6:00 KST</option>
						<option value="06:30">오전 6:30 KST</option>
						<option value="07:00">오전 7:00 KST</option>
						<option value="07:30">오전 7:30 KST</option>
						<option value="08:00">오전 8:00 KST</option>
						<option value="08:30">오전 8:30 KST</option>
						<option value="09:00">오전 9:00 KST</option>
						<option value="09:30">오전 9:30 KST</option>
						<option value="10:00">오전 10:00 KST</option>
						<option value="10:30">오전 10:30 KST</option>
						<option value="11:00">오전 11:00 KST</option>
						<option value="11:30">오전 11:30 KST</option>
						<option selected="" value="시작 시간을 선택하지 않으셨습니다.">시작 시간</option>
						<option value="12:00">오후 12:00 KST</option>
						<option value="12:30">오후 12:30 KST</option>
						<option value="13:00">오후 1:00 KST</option>
						<option value="13:30">오후 1:30 KST</option>
						<option value="14:00">오후 2:00 KST</option>
						<option value="14:30">오후 2:30 KST</option>
						<option value="15:00">오후 3:00 KST</option>
						<option value="15:30">오후 3:30 KST</option>
						<option value="16:00">오후 4:00 KST</option>
						<option value="16:30">오후 4:30 KST</option>
						<option value="17:00">오후 5:00 KST</option>
						<option value="17:30">오후 5:30 KST</option>
						<option value="18:00">오후 6:00 KST</option>
						<option value="18:30">오후 6:30 KST</option>
						<option value="19:00">오후 7:00 KST</option>
						<option value="19:30">오후 7:30 KST</option>
						<option value="20:00">오후 8:00 KST</option>
						<option value="20:30">오후 8:30 KST</option>
						<option value="21:00">오후 9:00 KST</option>
						<option value="21:30">오후 9:30 KST</option>
						<option value="22:00">오후 10:00 KST</option>
						<option value="22:30">오후 10:30 KST</option>
						<option value="23:00">오후 11:00 KST</option>
						<option value="23:30">오후 11:30 KST</option>
					</select>
				</div>
				<br>
				<div>
					<select id="endTime" name="endTime"
						style="width: 500px; height: 50px; color: gray; text-align: center;">
						<option value="00:00">오전 12:00 KST</option>
						<option value="00:30">오전 12:30 KST</option>
						<option value="01:00">오전 1:00 KST</option>
						<option value="01:30">오전 1:30 KST</option>
						<option value="02:00">오전 2:00 KST</option>
						<option value="02:30">오전 2:30 KST</option>
						<option value="03:00">오전 3:00 KST</option>
						<option value="03:30">오전 3:30 KST</option>
						<option value="04:00">오전 4:00 KST</option>
						<option value="04:30">오전 4:30 KST</option>
						<option value="05:00">오전 5:00 KST</option>
						<option value="05:30">오전 5:30 KST</option>
						<option value="06:00">오전 6:00 KST</option>
						<option value="06:30">오전 6:30 KST</option>
						<option value="07:00">오전 7:00 KST</option>
						<option value="07:30">오전 7:30 KST</option>
						<option value="08:00">오전 8:00 KST</option>
						<option value="08:30">오전 8:30 KST</option>
						<option value="09:00">오전 9:00 KST</option>
						<option value="09:30">오전 9:30 KST</option>
						<option value="10:00">오전 10:00 KST</option>
						<option value="10:30">오전 10:30 KST</option>
						<option value="11:00">오전 11:00 KST</option>
						<option value="11:30">오전 11:30 KST</option>
						<option selected="" value="종료 시간을 선택하지 않으셨습니다.">종료 시간</option>
						<option value="12:00">오후 12:00 KST</option>
						<option value="12:30">오후 12:30 KST</option>
						<option value="13:00">오후 1:00 KST</option>
						<option value="13:30">오후 1:30 KST</option>
						<option value="14:00">오후 2:00 KST</option>
						<option value="14:30">오후 2:30 KST</option>
						<option value="15:00">오후 3:00 KST</option>
						<option value="15:30">오후 3:30 KST</option>
						<option value="16:00">오후 4:00 KST</option>
						<option value="16:30">오후 4:30 KST</option>
						<option value="17:00">오후 5:00 KST</option>
						<option value="17:30">오후 5:30 KST</option>
						<option value="18:00">오후 6:00 KST</option>
						<option value="18:30">오후 6:30 KST</option>
						<option value="19:00">오후 7:00 KST</option>
						<option value="19:30">오후 7:30 KST</option>
						<option value="20:00">오후 8:00 KST</option>
						<option value="20:30">오후 8:30 KST</option>
						<option value="21:00">오후 9:00 KST</option>
						<option value="21:30">오후 9:30 KST</option>
						<option value="22:00">오후 10:00 KST</option>
						<option value="22:30">오후 10:30 KST</option>
						<option value="23:00">오후 11:00 KST</option>
						<option value="23:30">오후 11:30 KST</option>
					</select>
				</div>
				<br> <a href="<%=request.getContextPath() %>/views/regist/5trip_maxPeople.jsp" id="btn_style"
					class="w3-padding-large w3-button w3-center">이전단계</a>
				<button type="submit" id="btn_style1"
					class="w3-padding-large w3-button w3-center">다음단계</button>
			</div>
		</div>
	</form>
	<script>   
   $(function(){
		$("#btn_style1").click(function(event){
			var startTime = $('#startTime').val();
			var endTime = $('#endTime').val();

			
			if(startTime == "시작 시간을 선택하지 않으셨습니다."){
				alert("Trip의 시작 시간을 설정해주세요!");
				if(endTime == "종료 시간을 선택하지 않으셨습니다."){
					alert("Trip의 종료시간을 설정해주세요!");
				}
			}else if(endTime == "종료 시간을 선택하지 않으셨습니다."){
				alert("Trip의 종료시간을 설정해주세요!");
				if(startTime == "시작 시간을 선택하지 않으셨습니다."){
					alert("Trip의 시작 시간을 설정해주세요!");
				}
			} else {
				 return true;
			}
			event.preventDefault();
		})
	});
   </script>
</body>
</html>
