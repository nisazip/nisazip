<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, kh.room.model.vo.*"%>
<%
	Room r = (Room)request.getAttribute("room");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	/* String countMsg = ""; */
	String countMsg = (String)request.getAttribute("countMsg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e81279e1576c7779ed7b501a3fb37e8a&libraries=services,clusterer,drawing"></script>
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

.review_img{
max-width: 70px;
height:70px;
border-radius: 50%;
float:left;
}

.checked {
    color: orange;
}

.form-check-label{
	margin-right:10px;
}

 .modal-dialog {
  width: 50%;
  /* height: 100%; */
  margin: 0;
  padding: 0;
}
.modal-content {
  height: auto;
  /* min-height: 100%; */
  border-radius: 0; 
}
</style>
<body>
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
<div style="font-weight: bold; font-size: 35px; color: green; margin-left: -600px;" id="숙소제목" class="w3-center">
    <i>숙소 이름 :&nbsp;<%=r.getR_name() %></i>
</div>	
<div class="w3-content w3-display-container" style="margin-right: -300px;">
  <img class="mySlides" src="<%=request.getContextPath() %>/resources/room_images/<%=fileList.get(0).getChange_name()%>" style="width:40%; height: 20%">
  <img class="mySlides" src="<%=request.getContextPath() %>/resources/room_images/<%=fileList.get(1).getChange_name()%>" style="width:40%; height: 20%">
  <img class="mySlides" src="<%=request.getContextPath() %>/resources/room_images/<%=fileList.get(2).getChange_name()%>" style="width:40%; height: 20%">

  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)" style="margin-right: 590px;">&#10095;</button>
</div>

<div style="font-weight: bold; font-size: 20px; color: green;" class="w3-center">
        
        <p id="" style="color: black; margin-right: 600px;">
        <input type="hidden" name="R_MAX_NUM" value=" <%=r.getR_max_num()%>" />
         ○인원: 최대 <%=r.getR_max_num()%>명 &nbsp;&nbsp;&nbsp;&nbsp;○침실: <%=r.getRoom_num()%>개 &nbsp;&nbsp;&nbsp;&nbsp; ○침대:<%=r.getBed_num()%>개 &nbsp;&nbsp;&nbsp;&nbsp; ○욕실:<%=r.getToilet_num() %>개</p>
        <p style="color:burlywood; margin-right: 600px;">
        <%=r.getR_detail() %>
        </p>
        
        <input type="button" class="btn btn-success" data-toggle="modal" data-target="#messageModal" value="연락하기" ><br /><br />
        <p id="" style="color: black; margin-left: -600px; font-family: ;">○편의시설: &nbsp;<%=r.getR_option() %></p>
        
        
        
        <form id="reservationForm" action="" method="post" style="color: green; position: fixed; top: 450px; right: -150px; /* border: 1px solid; */ /* z-index: -1000; background: linear-gradient( to left, white, lightgreen ); */">
            <%-- <h3 style="margin-left: 1200px;">등록번호: <%=r.getR_id() %>번</h3> --%>
            <h3 style="margin-left: 1200px;">￦<%=r.getPrice() %> /박</h3>
            <h3 style="margin-left: 1200px;">★★★★★<%=r.getScore() %></h3>
            <input style="margin-left: 1200px;" size="5" type="text" name="R_START_DATE" class="datepicker1" id="datepicker1"/>--><input type="text" name="R_END_DATE" size="5" class="datepicker2" id="datepicker2"><br>
            <input type="number" style="margin-left: 1200px;" size="5" name="people">명
            <!-- <input type="button" value="예약하기" style="margin-left: 1200px;" onclick="reservation();"><br><br> -->
            <button style="margin-left: 1200px;" onclick="reservation()">예약하기</button><br><br>
            <input type="button" value="신고하기" style="margin-left: 1200px; border-radius: 40px; color: darkred;"
            data-toggle="modal" id ="reportBtn"
			data-target="#reportModal" value="신고하기">
        	</form>
        
</div><br><br><br><br />
	<!-- 메세지 보내는 부분 -->
	보내는 사람 이라능 :
	<input id="m_writer" name="m_writer" type="hidden" value="로그이ㅣㄴ" />
	<br /> 받는 사람이라능 :
	<input id="m_receiver" name="m_receiver" type="hidden"
		value="<%=r.getHost_no()%>" /> 상세페이지에서 받을 것
	<br /> 호스팅 아이디 정보도 넘겨야함 :
	<input id="hosting_id" name="hosting_id" type="hidden"
		value="<%=r.getR_id()%>" /> 상세페이지에서 받을 것 EX) R2 /T2

	<input type="button" class="btn btn-success" data-toggle="modal"
		data-target="#messageModal" value="연락하기">

	<div class="container" style="width: 100%;">
		<!-- The Modal -->
		<div class="modal fade" id="messageModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header"
						style="background-color: #5cb85c; color: white;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 class="modal-title" id="who">
							<b>ooo 님에게 메시지 보내기</b>
						</h2>
					</div>

					<!-- Modal body -->
					<div class="modal-body">

						<div class="container " style="width: 100%;">
							<div class="row " style="width: 100%;">
								<h3>
									<b>HOST 님에게 연락하기!<b>
								</h3>
								<h4>
									<ul>
										<li>이곳에 오시게 된 이유는 무엇인가요?</li>
										<li>누구와 같이 오시나요?</li>
										<li>언제쯤 오시나요?</li>
										<li>필요한 것이 있으신가요?</li>
										<li>궁금한 점이 더 있으신가요?</li>
									</ul>
								</h4>
							</div>

							<hr>

							<h3>
								<b>여행계획<b>
							</h3>
							<div class="row" style="width: 100%;">
								<div class="col-sm-4">
									체크인 <input type="date" id="checkin" name="checkin"
										class="form-control col1-sm-4  " placeholder="체크아웃">
								</div>

								<div class="col-sm-4 col-sm-offset-1">
									체크아웃 <input type="date" id="checkout" name="checkout"
										class="form-control col1-sm-4  " placeholder="체크아웃">
								</div>

								<div class="col-sm-2 col-sm-offset-1">
									인원 <input type="number" id="guest_num" name="guest_num"
										value="" min="1" max="10" class="form-control" placeholder="명">
								</div>
							</div>
							<hr>
							<h4>
								<b>메세지보내기<b>
							</h4>
							<div class="row" style="width: 100%;">
								<textarea class="form-control" rows="5" id="m_content"
									name="m_content" style="margin-left: 10px;"></textarea>
								<p id="keyCounter" align=right>0/200 자</p>
							</div>

						</div>
					</div>

					<div class="modal-footer">
						<input type="button" value="보내기"
							class="btn btn-success col-sm-3 pull-right "
							onclick="valueChk();">
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- 신고자 / 신고당하는사람  -->
	신고자:
	<input type="hidden" id="rp_writer" name="rp_writer"
		value="<%-- <%=m.getUser_id() %> --%>" />
	<%-- <%=m.getUser_id() %> --%>
	<br /> 신고당하는사람:
	<input type="hidden" id="rp_receiver" name="rp_receiver"
		value="신고당하는자 " /> 호스트 아이디 넣기

	<div class="container">
		<!-- The Modal -->
		<div class="modal fade" id="reportModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header bg-success"
						style="background-color: #5cb85c; color: white;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 class="modal-title" id="who">ooo 님 신고하기</h2>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="container" style="width: 100%;">
							<label for="comment">
								<h4>
									<b>1. 신고하는 이유를 알려주세요<b>
								</h4>
							</label> <br>

							<div class="form-check">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" value="틀린정보" name="rp_type">
									부정확하거나 틀린 정보가 있어요.
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" value="불친절" name="rp_type">
									불친절합니다.
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" value="사기" name="rp_type">
									사기입니다.
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" value="기타" name="rp_type"> 기타
								</label>
							</div>

							<hr>

							<div class="form-group">
								<label for="rp_content">
									<h4>
										<b>2. 자세히 알려주세요<b>
									</h4>
								</label>
								<textarea class="form-control" rows="5" id="rp_content"
									name="rp_content"></textarea>
								<p id="keyCounter" align=right>0/200 자</p>
							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer ">
						<input type="button" value="신고하기"
							class="btn btn-success col-sm-3 pull-right" id="report"
							onclick="valueChk();">
					</div>
				</div>
			</div>
		</div>

	</div>

<!-- 기본 정보 -->
<div style="font-weight: bold; font-size: 20px; margin-left: -600px;" class="w3-center">
    ※ 숙소 규칙
    <p> <%=r.getR_rule() %></p>
</div><br />
<%-- <input type="hidden" value="<%=r.getR_max_num() %>" name="R_MAX_NUM" /> --%>
<div style="font-weight: bold; font-size: 20px; margin-left: -600px;" class="w3-center">
    ※ 예약 가능한 날짜
    <p style="color: "><%=r.getR_start_date() %> ~ <%=r.getR_end_date() %></p>
</div><br />

<div style="font-weight: bold; font-size: 20px; margin-left: -600px;" class="w3-center">
       ※ 숙소위치 <br>
       	<p style="color: "><%=r.getR_loc() %></p>
        <p style="color: "><%=r.getR_addr() %></p><br>
        <!-- 지도 -->
        <div id="map" style="width:100%;height:350px;"></div>
		<br><br>
</div>
<div style="font-weight: bold; font-size: 20px; color: ; margin-left: -600px;" class="w3-center">
              ※ 예약 취소<br>
         체크인 30일 전까지 예약을 취소하면 전액이 환불됩니다.<br>
         체크인까지 30일이 남지 않은 시점에 취소하면<br> 총 숙박 요금의 50%와 수수료 전액이 환불됩니다.
</div><br><br>
<div style="font-weight: bold; font-size: 20px; color: ; margin-left: -600px;" class="w3-center">
        호스트 정보:&nbsp;&nbsp;&nbsp; <%=r.getHost_no() %> (인증됨) <br>
        
</div><br><br>
<div style="font-weight: bold; font-size: 20px; color: ; margin-left: -600px;" class="w3-center">
        현재 예약 가능 여부:&nbsp;&nbsp;&nbsp; YES <br>
        
</div>

<!-- 리뷰 화면 -->
<div class="container" >
   				
   				<div class="container col-sm-6  col-sm-offset-3">
					<label class="form-check-label"> 
						<input type="radio"class="form-check-input" value="time" name="re_type" checked onclick="reviewLlstSort();")> 최신순
					</label>
					<label class="form-check-label">
						 <input type="radio"class="form-check-input" value="score" name="re_type" onclick="reviewLlstSort();"> 높은평점순
					</label>
					<label class="form-check-label">
						 <input type="radio"class="form-check-input" value="scoreAsc" name="re_type" onclick="reviewLlstSort();"> 낮은평점순
					</label>
				</div>
				<!-- 호스팅 아이디 추가핤것! -->
    			<input type="hidden" name="hosting_id" id="hosting_id" value="<%=r.getR_id()%>"/>
    	<!--  후기 봄ㅁ --> 
        <div class="container col-sm-6  col-sm-offset-3" id="reviewArea" ></div>
    </div>



<%if( m!= null ) {%>
    <div class="container" >
          
        <div class="container col-sm-6  col-sm-offset-3" id="reviewAdd">
            
            <div class="panel panel-default">
  			  <div class="panel-heading">후기작성</div>
				 <div class="panel-body">
				       
				        <div class="row">
					        <div class="col-sm-10" >
			                    <label >작성자</label>
			                    
			                   		 
 									<input type="hidden" name="user_id" id="user_id" value="<%-- <%=m.getUser_id()% --%>>"/>
			                    <span ><%=m.getUser_name()%></span>
			                 
			                </div>
						</div>
				 		<div class="row">
		                    <div class="col-sm-4 form-inline" >
			                    <label for="re_score">평점</label>
			                    <select class="form-control input-sm " id="re_score" class="re_score"  style ="margin:5px;">
			                            <option value="5">매우 만족(5점)</option>
			                            <option value="4">만족 (4점)</option>
			                            <option value="3" selected>보통 (3점)</option>
			                            <option value="2">불만족 (2점)</option>
			                            <option value="1">매우 불만족 (1점)</option>
			                    </select>
			                </div>
		                </div>
		
		                <div class="form-group">
			                <label for="re_score">내용</label>
		                        <textarea class="form-control" rows="3" id="re_content" class="re_content" ></textarea>
		                		<p id = "keyCounter" align=right> 0/200 자</p>
		                </div>
			                   
		                 <div class="pull-right">
			                  <button class="btn btn-success" onclick="reviewInsert();"> 등록</button>
			                  
		 				</div>
   				 </div>
  			</div>
 
 		</div>
  			
	</div>
  					
    <%} %>


<script>
$(function(){
	$('#rp_content').keyup(function(){
		var input = $(this).val().length;
		
		var remain = 200 -input;
		
		if(remain<0){
			alert('글자 수 초과');
			$(this).val($(this).val().substring(0,200));
			input--;
		}
		
		$('#keyCounter').html(input+"/200 자");
	});
});
	 
	 
	 // 빈값 체크
	 function valueChk(){

		var rpType =$("input[name='rp_type']:checked").val();
		console.log(rpType);
		 if( !rpType || $.trim($('#rp_content').val())==""  ){
  	           if(!rpType){
  	               alert("신고하는 이유를 알려주세요");
  	           }else if($.trim($('#rp_content').val())=="" ){
  	        	 alert("자세히 알려주세요");
  	                $('#rp_content').focus();
  	           }
		}else{
			insert();
		} 		 
	 }

	 function insert(){
  	 $.ajax({
			 url:"<%=request.getContextPath() %>/reportInsert.re",
			 type: "post",
			 data : { rp_writer: $('#rp_writer').val(),
					rp_receiver:$('#rp_receiver').val(),
					rp_type:$("input[name='rp_type']:checked").val(),
					rp_content:$('#rp_content').val()
					},
			success : function(data){
				if(data==0){
					alert('전송실패');
  				}else{
					alert('전송완료');
					  $('#rp_content').val("");
					  $("input[name='rp_type']:checked").prop('checked',false);
					  $("#reportModal").modal("hide");
					  $('#reportBtn').prop('disabled',true).val('신고완료');
					}
			}, error : function(data){
				console.log("에러");
			}
		 });
	 }

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
	$('#reservationForm').attr("action","<%=request.getContextPath()%>/roomReservation.no?price=<%=r.getPrice()%>&num=<%=r.getR_id()%>&max_num=<%=r.getR_max_num()%>&id=<%=m.getUser_id()%>");
	};
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=r.getR_addr() %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
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

if("<%=countMsg%>"!="null"){
	alert("<%=countMsg%>");
}

/* 리뷰 스크립트 */
function reviewInsert(){
			 if($.trim($('#re_content').val())==""){
				alert("내용을 입력해주세요");
				return false;
			} else{
				
				$.ajax({
					url:"<%=request.getContextPath() %>/reviewInsert.re",
					type:"post",
					data: {
						user_id : $('#user_id').val() ,
						hosting_id : $('#hosting_id').val(),
						re_content : $('#re_content').val(),
						re_score : $('#re_score').val()
					}, success : function(data){
						if(data==1){
							alert('추가 성공');
							re_content : $('#re_content').val('');
							reviewList("time"); 
						}else if(data ==0){
							alert('이용 고객만 작성할 수 있습니다');
						}
						else{
							alert('등록 오류');
						}
					}
				});
			}
		}
		
		$(function(){
			reviewList("time");
		});
		
		function deleteReview(obj){
			var num = $(obj).parent().siblings('input').val();
			console.log(num);
		
			$.ajax({
				url:"<%=request.getContextPath()%>/reviewDelete.re",
				type : "post",
				data : {review_no : num},
				success : function(data){
					if(data==1){
						alert("후기삭제 성공");
						reviewList("time");
					}else{
						alert("후기삭제 실패");
					}
				},  error : function(request,status,error){
					 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			}) 
				
		}
		
		function reviewLlstSort(){
			console.log($("input[name='re_type']:checked").val());
			var type =$("input[name='re_type']:checked").val();
			reviewList(type);
		}
		
		function reviewList(sorttype){
			$.ajax({
				url: "<%= request.getContextPath()%>/reviewList.re",
				type: "post",
				data:{
					hosting_id : $('#hosting_id').val(),
					type : sorttype
				}, success : function(data){							
					 var totalStar ="" ;
					 	
					 var $reviewArea = $('#reviewArea');
						$reviewArea.text('');
					 	$reviewArea.append('<h2> 이용후기 ('+  data.length +' 개)' +' <span style="font-size:20px;"> <span id ="total"></span> </span></h2> ' 
								+'<hr style="border :1px solid black;"/>'); 
						
					 	var total=0.0;
					
					 	for(var i = 0 ; i<data.length; i++){
						var re = data[i].review;
						var profile = data[i].userProfile;	
						var user_name =data[i].user_name;
						 total += re.re_score;
						console.log(total/data.length);
						
							 var star ="" ;
							 for( var j=1; j<=5; j++){
									if(j<=parseFloat(re.re_score)){
										star+=('<span class="fa fa-star checked"></span>');
									}else{
										star+=('<span class="fa fa-star "></span>'); 
									}	
								} 		
							 
							 
							var btn="";
							var btn1 ="";
							 <% if((m!=null && m.getUser_id().equals("admin")) ) {  %>
								btn = '<button onclick="deleteReview(this);" class="btn btn-success btn-xs" >삭제</button>';
							<%}%> 
							<% if(m!=null){%>
							 btn1 = (re.user_id)=="<%=m.getUser_id()%>" ? "<button onclick='deleteReview(this)' class='btn btn-success btn-xs' >삭제</button>" :"" ; 
							<%}%> 
							
							$reviewArea.append(
									'<div class="row " style="margin-bottom: 10px; margin-left:20px;">'
									+'<div class="col-sm-1"> '
									+'<img  class="rounded-circle review_img" src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/'+profile+'">'
									+'</div>'
									+'<div  class= "col-sm-10" style="margin-left: 30px;">'
									+' <div id="starRating" > '
									+  star 	 
									+ '<b>' + parseFloat(re.re_score)+ '</b>점'
									+ '</div>'
									+'<div style="margin-top:5px; ">'
									+'<span > <b>'+user_name+'</b></span><br />'
									+' <span >'+re.re_date+'</span>'
									+'</div>'
									+' </div>'
									+'</div>'
									+'<div class="row col-sm-12" style="margin-left:30px;">'
									+' <p>'+re.re_content+'</p>'
									+'<input type="hidden" value="'+re.review_no +'">'
									+'<div align="right">'
									+btn
									+btn1 
									+'</div>'
									+'<hr >'
									+'</div>'
									
							);
							 var str ="";
							 for( var j=1; j<=5; j++){
									if(j<=total/data.length){
										str+=('<span class="fa fa-star checked"></span>');
									}else{
										str+=('<span class="fa fa-star "></span>'); 
									}	
								} 	 
							
					}		
					 		if(data.length !=0)
							$('#total').html(str +" "+ Math.round(total/data.length*10)/10 +" / 5 점");

				}, error : function(request,status,error){
					 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
				}
			});
		}
		
		 
	 	$(function(){
			$('#re_content').keyup(function(){
				var input = $(this).val().length;
				
				var remain = 200 -input;
				
				if(remain<0){
					alert('글자 수 초과');
					$(this).val($(this).val().substring(0,200));
					input--;
				}
				
				$('#keyCounter').html(input+"/200 자");
			});
		}); 
	 	$(function(){
    		$('#m_content').keyup(function(){
    			var input = $(this).val().length;
    			
    			var remain = 200 -input;
    			
    			if(remain<0){
    				alert('글자 수 초과');
    				$(this).val($(this).val().substring(0,200));
    				input--;
    			}
    			
    			$('#keyCounter').html(input+"/200 자");
    		});
    	});

	function valueChk(){
	console.log($('#checkin').val());
	var stDateArr = $('#checkin').val().split('-');
	var endDateArr = $('#checkout').val().split('-');
	var stDate = new Date(stDateArr[0],stDateArr[1],stDateArr[2]);
	var endDate = new Date(endDateArr[0],endDateArr[1],endDateArr[2]);
	
	
		if($('#checkin').val()==""  || $('#checkout').val()==""||$('#guest_num').val()==""){			
			alert("여행계획을 알려주세요");			
		}else if($.trim($('#m_content').val())=="" || $('#m_content').val()==null){
				alert("메시지를 입력해주세요");
		}else if(stDate >endDate){
			alert('기간을 다시 확인해주세요');
		}else{
			 insert(); 
		}
     }
	
	
	/* m_receiver hosting_id checkin checkout guest_num m_content */
	function insert(){
		
		$.ajax({
			url: "<%=request.getContextPath()%>/messageSend.m",
			type : "post",
			data : {
				m_writer : $('#m_writer').val(),
				m_receiver : $('#m_receiver').val(),
				hosting_id : $('#hosting_id').val(),
				checkin : $('#checkin').val(),
				checkout : $('#checkout').val(),
				guest_num : $('#guest_num').val(),
				m_content : $('#m_content').val().replace(/[\r\n]/gim,"<br>")
				
			}, success: function(data){
				if(data==0)
					alert('전송실패');
				else{
					alert('전송완료');
					$('#m_content').val('');
					$('#messageModal').modal('hide');
					
				}
			}, error: function(data){
				console.log('에러');
			}
			
			
			
		});
		
	}
</script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
</body>
</html>