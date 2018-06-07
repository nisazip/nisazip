<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.report.model.vo.*, kh.manager.model.vo.*, java.util.*"%>
    
    <%
    ArrayList<Report> list =null;
    PageInfo pi = null;
    int listCount =0;
    int currentPage = 0;
    int maxPage = 0;
    int startPage = 0;
    int endPage =0;

    String keyword = "";
    String condi = "";

    if(request.getAttribute("reList")!=null){
    	
    	list = (ArrayList<Report>)request.getAttribute("reList");
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

   <title>관리자 페이지_신고관리</title>
    
</head>
<body>
 	<%@ include file="common/admin_header.jsp" %>
    <div class="container">
        <div class="row">
            <%@ include file="common/admin_menu.jsp" %>
            <h1>신고 관리</h1>
            <hr />
            <!-- 본문  -->
            <div class="col-sm-10">

                <!-- 검색 영역 -->
	                <div class="col-xs-4 col-sm-2">
	                 <div class="form-row align-items-center">
	                  <div class="col-auto my-1">
  						<select class="mr-sm-2 form-control" id="searchCondition">
	     					<option selected>선택하기</option>
					        <option value="reWriter">신고자로 검색</option>
	     					<option value="reReciver">피신고자로 검색</option>
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
					<p>총 신고 수(<%=listCount%>)</p>
				</div>
				<!--테이블 영역 -->
				<div class="table-responsive">
				<% if( list!=null) {%>
                <table class="table table-striped table-bordered table-hover " id="reportTable" data-toggle="modal" data-target="#myModal">
                    <thead>
	                    <tr onclick="event.cancelBubble=true">
	                        <th>신고 번호</th>
	                        <th>신고자 ID</th>
	                        <th>피신고자 ID</th>
	                        <th>신고 유형</th>
	                        <th>신고 일자</th>
	                    </tr>
                    </thead>
                    <tbody>
                    <% for(Report re : list){ %>
                    	<tr>
                    		<td><%=re.getRp_no()%></td>
                    		<td><%=re.getRp_writer() %></td>
                    		<td><%=re.getRp_receiver() %></td>
                    		<td><%=re.getRp_type() %></td>
                    		<td><%=re.getRp_date() %></td>
                    	</tr>
                    <% } %>	
                    </tbody>
                </table>
                
                 <%}else{ %>
                      <div><p class="text-center">신고가 없습니다. <br/>
                      	 	검색조건을 확인해 주세요</p>
                      </div>
                   <% } %>
                </div>
                <!-- 페이징처리할 부분 -->
	            <nav aria-label="Page navigation example" style="text-align: center">
	             	<ul class="pagination justify-content-center">
					
					<!-- 가장 첫 페이지로 이동 -->
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reportList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=1'">처음</a>
					</li>
					<!-- 한페이지 씩 앞으로 이동 -->
					<% if(currentPage <= 1){ %>
					<li class="page-item disabled">
						<a>&lt;</a>
					</li>					
					<% }else{ %>
					<li class="page-item ">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reportList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage -1%>'">&lt;</a>
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
							<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reportList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=i %>'"><%=i %></a>
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
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reportList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage +1%>'">&gt;</a>
					</li>
					<% }%>
					
					<!-- 가장 마지막 페이지로 이동 -->
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reportList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=maxPage%>'">마지막</a>
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
                    <h4 class="modal-title">신고 정보</h4>
                </div>
                <!-- 모달 body -->
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group">
                            <h3>신고 등록번호</h3>
                        </div>
                        <form class="form-horizontal" role="form">
                            
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="reNo" class="col-sm-3 col-xs-3">신고번호 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="number" id="reNo" name="reNo" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="reWriter" class="col-sm-3 col-xs-3">신고자 아이디 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="reWriter" name="reWriter" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="reReceiver" class="col-sm-3 col-xs-3">피신고자 아이디 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="reReceiver" name="reReceiver" class="form-control" disabled>
                                </div>  
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="reType" class="col-sm-3 col-xs-3">신고 유형 : </label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="reType" name="reType" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="reContent" class="col-sm-3 col-xs-3">신고 내용:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="text" id="reContent" name="reContent" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="form-group form-group-sm form-group-xs">
                                <label for="reDate" class="col-sm-3 col-xs-3">신고 일자:</label>
                                <div class="col-sm-9 col-xs-9">
                                    <input type="date" id="reDate" name="reDate" class="form-control" disabled>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
                <!-- 모달 footer -->
                <div class="modal-footer">
                    <div class="pull-left">
                        <button type="button" class="btn btn-danger" id="deleteReport">신고 삭제하기</button>
                    </div>
                    <div>
                    	<button type="button" class="btn btn-danger" id="delMember">회원 탈퇴 시키기</button>
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
    		location.href='<%=request.getContextPath()%>/reportList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val();
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
        $("#reportTable tr").click(function () {
            var str = "";
            var tdArr = new Array();
            var tr = $(this);
            var td = tr.children();

            //테이블의 첫 행을 클릭했을 때는 모달창을 띄우지 않는다.
            if(td.eq(0).text()!="신고 번호"){
            	
            	//모달 안에 넣어줄 값 세팅
            	$.ajax({
            		url : "getReport.mg",
            		type: "GET",
            		data : {
            			roomNo : td.eq(0).text()
            		},success : function(data){
            		//성공했을 때 

            		//모달 안에 넣어줄 값 세팅 
            		$('#reNo').val(data.RP_NO);
                    $('#reWriter').val(data.RP_WRITER);
                    $('#reReceiver').val(data.RP_RECEIVER);
   			        $('#reType').val(data.RP_TYPE);
   			        $('#reContent').val(data.RP_CONTENT);
   			        $('#reDate').val(data.RP_DATE);

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
        
       
      	//모달 - 삭제하기 버튼
        $('#deleteReport').click(function(){
        	if (confirm("해당 신고를 정말 삭제하시겠습니까??") == true){//확인
        		location.href="<%=request.getContextPath()%>/deleteReport.mg?reNo="+$('#reNo').val();
        	}else{//취소
        	    return;
        	}
        });
      	
        
	
      	//모달 - 회원탈퇴 하기 버튼
        $('#delMember').click(function(){
        	if (confirm("해당 회원을 탈퇴 시키시겠습니까??") == true){//확인
        		location.href="<%=request.getContextPath()%>/deleteReMember.mg?reReceiver="+$('#reReceiver').val();
        	}else{//취소
        	    return;
        	}
        });
        
        
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