<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.*, kh.manager.model.vo.*, java.util.*"%>
    
    <%
    ArrayList<Room> list =null;
    PageInfo pi = null;
    int listCount =0;
    int currentPage = 0;
    int maxPage = 0;
    int startPage = 0;
    int endPage =0;

    String keyword = "";
    String condi = "";

    if(request.getAttribute("rList")!=null){
    	
    	list = (ArrayList<Room>)request.getAttribute("rList");
    	pi = (PageInfo)request.getAttribute("pi");
    	listCount = pi.getListCount();
    	currentPage = pi.getCurrentPage();
    	maxPage = pi.getMaxPage();
    	startPage = pi.getStartPage();
    	endPage = pi.getEndPage();
    	
    	keyword = (String)request.getAttribute("keyword");
    	condi = (String)request.getAttribute("condi");
    }
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
	                 <div class="form-row align-items-center">
	                  <div class="col-auto my-1">
  						<select class="mr-sm-2 form-control" id="searchCondition">
	     					<option selected>선택하기</option>
					        <option value="rName">숙소명 검색</option>
	     					<option value="rHostId">호스트 아이디로 검색</option>
	     					<option value="rArea">지역으로 검색</option>
	      				</select>
		      		  </div>
		      		 </div>
	                </div>
	                <div class="col-xs-8 col-sm-6">
	                    <div class="input-group">
	                        <input type="search" class="form-control" placeholder=" 검색 하기 " id="keyword" onkeyup="enterKey();">
	                        <span class="input-group-btn">
	                        	
	                            <button class="btn btn-secondary" type="button" onclick="search();">검색</button>
	                        </span>
	                    </div>
	                </div><br><br><br>
				</div>
				 <!-- 검색 끝 --> 
				 <div>
					<p>총 숙소 수(<%=listCount%>)</p>
				</div>
				<!--테이블 영역 -->
				<div class="table-responsive">
				<% if( list!=null) {%>
                <table class="table table-striped table-bordered table-hover " id="roomTable" data-toggle="modal" data-target="#myModal">
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
                
                 <%}else{ %>
                      <div><p class="text-center">트립이 없습니다. <br/>
                      		새로운 트립을 등록하거나 검색조건을 확인해 주세요</p>
                      </div>
                   <% } %>
                </div>
                <!-- 페이징처리할 부분 -->
	            <nav aria-label="Page navigation example" style="text-align: center">
	             	<ul class="pagination justify-content-center">
					
					<!-- 가장 첫 페이지로 이동 -->
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/roomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=1'">처음</a>
					</li>
					<!-- 한페이지 씩 앞으로 이동 -->
					<% if(currentPage <= 1){ %>
					<li class="page-item disabled">
						<a>&lt;</a>
					</li>					
					<% }else{ %>
					<li class="page-item ">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/roomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage -1%>'">&lt;</a>
					</li>
					<% }%>
					
					<!-- 각 페이지 별 리스트 작성 -->
					<% for(int i = startPage;i<=endPage;i++){ %>
						<% if(i == currentPage) { %>
						<li class="page-item active">
							<a><%=i %></a>
						</li>	
						<% } else{ %>
						<li class="page-item">
							<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/roomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=i %>'"><%=i %></a>
						</li>	
						<% } %>
					<% } %>
					
					<!-- 한페이지 씩 뒤로 이동 -->
					<% if(currentPage >= maxPage){ %>
					<li class="page-item disabled">
						<a>&gt;</a>
					</li>	
					<% }else{ %>
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/roomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage +1%>'">&gt;</a>
					</li>
					<% }%>
					
					<!-- 가장 마지막 페이지로 이동 -->
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/roomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=maxPage%>'">마지막</a>
					</li>	
	
					</ul>
				</nav>
				
				<!-- 페이징 끝 --> 
                
                
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
                            <div class="form-group form-group-sm form-group-xs ">
                                <label for="area" class="col-sm-3 col-xs-3">지역:</label>
                                <div class="col-sm-9 col-xs-9">
                                <select id="area" name="area" class="form-control udInput text-center" disabled>
				                  <option value="지역선택" style="color: black">지역 선택</option>
				                  <option value="제주시">제주시</option>
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
				                  <option value="우도면">우도면</option>
				                  <option value="추자면">추자면</option>
				               </select>
                                    <!-- <input type="text" id="area" name="area" class="form-control udInput" disabled> -->
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
                        <button type="button" class="btn btn-danger" id="deleteRoom">삭제하기</button>
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

    $(function(){
    	//검색 시 keyword 올려 놓기
    	<%if(keyword != null){%>
    		$('#keyword').val('<%=keyword%>');
    	<%}%>
    	
    	<%if(condi != null){%>
		$('#searchCondition').val('<%=condi%>');
		<%}%>
    	
    	
    });
    //검색
    function search(){
    	if($('#keyword').val()!=null && $('#keyword').val()!=" "){
    		location.href='<%=request.getContextPath()%>/roomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val();
    	}else{
    		alert("검색어를 입력하세요");
    	}
	}
    //엔터키 검색
    function enterKey(){
		if(window.event.keyCode == 13){
			search();
		}
	}
    
    //테이블 hover 효과 지정
    $('#roomTable td').mouseenter(function(){
		$(this).parent().css({
			"background":"darkgray",
			"cursor" : "pointer"	
		});
	}).mouseout(function(){
		$(this).parent().removeAttr("style");
	});

    
        //테이블을 클릭했을 때 실행할 이벤트
        $("#roomTable tr").click(function () {
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
            		$('#roomNo').val(data.R_ID);
                    $('#roomName').val(data.R_NAME);
                    $('#hostId').val(data.HOST_ID);
   			        $('#maximum').val(data.R_MAX_NUM);
   			        $('#roomtype1').val(data.R_TYPE);
   			        $('#roomtype2').val(data.R_TYPE2);
   			        $('#rOption').val(data.R_OPTION);
   			        $('#rRoomNum').val(data.ROOM_NUM);
   			        $('#rBathNum').val(data.TOILET_NUM);
   			        $('#rBedNum').val(data.BED_NUM);
   			        $('#detail').val(data.R_DETAIL);
   			 	    $('#rRole').val(data.R_ROLE);
   			  		$('#price').val(data.PRICE);
		   			$('#area').val(data.R_AREA);
		   			
		   		 	var addr = data.R_ADDR.split('| ');
			        $('#zipCode').val(addr[0]);
			        $('#address1').val(addr[1]);
			        $('#address2').val(addr[2]);
		   			$('#rating').val(data.SCORE);
		   			
		   			
		   		 	var sDate = data.R_START_DATE.split(', ');
			        $('#startDate').attr("value",sDate[0]+'-'+sDate[1]+'-'+sDate[2]);
			        
			        var eDate = data.R_END_DATE.split(', ');
			        $('#endDate').attr("value",eDate[0]+'-'+eDate[1]+'-'+eDate[2]);
			        
			        var rDate = data.R_DATE.split(', ');
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
            
            }).hover(function(){
            	$(this).parent().css({
    				"background":"snow",
    				"cursor" : "pointer"	
    			});
            });
        
        $('#saveData').hide();
        
      	//모달 - 삭제하기 버튼
        $('#deleteRoom').click(function(){
        	if (confirm("정말 삭제하시겠습니까??") == true){//확인
        		location.href="<%=request.getContextPath()%>/deleteRoom.mg?roomNo="+$('#roomNo').val();
        	}else{//취소
        	    return;
        	}
        });
        
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
        	if (confirm("변경한 숙소 정보를 저장하시겠습니까??") == true){//확인
        		$.ajax({
            		url : "upRoom.mg",
            		type:"POST",
            		data:{
            			roomNo : $('#roomNo').val(),
            			roomName : $('#roomName').val(),
            			maximum : $('#maximum').val(),
            			roomtype1 : $('#roomtype1').val(),
            			roomtype2 : $('#roomtype2').val(),
            			rOption : $('#rOption').val(),
            			rRoomNum : $('#rRoomNum').val(),
            			rBathNum : $('#rBathNum').val(),
            			rBedNum : $('#rBedNum').val(),
            			detail : $('#detail').val(),
            			rRole : $('#rRole').val(),
            			price : $('#price').val(),
            			area : $('#area').val(),

            			address : $('#zipCode').val()+"| "+$('#address1').val()+"| "+$('#address2').val(),
            			startDate : $('#startDate').val(),
            			endDate : $('#endDate').val()
            			
            		}, success : function(data){
            			alert(data);
            			
            		}, error : function(request, status, error){
        				// 연결에 실패했을 때
        				console.log("에러 코드 : "+request.status
        						+ "에러 내용 : "+ request.responseText 
        						+ "에러 메시지 : " + error);
        				
        				alert("데이터 전달 실패");
        				
        			}
            		
            	})
        	
            $('#myModal input').attr("disabled",true);
			$('#area').attr("disabled",true);
            $('#modify').show();
            $(this).hide();
            
        	} else {//취소
        	    return;
        	}
        });
	
        $('#home_btn').click(function(){
        	location.href="<%=request.getContextPath()%>/views/manager/admin_home.jsp";
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