<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
<%@ page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%!
// 선언자 태그라고 해서 특정 함수를 선언하거나 할 때 사용합니다.
	public String myDateChange(String str){
		String[] dateSplit = str.split("/");
		return dateSplit[0]+"년 "+dateSplit[1]+"월 "+dateSplit[2]+"일";
	}

	public String myTimeChange(String str){
		String[] dateSplit = str.split(" ");
		String[] time = dateSplit[1].split(":");
		return time[0] + "시" + time[1] + "분";
	}

	public String myDateRollback(String str){
		// 이거 테스트 해봐야 할 것 같네요, 나중에 ㅎㅎ
		String[] dateReturn = str.split("/[가-힣]/");
		
		return dateReturn[0]+"/"+dateReturn[1]+"/"+dateReturn[2];
	}
%>
<%
	Trip tr = (Trip) request.getAttribute("tregist");
	Attachment hp = (Attachment) request.getAttribute("hp");
	
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
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("picList");
	
	Attachment titleImg = fileList.get(0);
	Attachment detailImg1 = fileList.get(1);
	Attachment detailImg2 = fileList.get(2);
	String countMsg = "";
	countMsg = (String)request.getAttribute("countMsg");
%>
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
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

			<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

				<!-- Header -->
				<div class="w3-container" style="margin-top: 80px" id="showcase">
					<h1 class="w3-jumbo">
						<b>등록한 Trip 정보</b><br> <br>
						<h3 class="w3-center">
							<b>등록한 숙소 정보 (게스트 용)</b> &nbsp;
							<input type="button" id="btn_style" value="호스트용" onclick="location.href='<%=request.getContextPath()%>/registedTrip.trip'">&nbsp;
							<input type="button" id="btn_style" value="예약 취소" onclick="location.href='<%=request.getContextPath()%>/CancelReservation.trip?tripNumber=<%=tr.getT_id()%>'">&nbsp;
							<a id="btn_style" onclick="goMain();">메인으로</a>
						</h3>
					</h1>
				</div>
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">

			</div>
			<div style="font-weight: bold; font-size: 65px; color: green; margin-left: 100px;" id="" class="w3-center">
				Trip 명 : &nbsp;
				<%=tr.getT_name()%>
			</div>
			<br>
			<div style="font-weight: bold; margin: auto; font-size: 25px; color: green;" class="w3-center">
				<div class="w3-content w3-display-container" >
					<img class="mySlides" src="<%=request.getContextPath() %>/resources/trip_images/<%= titleImg.getChange_name() %>" style="width:100%; height: 50%">
					<img class="mySlides" src="<%=request.getContextPath() %>/resources/trip_images/<%= detailImg1.getChange_name() %>" style="width:100%; height: 50%">
					<img class="mySlides" src="<%=request.getContextPath() %>/resources/trip_images/<%= detailImg2.getChange_name() %>" style="width:100%; height: 50%">

					<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)" type="button">&#10094;</button>
					<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)" type="button">&#10095;</button>
				</div>
				<br> <br>
				<div id="" style="color: black; margin: auto;">
					#Trip 인원 : <%=tr.getT_max_num()%>명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					#Trip 유형 : <%=tr.getT_type()%>&nbsp;&nbsp;&nbsp;
					#Trip 언어 : <%=tr.getLanguage()%>
				</div>
				<br>
				<input type="button" value="호스트에게 메세지 보내기" style="color: cadetblue">
				<form id="reservationForm" action="" method="post" style="color: green; position: fixed; top: 615px; ">		           
					<h3 style="margin-left: 1200px;">￦<%=tr.getPrice() %></h3>
		            <h3 style="margin-left: 1200px;">★★★★★<%=tr.getScore() %></h3>
					<input style="text-align:center; margin-left: 1200px;" size="20" placeholder="Trip 날짜를 선택하세요." type="text" name="T_START_DATE" class="datepicker1" id="datepicker1"/><br> 
					<br><input type="number" name="people" placeholder="OO명" style="text-align: right; margin-left: 1200px;" max="20">
					<br><br>
					<button style="margin-left: 1200px;" id="reservation_trip" onclick="reservation()">예약하기</button>
		            <input type="button" value="신고하기" style=" border-radius: 40px; color: darkred;">		            
		        </form>

			</div>
			<br> <br> <br>
			<div style="font-weight: bold; font-size: 25px;" class="w3-center">
				# Trip 시작 시간 :
				<%=myTimeChange(tr.getT_start_time())%><br>
				<br> # Trip 종료 시간 :
				<%=myTimeChange(tr.getT_end_time())%>
			</div>
			<br>
			<br>
			<div style="font-weight: bold; font-size: 25px;" class="w3-center">
				# 예약 가능한 날짜<br>
				<br>
				<p style="color: tomato"><%=myDateChange(tr.getT_start_date())%>
					~
					<%=myDateChange(tr.getT_end_date())%></p>
				<%-- <p style="color: tomato"><%= tr.getTrip_stratReservation().substring(0, 13) %> ~ <%= tr.getTrip_endReservation().substring(0, 13) %></p> --%>
			</div>
			<br>
			<br>
			<div style="font-weight: bold; font-size: 25px;">
				<h1 style="text-align: left; padding-left: 300px;"># Trip 장소 #</h1>
				<br>
				<br>


			</div>
			<div style="font-weight: bold; font-size: 25px;" class="w3-center">
				<div style="margin-left: 30px;">
					# 지역 명 : <input
						style="border: none; background: white; color: blue;" size="50"
						type="text" id="area" disabled />
				</div>
				<br>
				<div style="margin-left: 40px;">
					# 우편번호 : <input
						style="border: none; background: white; color: blue;" size="50"
						type="text" id="zip" disabled />
				</div>
				<br>
				<div style="margin-left: -10px;">
					# 주소 : <input style="border: none; background: white; color: blue;"
						size="50" type="text" id="addr" disabled />
				</div>
				<br>
				<div style="margin-left: 50px;">
					# 상세 주소 : <input
						style="border: none; background: white; color: blue;" size="50"
						type="text" id="addr_detail" disabled />
				</div>
				<br> <br>
			</div>
			<br>
			<br>
			<div style="font-weight: bold; font-size: 25px; color: blue;"
				class="w3-center">
				<h1><b style="color: red;"># 예약 취소 #</b></h1><br> Trip 시작 7일 전까지 예약을
				취소하면 전액이 환불됩니다.<br> Trip이 시작하기 7일이 남지 않은 시점에 취소하면<br> 총
				요금의 50%와 수수료 전액이 환불됩니다.
			</div>
			<br> <br>
			<div style="font-weight: bold; font-size: 25px; color: darkorchid;"
				class="w3-center">
				호스트 정보:&nbsp;&nbsp;&nbsp; Sara & Rich님 (인증됨) <br>

			</div>
			<br> <br>
		</div>
	<script>
	
		
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}

	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	 
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	function reservation(){
		$('#reservationForm').attr("action", "<%=request.getContextPath()%>/TripReservation.trip?price=<%=tr.getPrice()%>&tripNumber=<%=tr.getT_id()%>");
		
	}
	
	$(function() {
	
		var addr = '<%=tr.getT_addr()%>'.split('| ');
		var area = '<%= tr.getT_area() %>';
		$('#zip').val(addr[0]);
		$('#addr').val(addr[1]);
		$('#addr_detail').val(addr[2]);
		$('#area').val(area);
		
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
	        minDate: 0,  // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	        maxDate : new Date('<%=tr.getT_end_date()%>'),
	        dateFormat: 'yymmdd',
	        onClose: function( selectedDate ) {    
	            // 시작일(fromDate) datepicker가 닫힐때
	            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	            $(".datepicker2").datepicker( "option", "minDate", selectedDate );
	        }                
	    });

	    
	    if("<%=countMsg%>"!="null"){
			alert("<%=countMsg%>");
		}
	    
	});
		
	</script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
</body>
</html>