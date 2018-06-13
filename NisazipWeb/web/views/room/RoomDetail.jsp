<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, kh.room.model.vo.*"%>
<%
	Room r = (Room)request.getAttribute("room");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
/* .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1} */
</style>
<body>

      <%@ include file="../common/header.jsp" %>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large w3-padding" style="z-index:0;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>네가 사는</b><br><b>그집</b></h3>
  </div>
  <div class="w3-bar-block">
    
    <a href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp" class="w3-bar-item w3-button w3-hover-white">숙소 등록하기</a>  
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">등록 숙소 보기</div> 
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Rstatistics.no'">통계 페이지</div>
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomReservationList.no'">등록 숙소 예약자 명단</div> 
</div>
</nav>

    <h1 class="w3-center" style="font-size: 38pt; margin-right: 470px;"><b><i> 등록 숙소 정보</i></b></h1>
    <h1 class="w3-center" style="font-size: 38pt; margin-right: 470px;margin-top: 100px;"><b><i> 등록 숙소 정보</i></b></h1>
    <h5 class="w3-center" style="margin-right: 470px; color: red; "><b><i>내용 수정을 원하시면 내용 수정후 하단 수정하기 버튼을 눌러주세요!<br>
    	단! 주소는 변경 불가 합니다!!<br>
    	모든 내용을 입력해주셔야 정확한 수정이 가능합니다.</i></b><br />
	</h5>	


<form id="updateForm" action="" method="post" style="margin-right: 470px;" encType="multipart/form-data">
<div class="w3-container" style="margin-top:80px">
    <%-- <img style="margin-left: 300px;" name="R_PIC" src="<%=request.getContextPath() %>/resources/thumbnail_uploadFiles/<%=r.getR_pic()%>"/>  
    <img name="R_PIC2" src="<%=request.getContextPath() %>/resources/thumbnail_uploadFiles/<%= r.getR_pic2() %>"/>
	<img name="R_PIC3" src="<%=request.getContextPath() %>/resources/thumbnail_uploadFiles/<%= r.getR_pic3() %>"/> --%>
	<table border="1" style="margin-left:300px; width:1000px;">
				<tr>
					<td style="width:400px; background:lightgreen;">대표 사진</td>
					<td style="width:300px; background:lightgreen;">서브 사진</td>
					<td style="width:300px; background:lightgreen;">서브 사진2</td>
				</tr>
				<tr>
					<td colspan="1" style="height:400px;">
						<div id="titleImgArea1" >
							<img id="titleImg" name="R_PIC" width="400px;" height="400px;" src="<%=request.getContextPath() %>/resources/room_images/<%=fileList.get(0).getChange_name()%>"> 
						</div>
					</td>
					<td>
						<div id="contentImgArea2">
							<img id="contentImg1" name="R_PIC2" width="300px;" height="400px;" src="<%=request.getContextPath() %>/resources/room_images/<%=fileList.get(1).getChange_name()%>">
						</div>
					</td>
					<td>
						<div id="contentImgArea3">
							<img id="contentImg2" name="R_PIC3" width="300px;" height="400px;" src="<%=request.getContextPath() %>/resources/room_images/<%=fileList.get(2).getChange_name()%>">
						</div>
					</td>
				</tr> 
			</table>
	<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
	</div>
    <h2 class="w3-center"><b>숙소 이름 :</b>&nbsp;&nbsp;<input type="text" placeholder="수정할 이름을 입력하세요." name="R_NAME" value="<%=r.getR_name()%>"></h2><br>
    <h2 class="w3-center"><b>등록 일자 :</b>&nbsp;&nbsp;<input type="text" value="<%=r.getR_date()%>"></h2><br>	
    <h2 class="w3-center"><b>최대 인원 :</b>&nbsp;&nbsp;<input type="number" min="1" placeholder="수정할 인원수를 입력하세요." name="R_MAX_NUM" value="<%=r.getR_max_num()%>"></h2>   <br> 
    <h2 class="w3-center"><b>침실 수 :</b>&nbsp;&nbsp;<input type="number" min="1" placeholder="수정할 침실수를 입력하세요." name="ROOM_NUM" value="<%=r.getRoom_num()%>"></h2>  <br>
    <h2 class="w3-center"><b>침대 수 :</b>&nbsp;&nbsp;<input type="number" min="1" placeholder="수정할 침대수를 입력하세요." name="BED_NUM" value="<%=r.getBed_num() %>"></h2><br>
    <h2 class="w3-center"><b>욕실 수 :</b>&nbsp;&nbsp;<input type="number" min="1" placeholder="수정할 욕실수를 입력하세요." name="TOILET_NUM" value="<%=r.getToilet_num()%>"></h2><br>
    <h2 class="w3-center"><b>숙소 설명 :</b>&nbsp;&nbsp;<br><textarea name="R_DETAIL" id="" cols="35" rows="2" placeholder="수정할 내용을 입력하세요."><%=r.getR_detail() %></textarea></h2><br>
      <h2 class="w3-center"><b>숙소 규칙 :</b><br>
        <div id="pre_set" style="display:none">
    	<input type="text" name="R_RULE" style="width:400px;" placeholder="체크인 시간은  OO시 입니다." value="">
    	<input type="button" value="삭제" onclick="remove_item(this)">
		</div>
		<div id="field"></div>
 		<input type="button" value=" 추가 " onclick="add_item()"><br><br />
        </h2><br>
          
    <h2 class="w3-center"><b>편의시설 :<br>
    	<input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="WIFI"><label for="WIFI">&nbsp;WIFI</label>&nbsp; 
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="헤어드라이어"><label for="헤어드라이어">&nbsp;헤어드라이어</label> &nbsp;
   		<input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="TV"> <label for="TV">&nbsp;TV</label>&nbsp;
   		<input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="건조기"><label for="건조기">&nbsp;건조기</label><br>
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="다리미"><label for="다리미">&nbsp;다리미</label>&nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="주방"><label for="주방">&nbsp;주방</label> &nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="세탁기"><label for="세탁기">&nbsp;세탁기</label> &nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="에어컨"><label for="에어컨">&nbsp;에어컨</label><br>
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="난방"><label for="난방">&nbsp;난방</label>&nbsp; 
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="주차장"><label for="주차장">&nbsp;주차장</label> &nbsp;
        <input type="checkbox" style="transform: scale(2)" name="R_OPTION" value="간단한 세면도구"><label for="간단한 세면도구">&nbsp;간단한 세면도구</label><br> 
    <h2 class="w3-center"><p>
                    <br> <b>시작일 :</b>
                    <input type="text" name="R_START_DATE" class="datepicker1" id="datepicker1" value="<%=r.getR_start_date() %>" />
                    <br>
                    <br> <b>종료일 :</b>
                    <input type="text" name="R_END_DATE" class="datepicker2" id="datepicker2" value="<%=r.getR_end_date() %>" />
                </p></h2><br>
    <h2 class="w3-center"><b>가격 :</b>&nbsp;&nbsp;<input name="PRICE" type="number" value="<%=r.getPrice() %>" placeholder="수정할 가격(1박 당)을 입력하세요."></h2><br>
        지역:&nbsp;<input type="text" name="R_LOC" value="<%=r.getR_loc()%>" readonly><br /><br />
        주소:&nbsp;<input type="text" id="zipCode" name="zipCode" readonly size="40" style="margin-left: 335px;"><br /><br />
    <!-- <div id="ckZip" onclick="addrSearch();">검색</div><br> -->
        <input type="text" id="address1" name="address1" size="40;" style="margin-left: 420px;" readonly> <br><br>
       	<!-- <b style="margin-left: 300px;">상세주소 :</b><input type="text" id="address2" name="address2" size="40" readonly> <br><br> -->
        
    <%-- <button onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">목록으로 돌아가기</button> --%>
	<button style="background: green; color: white;" onclick="complete()">수정하기</button>
	<button style="background: green; color: white;" onclick="deleteRoom()">삭제하기</button>
	<button style="background: green; color: white;" onclick="ViewRoom()">고객화면용</button>
</div>
</form>

<script>

$(function(){
	$("#fileArea").hide();
		
	$("#titleImgArea1").click(function(){
		$("#thumbnailImg1").click();
	});
	$("#contentImgArea2").click(function(){
		$("#thumbnailImg2").click();
	});
	$("#contentImgArea3").click(function(){
		$("#thumbnailImg3").click();
	});
});

function LoadImg(value, num) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			switch(num){
			case 1:
				$("#titleImg").attr("src", e.target.result);
				break;
			case 2:
				$("#contentImg1").attr("src", e.target.result);
				break;
			case 3:
				$("#contentImg2").attr("src", e.target.result);
				break;
			}
		}
		reader.readAsDataURL(value.files[0]);
	}
}

$(function(){
	var addr = '<%=r.getR_addr()%>'.split('| ');
	$('#zipcode').val(addr[0]);
	$('#address1').val(addr[1]);
	$('#address2').val(addr[2]);
});


		function complete(){
		$('#updateForm').attr("action","<%=request.getContextPath()%>/roomUpdate.no?num=<%=r.getR_id()%>");
		}
		function deleteRoom(){
		$('#updateForm').attr("action","<%=request.getContextPath()%>/deleteRoom.no?num=<%=r.getR_id()%>");
		}
		function ViewRoom(){
		$('#updateForm').attr("action","<%=request.getContextPath()%>/ViewRoom.no?num=<%=r.getR_id()%>");
		}

function add_item(){
    // pre_set 에 있는 내용을 읽어와서 처리..
    var div = document.createElement('div');
    div.innerHTML = document.getElementById('pre_set').innerHTML;
    document.getElementById('field').appendChild(div);
}

function remove_item(obj){
    // obj.parentNode 를 이용하여 삭제
    document.getElementById('field').removeChild(obj.parentNode);
	}	
/* function updateMember() {
	$("#updateForm").submit();
	} */
	$(function() {
		var advantageArr = '<%=r.getR_option()%>'.split(', ');
		console.log(advantageArr);
	$('input:checkbox').each(function(){
		if($.inArray($(this).val(),advantageArr) > -1)
		$(this).prop('checked', true);
		 // console.log($(this).val()+" : "+ $.inArray($(this).val(),advantageArr));
		});	
	var addressArr = '<%= r.getR_addr()%>'.split('| ');
		$('#zipCode').val(addressArr[0]);
		$('#address1').val(addressArr[1]);
		$('#address2').val(addressArr[2]);
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
    
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
    <!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
</body>
</html>