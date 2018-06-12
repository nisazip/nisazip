<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>

<%
	TripModify tm = (TripModify) request.getAttribute("tmodify");
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
	<form action="" method="post" encType="multipart/form-data">
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-center" style="font-size: 38pt;">
					<b> <i> Trip Contents 수정 완료</i>
					</b>
				</h1>
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div style="font-weight: bold; font-size: 29px;" class="w3-center">
				<div style="width: 1400px;">
					<div style="width: 1400px; margin:auto;">
						<table border="1" style="width:1400px; height:800px; color:black;">
							<tr>
								<td style="width: 250px">트립 제목</td>
								<td style= "width: 730px; text-align: left; padding-left: 20px;">
									<%=tm.getTitle()%>
								</td>
								<td style= "width: 420px;">대표 사진</td>
							</tr>
							<tr>
								<td>트립 가격</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getPrice()%>
								</td>
								<td rowspan="4">
									<img name="pic1" id="pic1" src="<%=request.getContextPath() %>/resources/trip_images/<%= tm.getPic1() %>"/>
								</td>
							</tr>
							<tr>
								<td>트립 언어</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getLanguage()%>
								</td>								
							</tr>
							<tr>
								<td>트립 유형</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getcategory()%>
								</td>								
							</tr>
							<tr>
								<td>트립 인원</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getPeople()%>
								</td>								
							</tr>
							<tr>
								<td>트립 설명</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getIntroduce()%>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getZip() %>
								</td>
								<td rowspan="3">
									<img name="pic2" id="pic2" src="<%=request.getContextPath() %>/resources/trip_images/<%= tm.getPic2() %>"/>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getAddr() %>
								</td>
								
							</tr>
							<tr>
								<td>상세 주소</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getAddr_detail() %>
								</td>
								
							</tr>
							<tr>
								<td>시작 시간</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getStartTime()%>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>종료 시간</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getEndTime()%>
								</td>
								<td rowspan="3">
									<img id="pic3" name="pic3" src="<%=request.getContextPath() %>/resources/trip_images/<%= tm.getPic3() %>"/>
								</td>
							</tr>
							<tr>
								<td>예약 시작 기간</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getStartReservation()%>
								</td>
								
							</tr>
							<tr>
								<td>예약 종료 기간</td>
								<td style="text-align: left; padding-left: 20px;">
									<%=tm.getEndReservation()%>
								</td>
							</tr>
						</table>
						<br>
						<br>
					</div>
				</div>
			</div>
			</div>
	</form>
	<script>
		
	</script>
</body>
</html>