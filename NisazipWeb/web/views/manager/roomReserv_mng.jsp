<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.*, kh.manager.model.vo.*, java.util.*"%>
    
    <%
    ArrayList<RoomReservList> list =null;
    PageInfo pi = null;
    int listCount =0;
    int currentPage = 0;
    int maxPage = 0;
    int startPage = 0;
    int endPage =0;

    String keyword = "";
    String condi = "";

    if(request.getAttribute("rList")!=null){
    	
    	list = (ArrayList<RoomReservList>)request.getAttribute("rList");
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

   <title>관리자 페이지_숙소 예약 관리</title>
    
</head>
<body>
 	<%@ include file="common/admin_header.jsp" %>
    <div class="container">
        <div class="row">
            <%@ include file="common/admin_menu.jsp" %>
            <h1>숙소 예약 관리</h1>
            <hr />
            <!-- 본문  -->
            <div class="col-sm-10">

                <!-- 검색 영역 -->
	                <div class="col-xs-4 col-sm-2">
	                 <div class="form-row align-items-center">
	                  <div class="col-auto my-1">
  						<select class="mr-sm-2 form-control" id="searchCondition">
	     					<option selected>선택하기</option>
	     					<option value="rId">호스트 아이디로 검색</option>
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
					<p>총 숙소 예약 수(<%=listCount%>)</p>
				</div>
				<!--테이블 영역 -->
				<div class="table-responsive">
				<% if( list!=null) {%>
                <table class="table table-striped table-bordered table-hover " id="roomReservTable" data-toggle="modal" data-target="#myModal">
                    <thead>
	                    <tr onclick="event.cancelBubble=true">
	                        <th>예약 번호</th>
	                        <th>숙소 아이디</th>
	                        <th>게스트 아이디</th>
	                        <th>체크 인</th>
	                        <th>체크 아웃</th>
	                        <th>총 가격</th>
	                        <th>신청 인원</th>
	                        <th>취소</th>
	                    </tr>
                    </thead>
                    <tbody>
                    <% for(RoomReservList r : list){ %>
                    	<tr>
                    		<td><%=r.getR_reser_no()%></td>
                    		<td><%=r.getR_id() %></td>
                    		<td><%=r.getUser_id() %></td>
                    		<td><%=r.getCheck_in() %></td>
                    		<td><%=r.getCheck_out() %></td>
                    		<td><%=r.getTotal_price()%></td>
                    		<td><%=r.getPeople()%></td>
                    		<td><button class="btn btn-danger" onclick="cancelRoom(this);">예약 취소</button></td>
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
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reservRoomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=1'">처음</a>
					</li>
					<!-- 한페이지 씩 앞으로 이동 -->
					<% if(currentPage <= 1){ %>
					<li class="page-item disabled">
						<a>&lt;</a>
					</li>					
					<% }else{ %>
					<li class="page-item ">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reservRoomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage -1%>'">&lt;</a>
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
							<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reservRoomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=i %>'"><%=i %></a>
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
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reservRoomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=currentPage +1%>'">&gt;</a>
					</li>
					<% }%>
					
					<!-- 가장 마지막 페이지로 이동 -->
					<li class="page-item">
						<a class="page-item" onclick="location.href='<%=request.getContextPath()%>/reservRoomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()+'&currentPage=<%=maxPage%>'">마지막</a>
					</li>	
	
					</ul>
				</nav>
				
				<!-- 페이징 끝 --> 
                
                
            </div>
        </div>

    <!-- 컨테이너 끝 --> 
    
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
    		location.href='<%=request.getContextPath()%>/reservRoomList.mg?con='+$('#searchCondition').val()+'&keyword='+$('#keyword').val();
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
    
    function cancelRoom(obj){
    	
    	console.log($(obj).parent().parent().children(":eq(0)").text());
    	
    	if (confirm("예약을 정말 취소하시겠습니까??") == true){//확인
    		location.href="<%=request.getContextPath()%>/cancelRoom.mg?roomReservNo="+$(obj).parent().parent().children(":eq(0)").text();
    	}else{//취소
    	    return;
    	}
    	
    	
    }

	
    $('#home_btn').click(function(){
    	location.href="<%=request.getContextPath()%>/views/manager/admin_home.jsp";
    });
   
    </script>
    
    <footer>
    	<div>
    		<!-- footer 영역 --> 
    	</div>
    </footer>
</body>

</html>