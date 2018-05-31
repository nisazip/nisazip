<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.Room" %>
<!DOCTYPE html>
<html>
<head>
	<title>찜/</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
	
</head>
<body>
<%@ include file="../../views/common/header.jsp" %>


<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav hidden-xs">
      <h3>네가 사는 그집</h3>
      <br> <br> <br>
      <ul class="nav nav-pills nav-stacked">
        <br>
        <li><a href="#section1">사용자 정보 수정/추가</a></li>
        <li><a href="#section2">사진 등록 및 인증</a></li>
        <li><a href="/semi/views/member/myBin.jsp">보관 목록</a></li>
      </ul><br>
      <br><br><br><br><br><br><br>
    </div>
	<input type="hidden" value=<%=m.getUser_id()%>>
	<div class="col-sm-8 col-xs-12">
		<div class="row">
		<div class="col-sm-6 col-xs-12">
		  <h2><span class="glyphicon glyphicon-heart" style="color: #ffb6c1;"></span> 한 숙소 </h2>
		          
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th>숙소명</th>
		        
		        <th>지역</th>		   
		      </tr>
		    </thead>
		    <tbody>
		      <tr class="danger">
		        <td>Jesu</td>		        		   
		        <td>서귀포	</td>		        
		      </tr>		   
		    </tbody>
		  </table>
		</div>
		<div class="col-sm-6 col-xs-12">
		  <h2><span class="glyphicon glyphicon-heart" style="color: #ffb6c1;"></span> 한 트립</h2>        
		  <table class="table table-hover">
		    <thead>
		         <tr>
		        <th>숙소명</th>
		      
		        <th>지역</th>		   
		      </tr>
		    </thead>
		    <tbody>
		      <tr class="danger">
		        <td>Jesu</td>
		       	   
		        <td>서귀포	</td>		        
		      </tr>
		    </tbody>
		  </table>
		</div>
		</div>


		<div class="col-sm-12 col-xs-12">
			<hr>
		</div>
		

		<div class="row">
			<div class="col-sm-6 col-xs-12">
			  <h2>예정된 숙소</h2>
			  <p>행복한 여행이 되길 바랍니다.</p>            
			  <table class="table table-hover">
			    <thead>
			      <tr>
			        <th>숙소명dddd</th>
			        <th>호스트명</th>
			        <th>Check In/Out</th>
			        <th>지역</th>
			        <th>가격</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr class="success">
			        <td>Jesu</td>
			        <td>Doe</td>
			        <td>18/07/06 - 18/08/01</td>
			        <td>서귀포	</td>
			        <td>$10.66	</td>
			      </tr>		   
			    </tbody>
			  </table>
			</div>
			<div class="col-sm-6 col-xs-12">
			  <h2>방문한 숙소</h2>
			  <p>소중한 기억으로 간직하세요</p>            
			  <table class="table table-hover">
			    <thead>
			      <tr>
			      	<th>트립명</th>
			        <th>호스트명</th>
			        <th>날짜</th>
			        <th>지역</th>
			        <th>가격</th>
			      </tr>
			    </thead>
			    <tbody>
			        <tr class="active">
			        <td>Jesu</td>
			        <td>Doe</td>
			        <td>18/07/06 - 18/08/01</td>
			        <td>서귀포	</td>
			        <td>$10.66	</td>
			      </tr>
			    </tbody>
			  </table>
			</div>		
		</div>

		<div class="col-sm-12 col-xs-12">
			<hr>
		</div>

		<div class="row">	
			<div class="col-sm-6 col-xs-12">
			  <h2>예정된 트립</h2>
			  <p>행복한 여행이 되길 바랍니다.</p>            
			  <table class="table table-hover">
			    <thead>
			      <tr>
			        <th>숙소명</th>
			       
			        <th>Check In/Out</th>
			        <th>지역</th>
			        <th>가격</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr class="success">
			        <td>Jesu</td>
		
			        <td>18/07/06 - 18/08/01</td>
			        <td>서귀포	</td>
			        <td>$10.66	</td>
			      </tr>		   
			    </tbody>
			  </table>
			</div>
			<div class="col-sm-6 col-xs-12">
			  <h2>경험한 트립</h2>
			  <p>소중한 기억으로 간직하세요</p>            
			  <table class="table table-hover">
			    <thead>
			      <tr >
			      	<th>트립명</th>
			     
			        <th>날짜</th>
			        <th>지역</th>
			        <th>가격</th>
			      </tr>
			    </thead>
			    <tbody>
			        <tr  class="active">
			        <td>Jesu</td>
			     
			        <td>18/07/06 - 18/08/01</td>
			        <td>서귀포	</td>
			        <td>$10.66	</td>
			      </tr>
			    </tbody>
			  </table>
			</div>
		</div>
	</div>

	<div class="col-sm-2 hidden-xs">	</div>
		
	</div>
</div>
<script>

$(document).ready(function(){
   
       location.href="/semi/storage.do";
  
});


</script>

</body>
</html>