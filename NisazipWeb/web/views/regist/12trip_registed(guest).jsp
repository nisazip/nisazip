<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="">
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-center" style="margin-left: 100px; font-size: 60px;">
					<b>Trip 정보</b>
				</h1>
			</div>
			<div
				style="font-weight: bold; font-size: 45px; color: green; margin-left: 100px;"
				id="" class="w3-center">Trip 명 : &nbsp; SEMIPROJECT</div>
			<div
				style="font-weight: bold; margin: auto; font-size: 25px; color: green;"
				class="w3-center">
				<div name="" id="" class="w3-left"
					style="margin-left: 300px; width: 500px; height: 300px;">
					<image src="#" style="width: 500px; height: 300px;">
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div id="" style="color: black; margin: auto;">#Trip 인원 : 최대3명
					&nbsp;&nbsp;#Trip 유형 : 스포츠 &nbsp;&nbsp;#Trip 언어 : 한국어</div>
				<br>
				<p style="color: burlywood">추천 사유</p>
				<input type="button" value="호스트에게 메세지 보내기" style="color: cadetblue">
				<div style="color: red; position: fixed; top: 635px; right: -150px;">
					<h3 style="margin-left: 1200px;">트립 가격 : ￦77,000</h3>
					<input type="text" class="datepicker1" id="datepicker1" style="margin-left: 1200px;"/>
					<br><p style="margin-left: 1200px;">~</p>
					<input type="text" class="datepicker2" id="datepicker2" style="margin-left: 1200px;"/><br> <br />
					<input type="number" placeholder="OO명" style="text-align:right; margin-left: 1200px;" max="20">명 
					<input type="button" value="예약하기" style="margin-left: 1200px; border-radius: 40px;"><br><br>
					<input type="button" value="신고하기" style="margin-left: 1200px; border-radius: 40px; color: darkred;">
				</div>

			</div>
			<br> <br> <br>
			<div style="font-weight: bold; font-size: 25px;" class="w3-center">
				※ 준비물
				<p>
					○ 몸뚱이<br> ○ 마실거<br> ○ sr소음기<br> ○ 8배율<br> ○
					15배율<br>
			</div>
			<div style="font-weight: bold; font-size: 25px;" class="w3-center">
				※ 예약 가능한 날짜
				<p style="color: tomato">5월 1일 ~ 5월 31일</p>
			</div>

			<div style="font-weight: bold; font-size: 25px;" class="w3-center">
				※ Trip 장소 <br>
				<p style="color: red">제주도 서귀포시</p>
				<br> <img src="" width="800px;"><br> <br>
			</div>
			<div style="font-weight: bold; font-size: 25px; color: blue;"
				class="w3-center">
				<b style="color: red;">※ 예약 취소 ※</b><br> Trip 시작 7일 전까지 예약을 취소하면
				전액이 환불됩니다.<br> Trip이 시작하기 7일이 남지 않은 시점에 취소하면<br> 총 요금의 50%와
				수수료 전액이 환불됩니다.
			</div>
			<br> <br>
			<div style="font-weight: bold; font-size: 25px; color: darkorchid;"
				class="w3-center">
				호스트 정보:&nbsp;&nbsp;&nbsp; Sara & Rich님 (인증됨) <br>

			</div>
			<br> <br>
<!-- 			<div style="font-weight: bold; font-size: 25px; color: darkorchid;" -->
<!-- 				class="w3-center"> -->
<!-- 				현재 예약 가능 여부:&nbsp;&nbsp;&nbsp; YES <br> -->

<!-- 			</div> -->
		</div>
	</form>
</body>
</html>