<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, kh.room.model.vo.*" %>
<%
	ArrayList<R_RESERVATION> list = (ArrayList<R_RESERVATION>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
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
    <h3 class="w3-padding-64">네가 사는 그집</h3>
  </div>
  <div class="w3-bar-block">
    
    <a href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp" class="w3-bar-item w3-button w3-hover-white">숙소 등록하기</a>  
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">등록 숙소 보기</div> 
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Rstatistics.no'">통계 페이지</div>
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomReservationList.no'">등록 숙소 예약자 명단</div>
</div>
</nav>
	<div class="container col-sm-7 table-responsive" style="margin-left: 400px; margin-top: 150px;">
        <h1 style="text-align: center; margin-left: auto; font-size: 40pt;"><i>통계(예약자) 리스트</i></h1> <br /><br />
        <button style="background: green; color: white;" id="Tpeople">인원</button>
        <button style="background: green; color: white;" id="Tprice">가격</button>

        
        <br>
		<div  class="table-responsive" style="margin-left: auto;">
        <table class="table table-hover table-bordered " style=" text-align:center;" id="listArea">
                <colgroup>
                    <col width="7%">  <!-- 글 번호 -->
                    <col width="15%">       <!--  제목   -->
                    <col width="15%"> <!-- 작성자 -->
                    <col width="10%"> <!-- 작성일 -->
                    <col width="15%">  <!-- 조회수 -->
                </colgroup>
            <thead>
            <tr style="text-align:center; background-color: #eeeeee;">
                <th style="text-align: center;">예약번호</th>
                <th style="text-align: center;">체크인 날짜</th>
                <th style="text-align: center;">체크아웃 날짜</th>
                <th style="text-align: center;">예약 인원수</th>
                <th style="text-align: center;">총 가격</th>
            </tr>
            </thead>
            <tbody>
            <% for(R_RESERVATION res: list){ %>
			<tr>
				<td><%= res.getR_reser_no() %></td>
				<td><%= res.getCheck_in() %></td>
				<td><%= res.getCheck_out() %></td>
				<td><%= res.getPeople() %></td>
				<td id="Tprice"><%= res.getTotal_price() %></td>
			</tr>
			<% } %>
            </tbody>
        </table>
        	<%-- 총액: <% for(R_RESERVATION res: list){ %>
        		<%=res.getTotal_price()%> 
        	<% } %> --%>        
        </div>
        <h4>총 인원 수:</h4>
       	<p id="PeopleArea" style="font-size: 20pt;"></p>
        <hr> 
        <h4>총 가격:</h4> 
        <p id="PriceArea" style="font-size: 20pt;"></p>
        <hr>
       <!--  <div class=" row justify-content-end">
        <input type="button" class="btn btn btn-outline-secondary col-sm-1" value="글쓰기">
        </div> -->
        <!-- <div class="row justify-content-center" style="margin-left: auto;">
            <ul class="pagination" >
                <li class="page-item " ><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item "><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div> -->
    </div>

    <hr>  
        <br><br><br><br> 
   </body>
   <script>
	$(function(){
		$('#listArea td').mouseenter(function(){
			$(this).parent().css({
					
				"cursor": "pointer"
			});
		}).mouseout(function(){
			$(this).parent().css({"background": "toma"})
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			<%-- location.href="<%=request.getContextPath()%>/roomselectOne.no?num="+num; --%>
			
		});
	});
	
	$(function() {
		var sum = 0;
		var n = 0;
		for(var i = 3; i < 100; i += 5){
			n = $('td').eq(i).text();
			n = Number(n)
			sum += n
		}
		/* var n = $('td').eq(4).text();
		var n2 = $('td').eq(9).text();
		
		n = Number(n);
		n2 = Number(n2); */
		
		$('#Tpeople').click(function() {
			$('#PeopleArea').text(sum+"명");
		});
	});
	
	$(function() {
		var sum = 0;
		var n = 0;
		for(var i = 4; i < 100; i += 5){
			n = $('td').eq(i).text();
			n = Number(n)
			sum += n
		}
		/* var n = $('td').eq(4).text();
		var n2 = $('td').eq(9).text();
		
		n = Number(n);
		n2 = Number(n2); */
		
		$('#Tprice').click(function() {
			$('#PriceArea').text(sum+"원");
		});
	});
</script>
</body>
</html>