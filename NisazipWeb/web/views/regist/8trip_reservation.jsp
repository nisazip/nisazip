<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
    <form action="<%=request.getContextPath()%>/insertReservation.trip" method="post">
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <h1 class="w3-jumbo">
                    <b>트립 등록하기</b>
                </h1>
                <h1 class="w3-xxxlarge w3-text-green">
                    <b>Eighth.</b>
                </h1>
                <hr style="width:50px;border:5px solid green" class="w3-round">
            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-container" style="margin-top:80px" id="showcase">

            </div>
            <div style="font-weight: bold; font-size: 29px;" class="w3-center">
                회원님의 Trip에 예약 가능 기간과 예약 종료 기간을 설정하세요.
                <p>
                    <br> 시작일 :
                    <input type="text" name="datepicker1" class="datepicker1" id="datepicker1" />
                    <br>
                    <br> 종료일 :
                    <input type="text" name="datepicker2" class="datepicker2" id="datepicker2" />
                </p>
                <a href="views/regist/7trip_introduce.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a>
                <button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
            </div>

        </div>
    </form>
    
    <script>
      $(function() {
          // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
          // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

          //시작일.
          $('.datepicker1').datepicker({
             
        	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
              dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
              changeMonth: true, 				//월변경가능
              changeYear: true, 				//년변경가능
              showMonthAfterYear: true, 		//년 뒤에 월 표시
              minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
              dateFormat: 'yy년 mm월 dd일',
              onClose: function( selectedDate ) {    
                  // 시작일(fromDate) datepicker가 닫힐때
                  // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $(".datepicker2").datepicker( "option", "minDate", selectedDate );
              }                
          });

          //종료일
          $('.datepicker2').datepicker({
        	  dateFormat: 'yy년 mm월 dd일',
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
  	</script>

    
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
</body>
</html>