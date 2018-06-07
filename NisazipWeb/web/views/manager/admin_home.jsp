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
                
                <!-- 차트영역 div -->
				<div class="row">
					<div class="cst_div col-xs-6 col-sm-6">
					<br /><br /><br />
						<!--접속자 수 -->
						<div class="graphs">
							<div id="recentVisit_Graph" style="height: 300px; width: 90%;"></div>
							<!-- <h4>누적 접속자수 : 23,323,234 명</h4> -->
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
	                		<h3 class="text-center">답변할 Q&A</h3>
	                		<a href=""><h6 class="text-right">더보기</h6></a>
	                	</div>
	                	<div class="table-responsive text-center">          
						  <table class="table text-center" id="qnaTable">
						    <thead>
						      <tr>
						        <th>#</th>
						        <th>제목</th>
						        <th>작성자</th>
						        <th>조회수</th>
						      </tr>
						    </thead>
						    <tbody>
							    <tr>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    </tr>
							    <tr>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    </tr>
							    <tr>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    </tr>
							    <tr>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    </tr>
							    <tr>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    	<td>1</td>
							    </tr>
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
  	// 회원탈퇴 하기 버튼

	 function delMember(obj){
	  		
	  		if (confirm("해당 회원을 탈퇴 시키시겠습니까??") == true){//확인
	    		 
	  			console.log($(obj).parent().parent().children(":eq(1)").text());
	  			
	  			 /* var tr =$(this).text();
	    		 
	    		 $(this).parent().parent().parent().css('background-color', 'red'); */ 
	    		/* var tr = $(this).parent();	
	    		var $td = $(tr).children().eq(1);
	    		console.log($td.text());
	    		console.log($td.text());
	    		console.log($td.text()); */

	<%-- location.href="<%=request.getContextPath()%>/deleteReMember.mg?reReceiver="+$('#reReceiver').val(); --%>
	    	}else{//취소
	    	    return;
	    	}
	  	}

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
						var $btnTd = $('<td>').append( $('<button class="btn btn-danger btn-xs delbtn" onclick="delMember(this);">').text('탈퇴') );
						
						$tr.append($rankTd);
						/* $tr.append($noTd); */
						$tr.append($idTd);
						$tr.append($countTd);
						$tr.append($btnTd); 
						$tableBody.append($tr);
						
					});
					
				}, error : function(data) {
					
					console.log("신고 불러오기 실패");
					
				}
			});
		
		//  Q&A top5
		$.ajax({
			url : "<%=request.getContextPath()%>/qnaTop5.mg",
			type: "GET",
			success : function(data){
				
				var $tableBody = $('#qnaTable tbody');
				
				$.each(data, function(index, value){
					
					var $tr = $('<tr>');
					var $rankTd = $('<td>').text(index+1);
					/* var $noTd = $('<td>').text(value.reNo); */
					var $idTd = $('<td>').text(value.userId);
					var $countTd = $('<td>').text(value.reCount);
					var $btnTd = $('<td>').append( $('<button class="btn btn-danger btn-sm delbtn" onclick="delMember();">').text('탈퇴') );
					
					$tr.append($rankTd);
					/* $tr.append($noTd); */
					$tr.append($idTd);
					$tr.append($countTd);
					$tr.append($btnTd);
					$tableBody.append($tr);
					
				});
				
			}, error : function(data) {
				
				console.log("Q&A 불러오기 실패");
				
			}
		});
		
			
			 $('#reportTable td').mouseenter(function(){
					$(this).parent().css({
						"background":"red",
						"cursor" : "pointer"	
					});
				}).mouseout(function(){
					$(this).parent().css({
						"background": "white",
					});
				}).click(function(){
					/* var num = $(this).parent().children().eq(0).text(); */
					console.log('11');
					<%-- location.href="<%=request.getContextPath()%>/selectOne.bo?num="+num; --%>
				});
			 
		$(function(){
			var sampleData = [];
			
			$.ajax({
				url : "",
				async : false,
				dataType : "json",
				success : function(data){
					sampleData = data;
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
					dataPoints: [
						{ y: 40 , label: "1월" },
						{ y: 30, label: "2월" },
						{ y: 35, label: "3월" },
						{ y: 40, label: "4월" },
						{ y: 80, label: "5월" },
						{ y: 91, label: "6월" },
						{ y: 50, label: "7월" },
						{ y: 150, label: "8월" },
						{ y: 70, label: "9월" },
						{ y: 50, label: "10월" },
						{ y: 60, label: "11월" },
						{ y: 200, label: "12월" }
					]
				},
				{
					type: "stackedColumn",
					name: "트립 예약",
					showInLegend: "true",
					yValueFormatString: "#,##0 회",
					dataPoints: [
						{ y: 20 , label: "1월" },
						{ y: 15, label: "2월" },
						{ y: 15, label: "3월" },
						{ y: 20, label: "4월" },
						{ y: 80, label: "5월" },
						{ y: 91, label: "6월" },
						{ y: 80, label: "7월" },
						{ y: 100, label: "8월" },
						{ y: 70, label: "9월" },
						{ y: 50, label: "10월" },
						{ y: 60, label: "11월" },
						{ y: 50, label: "12월" }
					]
				}]
			};
			
			$("#reservation_Graph").CanvasJSChart(reservation_Graph);
			
			
		});
		
		
/* 
		//Better to construct options first and then pass it as a parameter
		var options = {
			title: {
				text: "최근 방문자 수"              
			},
			data: [              
			{
				// Change type to "doughnut", "line", "splineArea", etc.
				type: "column",
				dataPoints: [
					{ label: "apple",  y: 10  },
					{ label: "orange", y: 15  },
					{ label: "banana", y: 25  },
					{ label: "mango",  y: 30  },
					{ label: "grape",  y: 28  }
				]
			}
			]
		};
		$("#chartContainer").CanvasJSChart(options);
		$("#chartContainer1").CanvasJSChart(options);
 */       
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
		          dataPoints: [
		              { y: 100 , label:"15일"},
		              { y: 60 , label:"16일"},
		              { y: 140 , label:"17일"},
		              { y: 500 , label:"18일"},
		              { y: 190 , label:"19일"},
		              { y: 140 , label:"20일"},
		              { y: 206 , label:"21일"},
		              { y: 300 , label:"22일"},
		              { y: 220 , label:"23일"},
		              { y: 220 , label:"24일"},
		          ]
		      }
		      ]
		  };
		  $("#recentVisit_Graph").CanvasJSChart(recentVisit_Graph);

        
			});
	
	
	</script>
</body>

</html>