<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.manager.model.vo.*, java.util.*"%>
    
<%
ArrayList<MemberList> list =null;
PageInfo pi = null;
int listCount =0;
int currentPage = 0;
int maxPage = 0;
int startPage = 0;
int endPage =0;

String keyword = "";
String condi = "";

if(request.getAttribute("mList")!=null){
	
	list = (ArrayList<MemberList>)request.getAttribute("mList");
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
	                 <div class="form-row align-items-center">
	                  <div class="col-auto my-1">
  						<select class="mr-sm-2 form-control" id="searchCondition">
	     					<option selected>선택하기</option>
	     					<option value="sId">아이디로 검색</option>
					        <option value="sName">이름으로 검색</option>
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
					<p>총 회원 수(<%=listCount%>)</p>
				</div>
				<!--테이블 영역 -->
				<div class="table-responsive">
                <% if( list!=null) {%>
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
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/searchMember.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=1'">처음</a>
					</li>
					<!-- 한페이지 씩 앞으로 이동 -->
					<% if(currentPage <= 1){ %>
					<li class="page-item disabled">
						<a>&lt;</a>
					</li>					
					<% }else{ %>
					<li class="page-item ">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/searchMember.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage -1%>'">&lt;</a>
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
							<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/searchMember.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=i %>'"><%=i %></a>
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
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/searchMember.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage +1%>'">&gt;</a>
					</li>
					<% }%>
					
					<!-- 가장 마지막 페이지로 이동 -->
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/searchMember.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=maxPage%>'">마지막</a>
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
                                <label for="birth" class="col-sm-3 col-xs-3">생년월일:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="birth" name="birth" class="form-control udInput" disabled>
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
    		location.href='<%=request.getContextPath()%>/searchMember.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val();
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
			        
			        if(data.PHONE!=null){
				        var phone = data.PHONE.split('-');
				        var phone1 = phone[0];
				        var phone2 = phone[1];
				        var phone3 = phone[2];
				        $('#phone1').val(phone1);
				        $('#phone2').val(phone2);
				        $('#phone3').val(phone3);
			        }else{
			        	$('#phone1').val(null);
				        $('#phone2').val(null);
				        $('#phone3').val(null);
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
				        $('#birth').attr("value",birth[0]+'-'+birth[1]+'-'+birth[2]);
			        }else{
			        	$('#birth').attr("value",null);
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
           }).hover(function(){
           	$(this).parent().css({
				"background":"snow",
				"cursor" : "pointer"	
			});
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
        	if (confirm("변경한 회원 정보를 저장하시겠습니까??") == true){//확인
        	$.ajax({
        		url : "upMemeber.mg",
        		type:"POST",
        		data:{
	      			userNo : $('#userNo').val(),
        			userId : $('#userId').val(),
        			userName : $('#userName').val(),
        			email : $('#email').val(),
        			phone : $('#phone1').val()+"-"+$('#phone2').val()+"-"+$('#phone3').val(),
        			birth : $('#birth').val(),
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
        
        //관리자 홈 화면 클릭시 이동
        $('#home_btn').click(function(){
        	location.href="<%=request.getContextPath()%>/views/manager/admin_home.jsp";
        });

    </script>
    
    <footer>
    	<div>
    		footer 영역 
    	</div>
    </footer>
</body>

</html>