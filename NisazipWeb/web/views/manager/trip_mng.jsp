<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
    <%
    ArrayList<Trip> list = (ArrayList<Trip>)(request.getAttribute("tList"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

   <title>관리자 페이지_트립관리</title>
    
</head>
<body>
 	<%@ include file="common/admin_header.jsp" %>
    <div class="container">
        <div class="row">
            <%@ include file="common/admin_menu.jsp" %>
            <h1>트립 관리</h1>
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
                <table class="table table-striped table-bordered table-hover " id="tripTable" data-toggle="modal" data-target="#myModal">
                    <thead>
	                    <tr onclick="event.cancelBubble=true">
	                        <th>트립아이디</th>
	                        <th>트립명</th>
	                        <th>호스트아이디</th>
	                        <th>최대인원</th>
	                        <th>트립유형</th>
	                        <th>사용언어</th>
	                        <th>가격</th>
	                        <th>지역</th>
	                        <th>평점</th>
	                        <th>등록일</th>
	                    </tr>
                    </thead>
                    <tbody>
                    <% for(Trip t : list){ %>
                    	<tr>
                    		<td><%=t.getT_id()%></td>
                    		<td><%=t.getT_name() %></td>
                    		<td><%=t.getHost_id() %></td>
                    		<td><%=t.getT_max_num() %></td>
                    		<td><%=t.getT_type() %></td>
                    		<td><%=t.getLanguage()%></td>
                    		<td><%=t.getPrice()%></td>
                    		<td><%=t.getT_area()%></td>
                    		<td><%=t.getScore() %></td>
                    		<td><%=t.getT_date() %></td>
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
                    <h4 class="modal-title">트립정보</h4>
                </div>
                <!-- 모달 body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group">
                            <h3>트립 등록번호</h3>
                        </div>
                        <form class="form-horizontal" role="form">
                            <div class="form-group form-group-sm form-group-xs text-center">
                                <img data-src="holder.js/200x200" alt="트립 사진" class="img">
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="tripNo" class="col-sm-3 col-xs-3">트립번호 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="tripNo" name="tripNo" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="tripName" class="col-sm-3 col-xs-3">트립이름 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="tripName" name="tripName" class="form-control udInput" disabled>
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
                                <label for="triptype" class="col-sm-3 col-xs-3">트립 종류:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="triptype" name="triptype" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="language" class="col-sm-3 col-xs-3">가능 언어:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="language" name="language" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="startTime" class="col-sm-3 col-xs-3">시작 시간:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="startTime" name="startTime" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="endTime" class="col-sm-3 col-xs-3">종료 시간:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="endTime" name="endTime" class="form-control udInput" disabled>
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
                                <label for="addr" class="col-sm-3 col-xs-3">주소:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="addr" name="addr" class="form-control udInput" disabled>
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
                                <label for="startDate" class="col-sm-3 col-xs-3 ">시작일:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="startDate" name="startDate" class="form-control udInput cgDate" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="endDate" class="col-sm-3 col-xs-3 ">마감일:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="endDate" name="endDate" class="form-control udInput cgDate" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="count" class="col-sm-3 col-xs-3">총 예약건수:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="count" name="count" class="form-control" disabled>
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
        $("#tripTable tr").click(function () {
            var str = "";
            var tdArr = new Array();
            var tr = $(this);
            var td = tr.children();
 			
          	//테이블의 첫 행을 클릭했을 때는 모달창을 띄우지 않는다.
            if(td.eq(0).text()!="트립 번호"){
				console.log(td.eq(0).text());
             $.ajax({
         		url : "getTrip.mg",
         		type: "GET",
         		data : {
         			tripNo : td.eq(0).text()
         		},success : function(data){
         			//성공했을 때 

         			//모달 안에 넣어줄 값 세팅 
         			$('#tripNo').val(data.T_ID);
                    $('#tripName').val(data.T_NAME);
                    $('#hostId').val(data.HOST_ID);
			        $('#maximum').val(data.T_MAX_NUM);
			        $('#triptype').val(data.T_TYPE);
			        $('#language').val(data.LANGUAGE);
			        $('#startTime').val(data.T_START_TIME);
			        $('#endTime').val(data.T_END_TIME);
			        $('#price').val(data.PRICE);
			        $('#detail').val(data.T_DETAIL);
			        $('#area').val(data.T_AREA);
			        $('#addr').val(data.T_ADDR);
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
        	var $cgDate = $('.cgDate');
            
        	$update.attr("disabled",false);/* 
            $cgDate.attr("type","date"); */
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
        	var $cgDate = $('.cgDate');
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

    </script>
    
    <footer>
    	<div>
    		footer 영역 
    	</div>
    </footer>
</body>

</html>