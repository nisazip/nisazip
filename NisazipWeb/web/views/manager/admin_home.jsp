<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                
                <div class="cst_div col-xs-6">
                	<h3>신고 회원</h3>
                	<div class="table-responsive">          
					  <table class="table">
					    <thead>
					      <tr>
					        <th>#</th>
					        <th>Firstname</th>
					        <th>Lastname</th>
					        <th>Age</th>
					        <th>City</th>
					        <th>Country</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>1</td>
					        <td>Anna</td>
					        <td>Pitt</td>
					        <td>35</td>
					        <td>New York</td>
					        <td>USA</td>
					      </tr>
					    </tbody>
					  </table>
					</div>
                </div>
                
                <div class="cst_div col-xs-6">
                	<h3>답변할 Q&A</h3>
                	<div class="table-responsive">          
					  <table class="table">
					    <thead>
					      <tr>
					        <th>#</th>
					        <th>Firstname</th>
					        <th>Lastname</th>
					        <th>Age</th>
					        <th>City</th>
					        <th>Country</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>1</td>
					        <td>Anna</td>
					        <td>Pitt</td>
					        <td>35</td>
					        <td>New York</td>
					        <td>USA</td>
					      </tr>
					    </tbody>
					  </table>
					</div>
                </div>
                

				<!-- 차트영역 div -->
				<div class="col-xs-6">
				<br /><br /><br />
					<!--접속자 수 -->
					<div class="graphs">
						<div id="recentVisit_Graph" style="height: 300px; width: 90%;"></div>
						<h4>누적 접속자수 : 23,323,234 명</h4>
					</div>
				</div>
				
				<div class="col-xs-6">
				<br /><br /><br />
				 	<!-- 예약 인원 통계 -->
					<div class="graphs">
						<div id="reservation_Graph" style="height: 300px; width: 90%;"></div>
					</div>
				</div>
				
	        </div>
	        <!-- 본문 끝 --> 
	       
    	</div>
    	
	</div>
    <!-- 컨테이너 끝 --> 
    
    
    <script>
	$(function(){
		

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