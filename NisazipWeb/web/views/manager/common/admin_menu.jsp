<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

    
    <!-- bootStrapCDN -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
    
    <!-- 차트에 쓰이는 canvas -->
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <style>
	    
	.table th, a{
	    text-align: center;
	}
	
	ul{
	    list-style-type: none;
	}
	
	header, footer{
	    background : green;
	    text-aline:center;
	}
	
	.home_btn{
	    border: none;
	    font-weight: 700;
	    font-size : 27px;
	    letter-spacing: 1px;
	    text-transform: uppercase;
	    background: green;
	    color: white;
	    text-align: center;
	    padding: 15px 30px;
	}
	
	.cst_div{
		border-radius: 25px;
    border: 2px solid #73AD21;
    padding: 20px; 
    width: 50%;
    height: 30%; 
	}

	li:hover{
		font-weight: bold;
		cursor: pointer;
	}
    
    </style>
</head>
<body>

	<!-- 메뉴 선택  -->
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked hidden-xs">
                    <li>
                        <a href="#" onclick="goMember();" class="col-sm-12" >회원 관리</a> 
                    </li>
                    <li>
                        <a href="#" onclick="goRoom();" class="col-sm-12">숙소 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goTrip();" class="col-sm-12">트립 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goReservRoom();" class="col-sm-12">숙소 예약 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goReservTrip();" class="col-sm-12">트립 예약 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goReport();" class="col-sm-12">신고 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goAdmin();" class="col-sm-12">통계</a>
                    </li>
                </ul>
                <!-- 모바일 용 메뉴  -->
                <div class="row visible-xs">
	                <div class="navbar navbar-default" >
	                	<div class="navbar-header"> 
	                		<button class="navbar-toggle" data-toggle="collapse" data-target="#menu1">
	                		<!-- <span class="sr-only">Toggle navigationr</span> -->
	                		<span class="icon-bar"></span>
	                		<span class="icon-bar"></span>
	                		<span class="icon-bar"></span>
	                		</button>
	                		<a class="navbar-brand">메뉴 보기</a>
	                	</div>
	                
		                <div class="collapse navbar-collapse" id="menu1">
		                <ul class="nav navbar-nav">
			                <li>
		                        <a href="#" onclick="goMember();" class="col-sm-12" >회원 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goRoom();" class="col-sm-12">숙소 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goTrip();" class="col-sm-12">트립 관리</a>
		                    </li>
		                     <li>
		                        <a href="#" onclick="goReservRoom();" class="col-sm-12">숙소 예약 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goReservTrip();" class="col-sm-12">트립 예약 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goReport();" class="col-sm-12">신고 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goAdmin();" class="col-sm-12">통계</a>
		                    </li>
		                </ul>
		                </div>
                	</div>
	       		</div>
            </div>
<script>
	function goMember(){
		location.href="<%=request.getContextPath()%>/memberList.mg";
		$('li').removeClass("active");
		$('li:nth-child(1)').addClass("active");
	}
	function goRoom(){
		location.href="<%=request.getContextPath()%>/roomList.mg";
		$('li').removeClass("active");
		$('li:nth-child(2)').addClass("active");
	}
	function goTrip(){
		location.href="<%=request.getContextPath()%>/tripList.mg";
		$('li').removeClass("active");
		$('li:nth-child(3)').addClass("active");
	}
	function goReservRoom(){
		location.href="<%=request.getContextPath()%>/reservRoomList.mg";
		$('li').removeClass("active");
		$('li:nth-child(4)').addClass("active");
	}
	function goReservTrip(){
		location.href="<%=request.getContextPath()%>/reservTripList.mg";
		$('li').removeClass("active");
		$('li:nth-child(5)').addClass("active");
	}
	function goReport(){
		location.href="<%=request.getContextPath()%>/reportList.mg";
		$('li').removeClass("active");
		$('li:nth-child(6)').addClass("active");
	}
	function goAdmin(){
		location.href="<%=request.getContextPath()%>/views/manager/admin_home.jsp";
		$('li').removeClass("active");
		$('li:nth-child(7)').addClass("active");
	}	
	
	/* 
	$('li').click(function(){
	 $('li').removeClass("active");
	 $(this).addClass("active");
	})
 */
</script>
</body>
</html>