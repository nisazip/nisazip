<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.manager.model.vo.*, java.util.*"%>
    
<%
	ArrayList<MemberList> list = (ArrayList<MemberList>)request.getAttribute("mList");
	/* 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCont = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

   <title>관리자 페이지_회원관리</title>
    
</head>
<body>
 	
	<%@ include file="common/admin_header.jsp" %>
    <div class="container">
        <div class="row">
            <%@ include file="common/admin_menu.jsp" %>
            <h1>회원 관리</h1>
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
                            <li><a href="" id="sId">아이디로 찾기</a></li>
                            <li><a href="" id="sName">이름으로 찾기</a></li>
                        </ul>
                    
                    </div>
                </div>
                <div class="col-xs-8 col-sm-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="아이디로 검색...">
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
	                        <th>회원 번호</th>
	                        <th>아이디</th>
	                        <th>이름</th>
	                        <th>연락처</th>
	                        <th>성별</th>
	                        <th>생년월일</th>
	                        <th>숙소 호스팅</th>
	                        <th>트립 호스팅</th>
	                        <th>신분증 인증</th>
	                        <th>가입일</th>
	                        <th>신고</th>
	                    </tr>
                    </thead>
                    <tbody>
                    
                    <% for(MemberList m : list){ %>
					<tr>
						<td><%=m.getUser_no()%></td>
						<td><%=m.getUser_id()%></td>
						<td><%=m.getUser_name() %></td>
						<td><%=m.getPhone() %></td>
						<td><%=m.getGender() %></td>
						<td><%=m.getBirthdate() %></td>
						<td><%=m.getR_hosting() %></td>
						<td><%=m.getT_hosting() %></td>
						<td><%=m.getOauth() %></td>
						<td><%=m.getJoin_date() %></td>
						<td><%=m.getrCnt() %></td>
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
                    <h4 class="modal-title">회원 관리</h4>
                </div>
                <!-- 모달 body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group">
                            <h3>회원 상세 정보</h3>
                        </div>
                        <form class="form-horizontal" role="form" >
                            <div class="form-group form-group-sm form-group-xs text-center">
                                <img data-src="holder.js/140x140" alt="프로필 사진" class="img-circle">
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="userNo" class="col-sm-3 col-xs-3">회원번호 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="email" id="userNo" name="userNo" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="userId" class="col-sm-3 col-xs-3">아이디 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="email" id="userId" name="userId" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="userName" class="col-sm-3 col-xs-3">이름 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="userName" name="userName" class="form-control udInput" disabled>
                                </div>  
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="email" class="col-sm-3 col-xs-3">이메일 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="email" id="email" name="email" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="phone" class="col-sm-3 col-xs-3">연락처 : </label>
                                <div class="col-sm-9 col-xs-9 d-inline">
                                	<div class="col-sm-3 col-xs-3">
                                		<input type="text" id="phone1" name="phone" class="form-control udInput" disabled>
                                	</div>
                                	<div class="col-sm-1 col-xs-1">
                                		-
                                	</div>
                                	<div class="col-sm-3 col-xs-3">
                                		<input type="text" id="phone2" name="phone" class="form-control udInput" disabled>
                                	</div>
                                	<div class="col-sm-1 col-xs-1">
                                		-
                                	</div>
                                	<div class="col-sm-3 col-xs-3">
                                    	<input type="text" id="phone3" name="phone" class="form-control udInput" disabled>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-group-sm form-group-xs">
                                <!-- <label for="gender">성별 : </label> -->
                                <label for="gender" class="col-sm-3 col-xs-3">성별 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <label class="radio-inline ">
                                        <input type="radio" name="gender" value="M" disabled>남성</label>

                                    <label class="radio-inline">
                                        <input type="radio" name="gender" value="F" disabled>여성</label>
                                </div>
                            </div>

                            <div class="form-group form-group-sm form-group-xs">
                                <label for="birth" class="col-sm-3 col-xs-3">생년월일 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <div class="col-sm-3 col-xs-3">
                                    	<input type="text" id="birth1" name="birth" class="form-control udInput" disabled>
                                    </div>
                                    <div class="col-sm-1 col-xs-1">
                                    	<p>년</p>	
                                	</div>
                                	<div class="col-sm-3 col-xs-3">
                                    	<input type="text" id="birth2" name="birth" class="form-control udInput" disabled>
                                    </div>
                                    <div class="col-sm-1 col-xs-1">
                                    	<p>월</p>	
                                	</div>
                                	<div class="col-sm-3 col-xs-3">
                                    	<input type="text" id="birth3" name="birth" class="form-control udInput" disabled>
                                    </div>
                                    <div class="col-sm-1 col-xs-1">
                                    	<p>일</p>	
                                	</div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="roomhosting" class="col-sm-3 col-xs-3">숙소호스팅:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="roomHosting" name="roomshosting" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="tripHosting" class="col-sm-3 col-xs-3">트립호스팅:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="tripHosting" name="tripHosting" class="form-control udInput" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="oAuth" class="col-sm-3 col-xs-3">신분증인증:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input types="text" id="oAuth" name="oAuth" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="joinDate" class="col-sm-3 col-xs-3">가입날짜:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input types="text" id="joinDate" name="joinDate" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="report" class="col-sm-3 col-xs-3">신고당한횟수:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input types="number" id="report" name="report" class="form-control" disabled>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
                <!-- 모달 footer -->
                <div class="modal-footer">
                    <div class="pull-left">
                        <button type="button" class="btn btn-danger" id="deleteMember">삭제하기</button>
                    </div>
                    <div>
                        <button type="button" class="btn btn-primary" id="modify">수정하기</button>
                        <button type="button" class="btn btn-primary" id="saveData" >저장하기</button>
                        <button type="button" class="btn btn-default" id="close" data-dismiss="modal">Close</button>
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

            //테이블의 첫 행을 클릭했을 때는 모달창을 띄우지 않는다.
            if(td.eq(0).text()!="회원 번호"){

             $.ajax({
         		url : "getMember.mg",
         		type: "GET",
         		data : {
         			userNo : td.eq(0).text()
         		},success : function(data){
         			//성공했을 때 
         			
         			//모달 안에 넣어줄 값 세팅 
         			$('#userNo').val(data.USER_NO);
                    $('#userId').val(data.USER_ID);
                    $('#userName').val(data.USER_NAME);
                    
			        $('#email').val(data.EMAIL);
			        
			        if(data.BIRTH!=null){
				        var phone = data.PHONE.split('-');
				        var phone1 = phone[0];
				        var phone2 = phone[1];
				        var phone3 = phone[2];
				        $('#phone1').val(phone1);
				        $('#phone2').val(phone2);
				        $('#phone3').val(phone3);
			        }else{
			        	 $('#phone1').val(" ");
					     $('#phone2').val(" ");
					     $('#phone3').val(" ");
			        }  
			        if (data.GENDER == 'M') {
	                    $('input:radio[name=gender]:input[value=F]').attr("checked", false);
	                    $('input:radio[name=gender]:input[value=M]').attr("checked", true);
	                } else if (data.GENDER == 'F') {
	                    $('input:radio[name=gender]:input[value=M]').attr("checked", false);
	                    $('input:radio[name=gender]:input[value=F]').attr("checked", true);
	                }else{
	                	$('input:radio[name=gender]:input[value=M]').attr("checked", false);
	                    $('input:radio[name=gender]:input[value=F]').attr("checked", false);
	                }
			        if(data.BIRTH!=null){
				        var birth = data.BIRTH.split(', ');
				        var birth1 = birth[0];
				        var birth2 = birth[1];
				        var birth3 = birth[2];
				        $('#birth1').val(birth1);
				        $('#birth2').val(birth2);
				        $('#birth3').val(birth3);
			        }else{
			        	 $('#birth1').val(" ");
					     $('#birth2').val(" ");
					     $('#birth3').val(" ");
			        }
			       
			        
			        $('#roomHosting').val(data.R_HOSTING);
			        $('#tripHosting').val(data.T_HOSTING);
			        $('#joinDate').val(data.JOIN_DATE);
			        $('#report').val(data.RCNT);
			        $('#oAuth').val(data.OAUTH);
			      
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
        
      	//모달  - 삭제하기 버튼
        $('#deleteMember').click(function(){
        	if (confirm("정말 삭제하시겠습니까??") == true){//확인
        		location.href="<%=request.getContextPath()%>/deleteMember.mg?userNo="+$('#userNo').val();
        	}else{//취소
        	    return;
        	}
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
        
        //모달 - 수정하기 버튼
        $('#modify').click(function(){
        	var $update = $('.udInput');
            /* $('#myModal input').attr("disabled",false); */
            $update.attr("disabled",false);
            $('#saveData').show();
            $(this).hide();
        });
        //모달 - 저장하기 버튼
        $('#saveData').click(function(){
        	if (confirm("변경한 숙소 정보를 저장하시겠습니까??") == true){//확인
        	$.ajax({
        		url : "upMemeber.mg",
        		type:"POST",
        		data:{
	      			userNo : $('#userNo').val(),
        			userId : $('#userId').val(),
        			userName : $('#userName').val(),
        			email : $('#email').val(),
        			phone : $('#phone1').val()+"-"+$('#phone2').val()+"-"+$('#phone3').val(),
        			birth : $('#birth1').val()+", "+$('#birth2').val()+", "+$('#birth3').val(),
        			roomHosting : $('#roomHosting').val(),
        			tripHosting : $('#tripHosting').val()
        		}, success : function(data){
        			alert(data);
        			
        		}, error : function(request, status, error){
    				// 연결에 실패했을 때
    				console.log("에러 코드 : "+request.status
    						+ "에러 내용 : "+ request.responseText 
    						+ "에러 메시지 : " + error);
    				
    				alert("데이터 전달 실패");
    				
    			}
        		
        	});
            $('#myModal input').attr("disabled",true);
            $('#modify').show();
            $(this).hide();
            
        }else{//취소
        	    return;
        }
        	
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
        
        //관리자 홈 화면 클릭시 이동
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