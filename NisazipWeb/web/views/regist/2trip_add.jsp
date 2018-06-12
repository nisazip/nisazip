<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
	
<%
	Trip tregist = (Trip)session.getAttribute("tregist");
%>
<!DOCTYPE html>
<html>
 <head>
 	<meta charset="UTF-8">
 	 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
    <form id="insertForm" action="<%=request.getContextPath()%>/insertAdd.trip" method="post">
    <div class="w3-main" style="margin-left:340px;margin-right:40px">

        <!-- Header -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h1 class="w3-jumbo">
                <b>트립 등록하기</b>
            </h1>
            <h1 class="w3-xxxlarge w3-text-green">
                <b>Second.</b>
            </h1>
            <hr style="width:50px;border:5px solid green" class="w3-round">
        </div>

        <!-- Photo grid (modal) -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h2 class="w3-center">
                <b>등록할 Trip의 지역 및 상세 주소를 입력해주세요!</b>
            </h2>
            <br>
            <br>
        </div>
        <div style="font-weight: bold; font-size: 29px;" class="w3-center">
            
            <ul>
                <li>회원님의 Trip의 지역은 어디인가요?</li>
                <li>
                    <div data-text-content="true" style="margin:auto; background:Lightgreen; text-align: center; font-size: 30px; width:500px;" >
                        대한민국 제주특별자치도
                    </div>
                </li>
                <br>
                <li>
                	<select name="t_area" id="t_area" style="width: 500px; height: 50px; color: gray; text-align: center;">
						<option style="color: black">지역을 선택하세요.</option>
						<option value="제주시">제주시</option>
						<option value="우도면">우도면</option>
						<option value="추자면">추자면</option>
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
					</select>
                </li>
                <br>
                <li>
                    우편번호:&nbsp;
                    <input type="text" id="zipCode" name="zipCode" >&nbsp;&nbsp;
                    <a id="btn_style" onclick="addrSearch();">검색</a>
                </li>
                <br>
                <li>
                    주소:&nbsp;
                    <input type="text" id="address1" name="address1" size="40;" style="margin-left: 59px;">
                </li>
                <br>
                <li>
                    상세주소:&nbsp;
                    <input type="text" id="address2" name="address2" size="40">
                </li>
                <br>
                <li></li>
            </ul>
            <p><h1>※ 저희 사이트는 제주도만 가능합니다. ※</h1></p>
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