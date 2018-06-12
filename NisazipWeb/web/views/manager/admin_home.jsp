<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.manager.model.vo.*, java.util.*"%>
    <%
    ArrayList<ReportList> list = new ArrayList<ReportList>();
    
    
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

            <!-- 본문  -->
            <div class="col-sm-10">
               	<h3>대시보드</h3>
                <hr>
                
                <!-- 누적 접속자 수 -->
                <div class="row">
                	<h3><p class="bg-success" id="VisitAllCnt"></p></h3>
                </div>
                
                <!-- 차트영역 div -->
				<div class="row">
					<div class="cst_div col-xs-6 col-sm-6">
					<br /><br /><br />
						<!--접속자 수 -->
						<div class="graphs">
							<div id="recentVisit_Graph" style="height: 300px; width: 90%;"></div>
							
						</div>
					</div>
					<div class="cst_div col-xs-6 col-sm-6">
					<br /><br /><br />
					 	<!-- 예약 인원 통계 -->
						<div class="graphs">
							<div id="reservation_Graph" style="height: 300px; width: 90%;"></div>
						</div>
					</div>
				</div>
                
                <!-- top 5 -->
                <div class="row">
	                <div class="cst_div col-sm-6 col-xs-6">
	                	<div class="row">
	                		<h3 class="text-center">신고 회원</h3>
	                		<a href="<%=request.getContextPath()%>/reportList.mg"><h6 class="text-right">더보기</h6></a>
	                	</div>
	                	<div class="table-responsive">          
						  <table class="table  text-center" id="reportTable">
						    <thead>
						      <tr>
						        <th>#</th>
						        <th>신고 당한 사용자 ID</th>
						        <th>신고 횟수</th>
						        <th>탈퇴</th>
						      </tr>
						    </thead>
						    <tbody>
						    </tbody>
						  </table>
						</div>
	                </div>
	                
	                <div class="cst_div col-sm-6 col-xs-6">
	                	<div class="row">
	                		<h3 class="text-center">인증 승인</h3>
	                		<a href="<%=request.getContextPath()%>/memberList.mg"><h6 class="text-right">더보기</h6></a>
	                	</div>
	                	<div class="table-responsive text-center">          
						  <table class="table text-center" id="certifiTable">
						    <thead>
						      <tr>
						        <th>#</th>
						        <th>사용자 ID</th>
						        <th>사용자 이름</th>
						        <th>인증</th>
						      </tr>
						    </thead>
						    <tbody>
						    </tbody>
						  </table>
						</div>
	                </div>
				</div>	                
                <!-- top 5 끝 -->

				
				
	        </div>
	        <!-- 본문 끝 --> 
	       
    	</div>
    	
	</div>
    <!-- 컨테이너 끝 --> 
    
    
    <script>
  	// 회원탈퇴 하기 버튼 클릭시
	 function delMember(obj){
	  		
	  		if (confirm("해당 회원을 탈퇴 시키시겠습니까??") == true){//확인
				location.href="<%=request.getContextPath()%>/deleteReMember.mg?reReceiver="+$(obj).parent().parent().children(":eq(1)").text();
				
	    	}else{//취소
	    	    return;
	    	}
	  	}
	
  	// 인증 버튼 클릭 시 
  	function certifiMember(obj){
  		console.log($(obj).parent().parent().children(":eq(1)").text());
  		if (confirm("해당 회원의 인증을 승인 하시겠습니까??") == true){//확인
  			$.ajax({
    		url : "<%=request.getContextPath()%>/confirm.mg",
    		type:"POST",
    		data:{
    			userId : $(obj).parent().parent().children(":eq(1)").text()
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
    	}else{//취소
    	    return;
    	}
  	}

  	//총 접속자수 구하기
	$(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/visiteAllCnt.mg",
			type: "POST",
			success : function(data){
					 $('#VisitAllCnt').text('누적 접속자 수 : '+data.cnt+'명'); 
			}, error : function(data) {
				console.log("총 접속자 수 불러오기 실패");
			}
		});
	});
	

	$(function(){
		//신고 top5	
		$.ajax({
				url : "<%=request.getContextPath()%>/reportTop5.mg",
				type: "GET",
				success : function(data){
					
					var $tableBody = $('#reportTable tbody');
					
					$.each(data, function(index, value){
						
						var $tr = $('<tr>');
						var $rankTd = $('<td>').text(index+1);
						/* var $noTd = $('<td>').text(value.reNo); */
						var $idTd = $('<td>').text(value.userId);
						var $countTd = $('<td>').text(value.reCount);
						var $btnTd = $('<td>').append( $('<button class="btn btn-danger btn-sm delbtn" onclick="delMember(this);">').text('탈퇴') );
						
						$tr.append($rankTd);
						/* $tr.append($noTd); */
						$tr.append($idTd);
						$tr.append($countTd);
						$tr.append($btnTd); 
						$tableBody.append($tr);
						
					})
					
				}, error : function(data) {
					
					console.log("신고 불러오기 실패");
					
				}
			});
		
		//  Certification top5
		$.ajax({
			url : "<%=request.getContextPath()%>/certifiTop5.mg",
			type: "GET",
			success : function(data){
				
				var $tableBody = $('#certifiTable tbody');
				
				$.each(data, function(index, value){
					
					var $tr = $('<tr>');
					var $rankTd = $('<td>').text(index+1);
					/* var $noTd = $('<td>').text(value.reNo); */
					var $idTd = $('<td>').text(value.userId);
					var $countTd = $('<td>').text(value.userName);
					var $btnTd = $('<td>').append( $('<button class="btn btn-primary btn-sm" onclick="certifiMember(this);">').text('승인하기') );
					$tr.append($rankTd);
					/* $tr.append($noTd); */
					$tr.append($idTd);
					$tr.append($countTd);
					$tr.append($btnTd);
					$tableBody.append($tr);
					
				});
				
			}, error : function(data) {
				
				console.log("승인 불러오기 실패");
				
			}
		});
		
			 
		$(function(){
			
			var RoomData = [];
			var TripData = [];
			
			$.ajax({
				url : "<%=request.getContextPath()%>/roomReserv.mg",
				async : false,
				dataType : "json",
				success : function(data){
					RoomData = data;
					console.log(RoomData);
				}
			});
			
			$.ajax({
				url : "<%=request.getContextPath()%>/tripReserv.mg",
				async : false,
				success : function(data){
					TripData = data;
					console.log(TripData);
				}
			});
			
			
			//예약 그래프
			var reservation_Graph = {
				animationEnabled: true,
				title:{
					text: "월별 예약"   
				},
				axisY:{
					title:" 회"
				},
				toolTip: {
					shared: true,
					reversed: true
				},
				data: [{
					type: "stackedColumn",
					name: "숙소 예약",
					showInLegend: "true",
					yValueFormatString: "#,##0 회",
					dataPoints: RoomData
					
				},
				{
					type: "stackedColumn",
					name: "트립 예약",
					showInLegend: "true",
					yValueFormatString: "#,##0 회",
					dataPoints: TripData
				}]
			};
			
			$("#reservation_Graph").CanvasJSChart(reservation_Graph);
			
			
		});

			});
	
	//최근 7일 데이터 받아오기
	 $(function(){
			var recentVisitCnt = [];
			
			$.ajax({
				url : "<%=request.getContextPath()%>/visteCnt.mg",
				async : false,
				dataType : "json",
				success : function(data){
					recentVisitCnt = data;
					console.log(recentVisitCnt);
				}
			});
			
			//사이트 방문자 그래프
			  var recentVisit_Graph = {
			      exportEnabled: true,
			      animationEnabled: true,
			      title: {
			          text: "최근 접속자 수"
			      },
			      data: [
			      {
			          type: "splineArea",
			          dataPoints: recentVisitCnt
			      }
			      ]
			  };
			  $("#recentVisit_Graph").CanvasJSChart(recentVisit_Graph);
	});
	
	
	
	</script>
</body>
	<br>
    전체 : <%=session.getAttribute("totalCount") %>
    <br>
    오늘 : <%=session.getAttribute("todayCount") %>
    <br>
</html>