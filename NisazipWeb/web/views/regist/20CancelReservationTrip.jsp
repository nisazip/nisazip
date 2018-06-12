<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
	
<%
	
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
    <form id="insertForm" action="<%=request.getContextPath()%>/insertAdd.trip" method="post">
    <div class="w3-main" style="margin-left:340px;margin-right:40px">

        <!-- Header -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h1 class="w3-jumbo">
                <b>예약 취소하기</b>
            </h1>
            <hr style="width:50px;border:5px solid green" class="w3-round">
        </div>

        <!-- Photo grid (modal) -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h2 class="w3-center">
                <b>Trip의 예약 취소를 위해 정보를 입력하세요!</b>
            </h2>
            <br>
            <br>
        </div>
        <div style="font-weight: bold; font-size: 29px;" class="w3-center">
            
            <ul>
                <li>회원님의 예약을 취소할 Trip의 정보를 확인하세요.</li>
                <li>
                    <div>Trip Title : TRIPS : T_NAME</div>
                </li>
                <br>
                <li>
                	<div>HOST Name: TRIPS : HOST_ID(= MEMBER : HOST_NAME)</div>
                </li>
                <br>
                <li>
					<div>총 가격 : T_RESERVATION : TOTAL_PRICE</div>
                </li>
				<br>
				<li>
					<div>신청 일자 : T_RESERVATION : T_DATE </div>
				</li>
				<br>
            </ul>
           
            <br>
            <a href="<%=request.getContextPath() %>/views/regist/1trip_name.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a>
            <button type="submit" id="btn_style1" class="w3-padding-large w3-button w3-center">다음단계</button>
        </div>
        </div>
        </form>
        
        <script>
        	 $(function(){
         		$("#btn_style1").click(function(event){
         			var tripArea = $('#t_area').val();
         			var zipCode = $('#zipCode').val();
         			var address1 = $('#address1').val();
         			var address2 = $('#address2').val();
         			
         			// alert("tripArea : " + tripArea)
         		 	if(tripArea == "지역을 선택하세요." || zipCode == "" || address1 == "" || address2 == ""){
         		 		alert("값을 모두 입력하세요.");
     	        	} else {
   					 	return true;
    				}
         			event.preventDefault();
         		})
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

            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }

            // Modal Image Gallery
            function onClick(element) {
                document.getElementById("img01").src = element.src;
                document.getElementById("modal01").style.display = "block";
                var captionText = document.getElementById("caption");
                captionText.innerHTML = element.alt;
            }
            
           
        </script>



</body>

</html>