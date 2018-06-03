<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.*, java.util.*"%>
    <%
    ArrayList<Room> list = (ArrayList<Room>)(request.getAttribute("rList"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 다음 주소 검색 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

   <title>관리자 페이지_숙소관리</title>
    
</head>
<body>
 	<%@ include file="common/admin_header.jsp" %>
    <div class="container">
        <div class="row">
            <%@ include file="common/admin_menu.jsp" %>
            <h1>숙소 관리</h1>
            <hr />
            <!-- 본문  -->
            <div class="col-sm-10">

				<!-- 검색 영역 -->
                <div class="col-xs-4 col-sm-2">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							-- 선택  -- <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="" id="sId">지역으로 찾기</a></li>
                            <li><a href="" id="sName">이름으로 찾기</a></li>
                        </ul>
                    
                    </div>
                </div>
                <div class="col-xs-8 col-sm-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="지역으로 검색...">
                        <span class="input-group-btn">
                            <button class="btn btn-secondary" type="button">검색</button>
                        </span>
                    </div>
                </div><br><br><br>
				
				<!--테이블 영역 -->
				<div class="table-responsive">
                <table class="table table-striped table-bordered table-hover " id="userTable" data-toggle="modal" data-target="#myModal">
                    <thead>
	                    <tr onclick="event.cancelBubble=true">
	                        <th>숙소아이디</th>
	                        <th>숙소명</th>
	                        <th>호스트아이디</th>
	                        <th>최대인원</th>
	                        <th>숙소종류</th>
	                        <th>숙소유형</th>
	                        <th>가격</th>
	                        <th>지역</th>
	                        <th>평점</th>
	                        <th>등록일</th>
	                    </tr>
                    </thead>
                    <tbody>
                    <% for(Room r : list){ %>
                    	<tr>
                    		<td><%=r.getR_id()%></td>
                    		<td><%=r.getR_name() %></td>
                    		<td><%=r.getHost_id() %></td>
                    		<td><%=r.getR_max_num() %></td>
                    		<td><%=r.getR_type() %></td>
                    		<td><%=r.getR_type2()%></td>
                    		<td><%=r.getPrice()%></td>
                    		<td><%=r.getR_area()%></td>
                    		<td><%=r.getScore() %></td>
                    		<td><%=r.getR_date() %></td>
                    	</tr>
                    <% } %>	
                    </tbody>
                </table>
                </div>
            </div>
        </div>

    </div>
    <!-- 컨테이너 끝 --> 
       
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" id="close2">&times;</button>
                    <h4 class="modal-title">숙소정보</h4>
                </div>
                <!-- 모달 body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group">
                            <h3>숙소 등록번호</h3>
                        </div>
                        <form class="form-horizontal" role="form">
                            <div class="form-group form-group-sm form-group-xs text-center">
                                <img data-src="holder.js/200x200" alt="숙소 사진" class="img">
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="roomNo" class="col-sm-3 col-xs-3">숙소번호 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="roomNo" name="roomNo" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="roomName" class="col-sm-3 col-xs-3">숙소이름 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="roomName" name="roomName" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="hostId" class="col-sm-3 col-xs-3">호스트아이디 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="email" id="hostId" name="hostId" class="form-control" disabled>
                                </div>  
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="maximum" class="col-sm-3 col-xs-3">최대인원 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="maximum" name="maximum" class="form-control udInput" disabled>
                                </div>
                            </div>

                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="roomtype1" class="col-sm-3 col-xs-3">숙소 종류:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="roomtype1" name="roomtype1" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="roomtype2" class="col-sm-3 col-xs-3">숙소 유형:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="roomtype2" name="roomtype2" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="rOption" class="col-sm-3 col-xs-3">숙소 옵션:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="rOption" name="rOption" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                            	<div class="col-sm-4 col-xs-4">
	                                <label for="rRoomNum" class="col-sm-6 col-xs-6">침실:</label>
	                                <div class="col-sm-6 col-xs-6">
	                                    <input type="number" id="rRoomNum" name="rRoomNum" class="form-control udInput" disabled>
	                                </div>
                                </div>
                                <div class="col-sm-4 col-xs-4">
	                                <label for="rBathNum" class="col-sm-6 col-xs-6">화장실:</label>
	                                <div class="col-sm-6 col-xs-6">
	                                    <input type="number" id="rBathNum" name="rBathNum" class="form-control udInput" disabled>
	                                </div>
                                </div>
                                <div class="col-sm-4 col-xs-4">
	                                <label for="rBedNum" class="col-sm-6 col-xs-6">침대:</label>
	                                <div class="col-sm-6 col-xs-6">
	                                    <input type="number" id="rBedNum" name="rBedNum" class="form-control udInput" disabled>
	                                </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="rRole" class="col-sm-3 col-xs-3">숙소 룰:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="rRole" name="rRole" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="detail" class="col-sm-3 col-xs-3">상세소개:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="detail" name="detail" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="price" class="col-sm-3 col-xs-3">가격 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="price" name="price" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="area" class="col-sm-3 col-xs-3">지역:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="area" name="area" class="form-control udInput" disabled>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="zipCode" class="col-sm-3 col-xs-3">우편 번호:</label>
                                <div class="col-sm-3 col-xs-3">
                                    	<input type="text" id="zipCode" name="zipCode" class="form-control udInput" disabled>
                                </div>
                                <div class="col-sm-3 col-xs-3">
                                    	<button type="button" id="ckZip" onclick="addrSearch();"class=" btn btn-primary udInput" disabled>검색</button>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="address1" class="col-sm-3 col-xs-3">주소:</label>
                                <div class="col-sm-9 col-xs-9">
                                    	<input type="text" id="address1" name="address1" class="form-control udInput" disabled>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="address2" class="col-sm-3 col-xs-3">상세 주소:</label>
                                <div class="col-sm-9 col-xs-9">
                                    	<input type="text" id="address2" name="address2" class="form-control udInput" disabled>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="startDate" class="col-sm-3 col-xs-3">시작일:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="startDate" name="startDate" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="endDate" class="col-sm-3 col-xs-3">마감일:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="endDate" name="endDate" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="rating" class="col-sm-3 col-xs-3">평점:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="rating" name="rating" class="form-control" disabled>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="regiDate" class="col-sm-3 col-xs-3">등록일:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="regiDate" name="regiDate" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="count" class="col-sm-3 col-xs-3">총 예약건수:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="count" name="count" class="form-control" disabled>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
                <!-- 모달 footer -->
                <div class="modal-footer">
                    <div class="pull-left">
                        <button type="button" class="btn btn-danger">삭제하기</button>
                    </div>
                    <div>
                        <button type="button" class="btn btn-primary" id="modify">수정하기</button>
                        <button type="button" class="btn btn-primary" id="saveData" >저장하기</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 모달 끝 -->
    
    <script>
    
    //테이블 hover 효과 지정
    $('#userTable td').mouseenter(function(){
		$(this).parent().css({
			"background":"darkgray",
			"cursor" : "pointer"	
		});
	}).mouseout(function(){
		$(this).parent().removeAttr("style");
	});

    
        //테이블을 클릭했을 때 실행할 이벤트
        $("#userTable tr").click(function () {
            var str = "";
            var tdArr = new Array();
            var tr = $(this);
            var td = tr.children();
 
            /*
             //데이터값을 받아 배열에 담음 
             // ## 필요하지는 않음
             td.each(function (i) {
                 tdArr.push(td.eq(i).text());
             });
             console.log("데이터 값 : " + tdArr);
            */

            //테이블의 첫 행을 클릭했을 때는 모달창을 띄우지 않는다.
            if(td.eq(0).text()!="숙소 번호"){
            	console.log(td.eq(0).text());
            	
            	//모달 안에 넣어줄 값 세팅
            	$.ajax({
            		url : "getRoom.mg",
            		type: "GET",
            		data : {
            			roomNo : td.eq(0).text()
            		},success : function(data){
            			//성공했을 때 

            		//모달 안에 넣어줄 값 세팅 
            		$('#tripNo').val(data.R_ID);
                    $('#tripName').val(data.R_NAME);
                    $('#hostId').val(data.HOST_ID);
   			        $('#maximum').val(data.R_MAX_NUM);
   			        $('#triptype').val(data.R_TYPE);
   			        $('#language').val(data.R_TYPE2);
   			        $('#startTime').val(data.R_OPTION);
   			        $('#endTime').val(data.ROOM_NUM);
   			        $('#price').val(data.TOILET_NUM);
   			        $('#detail').val(data.BED_NUM);
   			        $('#area').val(data.T_DETAIL);
   			 	    $('#area').val(data.R_ROLE);
   			  		$('#area').val(data.PRICE);
		   			$('#area').val(data.R_AREA);
		   			$('#area').val(data.R_ADDR);
		   			$('#area').val(data.R_START_DATE);
		   			$('#area').val(data.R_END_DATE);
		   			$('#area').val(data.SCORE);
		   			$('#area').val(data.R_DATE);
		   			$('#area').val(data.RCNT);
		   			
   			

   			         
   			        var addr = data.T_ADDR.split('| ');
   			        $('#zipCode').val(addr[0]);
   			        $('#address1').val(addr[1]);
   			        $('#address2').val(addr[2]);
   			        
   			        $('#rating').val(data.SCORE);
   			        
   			        var sDate = data.T_START_DATE.split(', ');
   			        $('#startDate').attr("value",sDate[0]+'-'+sDate[1]+'-'+sDate[2]);
   			        
   			        var eDate = data.T_END_DATE.split(', ');
   			        $('#endDate').attr("value",eDate[0]+'-'+eDate[1]+'-'+eDate[2]);
   			        
   			        var rDate = data.T_END_DATE.split(', ');
   			        $('#regiDate').attr("value",rDate[0]+'-'+rDate[1]+'-'+rDate[2]);
   			        
   			        $('#count').val(data.RCNT);
   			      
            		}, error : function(request, status, error){
       				// 연결에 실패했을 때
       				console.log("에러 코드 : "+request.status
       						+ "에러 내용 : "+ request.responseText 
       						+ "에러 메시지 : " + error);
       				
       				alert("데이터 전달 실패");
       			}
            	});
            }
            
            });
        
        $('#saveData').hide();
        
        //모달 - 수정하기 버튼
        $('#modify').click(function(){
        	var $update = $('.udInput');
        	$update.attr("disabled",false);
            $('#saveData').show();
            $(this).hide();
        });

        //모달 - 취소 버튼
        $('#close').click(function(){
        	$('#myModal input').attr("disabled",true);
        	$('#saveData').hide();
        	$('#modify').show()
        });
        
      	//모달 - 취소 버튼
        $('#close2').click(function(){
        	$('#myModal input').attr("disabled",true);
        	$('#saveData').hide();
        	$('#modify').show()
        });
        
        //모달 - 저장하기 버튼
        $('#saveData').click(function(){
            $('#myModal input').attr("disabled",true);
            $('#modify').show();
            $(this).hide();
        });
	
        //dropdown menu
        $('#sId').click(function(){
                        console.log($(this).parent());
                        $('#sName').parent().removeClass('active');
                        $(this).parent().addClass('active');
        });
        $('#sName').click(function(){
            console.log($(this).parent());
            $('#sId').parent().removeClass('active');
            $(this).parent().addClass('active');
        });
        
        
        $('#home_btn').click(function(){
        	location.href="admin_home.jsp";
        });
        
     // 주소 검색
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

    </script>
    
    <footer>
    	<div>
    		footer 영역 
    	</div>
    </footer>
</body>

</html>