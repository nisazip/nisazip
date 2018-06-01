<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.home.model.vo.*, java.util.*"%>

<%

	RecRoom rec = new RecRoom();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네가 사는 제주</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#price {
	text-align: right;
}

.select {
	padding-left: 24px !important;
	padding-right: 24px !important;
	max-width: 1080px !important;
}

.search {
	background: rgb(77, 60, 23);
	color: white;
}

.thumbnail:hover {
	background: gray;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.4);
	opacity: 0.4;
}

.img {
	width: 100%;
	height: 50%;
}

.areaimg {
	width: 100%;
}

.areathumbnail {
	background: black;
	color: white;
	font-size: 13pt;
	font-weight: bold;
}

 .tooltip > .tooltip-inner {
      background-color: #73AD21; 
      color: #FFFFFF; 
      border: 1px solid green; 
      margin-left:60px;
      font-size: 14px;
  }
  
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp"%>

	<div id="main">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4 form-group"
					style="background-color: rgb(214, 238, 214);">


					<div class="row">
						<br>
						<div class="col-xs-6">
							<label> 위 치</label>&nbsp;
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12">
							<input type="text" autocomplete="off" class="location"
								name="location" style="width: 95%; height: 40px;"
								placeholder="모든 위치" value="한국">
						</div>
					</div>
					<br>

					<div class="form-group">
						<div class="row">
							<div class="col-xs-6">
								&nbsp;<label>체크인</label>
							</div>

							<div class="col-xs-6">
								<label>체크아웃</label>&nbsp;
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6">
								<input type="date" class="check-in" id="checkin_input"
									style="width: 90%; height: 40px;" name="checkin"
									placeholder="년/월/일" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>

							<div class="col-xs-6">
								<input type="date" class="check-out" id="checkout_input"
									style="width: 90%; height: 40px;" name="checkout"
									placeholder="년/월/일" value="">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-xs-6">
								&nbsp;&nbsp;<label> 성 인</label>&nbsp;&nbsp;
							</div>

							<div class="col-xs-6">
								&nbsp;&nbsp;<label>어린이</label>&nbsp;&nbsp;&nbsp;
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6">
								<select id="adults" name="adults" class="adults"
									style="width: 90%; height: 40px;">
									<option value="1">성인 1명</option>
									<option value="2">성인 2명</option>
									<option value="3">성인 3명</option>
									<option value="4">성인 4명</option>
									<option value="5">성인 5명</option>
									<option value="6">성인 6명</option>
									<option value="7">성인 7명</option>
									<option value="8">성인 8명</option>
									<option value="9">성인 9명</option>
									<option value="10">성인 10명</option>
									<option value="11">성인 11명</option>
									<option value="12">성인 12명</option>
									<option value="13">성인 13명</option>
									<option value="14">성인 14명</option>
									<option value="15">성인 15명</option>
									<option value="16">성인 16명</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>

							<div class="col-xs-6">
								<select id="children" name="children" class="children"
									style="width: 90%; height: 40px;">
									<option value="0">어린이 0명</option>
									<option value="1">어린이 1명</option>
									<option value="2">어린이 2명</option>
									<option value="3">어린이 3명</option>
									<option value="4">어린이 4명</option>
									<option value="5">어린이 5명</option>
									<option value="6">어린이 6명</option>
									<option value="7">어린이 7명</option>
									<option value="8">어린이 8명</option>
									<option value="9">어린이 9명</option>
									<option value="10">어린이 10명</option>
									<option value="11">어린이 11명</option>
									<option value="12">어린이 12명</option>
									<option value="13">어린이 13명</option>
									<option value="14">어린이 14명</option>
									<option value="15">어린이 15명</option>
								</select>
							</div>
						</div>
					</div>

					<br>
					<button type="button" class="search"
						onclick="location.href='search.jsp';"
						style="width: 100%; height: 50px;">검색하기</button>
					<br> <br>
				</div>
			</div>
		</div>
		<script>
			$('.search').on('click',function(){
				$('.area').css('display','hidden');
			});
		</script>
		<br> <br>


		<div class="container area">
			<h2>추천 지역</h2>
			<br /><br />
			<div class="row">
				<div class="col-sm-3">
					<div class="container">
						<a href="#" id="애월읍" data-toggle="tooltip" title="<%=rec.getCntRoom()%>개 숙소"></a>
					</div>

					
					<div class="thumbnail">
						<a href="상세 페이지.html" target="_blank">
							<div class="areathumbnail">
								<img src="resources/images/애월읍.jpg" class="areaimg"
									style="height: 160px;"> 애월읍</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-sm-3">
				<div class="container">
						<a href="#" id="제주시" data-toggle="tooltip" title="<%=rec.getCntRoom()%>개 숙소"></a>
					</div>
					<div class="thumbnail">
						<a href="상세 페이지.html" target="_blank">
							<div class="areathumbnail">
								<img src="resources/images/제주시.jpg" class="areaimg"
									style="height: 160px;"> 제주시</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-sm-3">
				<div class="container">
						<a href="#" id="서귀포시" data-toggle="tooltip" title="<%=rec.getCntRoom()%>개 숙소"></a>
					</div>
					<div class="thumbnail">
						<a href="상세 페이지.html" target="_blank">
							<div class="areathumbnail">
								<img src="resources/images/서귀포시.jpg" class="areaimg"
									style="height: 160px;"> 서귀포시</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-sm-3">
				<div class="container">
						<a href="#" id="우도" data-toggle="tooltip" title="<%=rec.getCntRoom()%>개 숙소"></a>
					</div>
					<div class="thumbnail">
						<a href="상세 페이지.html" target="_blank">
							<div class="areathumbnail">
								<img src="resources/images/우도.jpg" class="areaimg"
									style="height: 160px;"> 우도</span>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
			<script>
				$(document).ready(function(){
				    $('[data-toggle="tooltip"]').tooltip('show');  
				});
			</script>
		<br>

		<div class="container room">
			<h2>인기 숙소</h2>
			<div class="row" id="inn_thumb"></div>
			
		</div>
		<script>
			 $(function(){
				 $.ajax({
					 url: "<%=request.getContextPath()%>/areaCount.ho",
					 type: "get",
					 success : function(data){
						 for(var i in data){
							 console.log(data[i].area+" : "+data[i].cntRoom);
							 $('#'+data[i].area).text(data[i].cntRoom+"개 숙소");
							 /* var str = $('#'+data[i].area).text(data[i].cntRoom+"개 숙소");
							
							 $('.tooltip'){
								 title: str;
							 } */
							 
							 //var str = '<a href="#" data-toggle="tooltip" title="'+data[i].area+data[i].cntRoom+'개 숙소")"></a>';
							
						 }
					 }
				 });
				 
				$.ajax({
					url:"<%=request.getContextPath()%>/rList.ho",
					type:"get",
					success:function(data){
						// 전체 영역
						var $div = $('#inn_thumb');
						
						for(var i in data){
							var str = '<div class="col-sm-3">' 
								+ '<div class="thumbnail">'
							+'<a href="상세 페이지.html" target="_blank"> '
							+'<img src="'+data[i].file_path+data[i].change_name+'.jpg" class="img" style="height:190px;">'
							+' <div class="caption">'
							+'<p>'+data[i].r_name+'</p>'
							+'<p id="price">'+data[i].price+'</p>'
							+'</div></a></div></div>';
							
							$div.append(str);
						}
					}
				});
			}); 
		</script>

		<br>
		
		<div class="container trip">
			<h2>인기 트립</h2>
			<div class="row" id="trip_thumb"></div>
		
		</div>
		<script>
			$(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/tList.ho",
							type : "get",
							success : function(data) {
								// 전체 영역
								var $div = $('#trip_thumb');

								for ( var i in data) {
									var str = '<div class="col-sm-3">'
											+ '<div class="thumbnail">'
											+ '<a href="상세 페이지.html" target="_blank"> '
											+ '<img src="'+data[i].file_path+data[i].change_name+'.jpg" class="img" style="height:190px;">'
											+ ' <div class="caption">' + '<p>'
											+ data[i].t_name + '</p>'
											+ '<p id="price">' + data[i].price
											+ '</p>' + '</div></a></div></div>';

									$div.append(str);
								}
							},
							error : function(data) {
								console.log("실패!");
							}
						});
			});
		</script>
	</div>

</body>
</html>