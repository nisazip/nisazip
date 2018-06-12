<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
<%
	Trip tregist = (Trip)session.getAttribute("tregist");
%>
    <% String tno =  (String)session.getAttribute("tno"); %>
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
    <form action="<%=request.getContextPath()%>/insertPrice.trip" method="post">
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <h1 class="w3-jumbo">
                    <b>트립 등록하기</b>
                </h1>
                <h1 class="w3-xxxlarge w3-text-green">
                    <b>Tenth.</b>
                </h1>
                <hr style="width:50px;border:5px solid green" class="w3-round">
            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
               <!-- ㄴㄴ -->
            </div>
            <div style="font-weight: bold; font-size: 29px;" class="w3-center">
                <div>
                    <h2>당신의 Trip의 가격을 책정하세요!</h2><br>
                    <input type="number" id="price" name="price" id="numberComma" onkeyup="comma(this)" placeholder="￦" style="text-align:right;"><br><br>
                    <div>책정한 가격을 확인하세요!!</div>
                    <div class="result" id="regResult2" style="margin:auto; width:300px; height:50px; border:1px solid red;"></div>
                    <br>
                    <input type="hidden" name="tno" value=<%=tno%> ></input>
                </div>
                <a href="<%= request.getContextPath() %>/views/regist/9trip_picture.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a>
                <button type="submit" id="btn_style1" class="w3-padding-large w3-button w3-center">등록하기</button>
            </div>

        </div>
    </form>
     <script type="text/javascript">
	     $(function(){
				$("#btn_style1").click(function(event){
					var price = $('#price').val();
					
					// alert("introduce : " + introduce);
					if(price == ""){
			        	alert("My Trip에 대한 가격을 설정해주세요.");
			    
					} else {
						 return true;
					}
					event.preventDefault();
				})
			});
         function comma(obj) {

            var commaNum = obj.value;
            var regResult = document.getElementById('regResult2');
            // hint
            // \B'ABC' : 'ABC'로 시작하지 않는 것을 찾는다.
            // (?='ABC') : Positive lookahead (긍정형 전방 탐색)
            //   'ABC'를 찾되 'ABC' 전까지만 찾아라 라는 뜻이다.
            // (?!'ABC') : Nagative lookahead (부정형 전방 탐색)
            //   'ABC'가 아닌 것을 찾되 앞의 특수한 형식을 맞춰서 찾아라 라는 뜻이다.

            regResult.innerHTML = commaNum.replace(/\B(?=(\d{3})+(?!\d))/gm, ",") + "원";
         }
    </script>
</body>
</html>