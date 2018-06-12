<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>

<%
	ArrayList<T_RESERVATION> list = (ArrayList<T_RESERVATION>) request.getAttribute("trip_list");

	T_RESERVATION trip_reservation = (T_RESERVATION)request.getAttribute("trip_reservation");
	/* TripRegist tr = (TripRegist) request.getAttribute("tregist");
	Attachment hp = (Attachment) request.getAttribute("hp");

	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("picList");

	Attachment titleImg = fileList.get(0);
	Attachment detailImg1 = fileList.get(1);
	Attachment detailImg2 = fileList.get(2); */

	/* 원하는 시간포맷으로 변경하기 */
	// SimpleDateFormat 만약 Date / Timestamp 타입으로 올 경우 이걸 사용하시면 됩니다.
	// 이게 아닌 경우는 날짜 월 일 정보를 직접 변경해주셔야 합니다.
	// 얘네는 어차피 보여주기 한 번 용도 이지요?
	// 네네
	// 그럼 가독성도 좋지만 구차하게 변수를 선언하기보단 깔끔하게
	// 한번에 출력하는 형식으로 변경합시다.
	// 이렇게
	//
	// String startDateFormat = myDateChange(tr.getTrip_stratReservation());
	// String endDateFormat = myDateChange(tr.getTrip_endReservation());

	/* 세션이 아닌 것을 사용 해야함 */
%>
<%-- <%!// 선언자 태그라고 해서 특정 함수를 선언하거나 할 때 사용합니다.
	public String myDateChange(String str) {
		String[] dateSplit = str.split("/");
		return dateSplit[0] + "년 " + dateSplit[1] + "월 " + dateSplit[2] + "일";
	}%> --%>
<!DOCTYPE html>
<html>

 <head>
 <style>
#pic1, #pic2, #pic3 {
				width:420px;
			} 
</style>
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

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<!-- Header -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-jumbo">
				<b>예약한 Trip 정보</b><br> <br>
				<h3 class="w3-center">
					<b>예약한 Trip 정보 </b> &nbsp;
					<a id="btn_style" onclick="goMain();">메인으로</a>
				</h3>
			</h1>
		</div>
		<hr style="width: 50px; border: 5px solid green" class="w3-round">
	</div>

	<!-- Photo grid (modal) -->
	<div class="w3-container" style="margin-top: 80px" id="showcase">

	</div>

	<br>
	<div>
		<h1 class="w3-center"
			style="color: green; font-size: 38pt; margin-left: -50px;">
			<b><i> Trip 예약 신청 정보</i></b>
		</h1>
	</div>
	<h1 style="margin-left: 400px; margin-top: 170px; color: green;">예약 상세페이지</h1><br /><br />
	<h3 style="margin-left: 400px;">Trip 등록번호: <%=trip_reservation.getT_id()%></h3>
	<h3 style="margin-left: 400px;">예약 번호: <%=trip_reservation.getT_reser_no()%></h3>
	<h3 style="margin-left: 400px;">회원 아이디: <%=trip_reservation.getUser_id()%></h3>
	<h3 style="margin-left: 400px;">총액: 가격 * 인원수(명) : <%=trip_reservation.getTotal_price()%>원</h3>
	<h3 style="margin-left: 400px;">Trip 날짜 : <%=trip_reservation.getT_date()%></h3>
	<h3 style="margin-left: 400px;">인원수 : <%=trip_reservation.getGuest_num()%>명</h3><br /><br />
	<button style="margin-left: 400px; color: green; width: 250px; height: 50px;">결제하기</button>
</body>
</html>