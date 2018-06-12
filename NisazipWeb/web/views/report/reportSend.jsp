<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!--   <link rel="stylesheet" href="/semi/resources/css/bootstrap.css"> 
<script src="/semi/resources/js/jquery-3.3.1.min.js"></script>
 <script src="/semi/resources/js/bootstrap.js"></script>  
 -->
<style>

</style>

</head>
<body>
 <%@ include file="../common/header3.jsp" %>
 		<br /><br /><br /><br /><br /><br />

	<br /><br /><br /><br /><br /><br />
	
	
	<%if(m==null){ %>
	<!-- 신고하기 버튼 --><input type="button" class="btn btn-success" data-toggle="modal"  id ="reportBtn"
		data-target="#reportModal" value="신고하기" onclick="alert('로그인ㅊ아 이동');">	
	
	<%}else{ %>
	<input type="button" class="btn btn-success" data-toggle="modal" id ="reportBtn"
		data-target="#reportModal" value="신고하기">
	


<!-- 모달창 내용 -->
		
		<!-- 신고자 / 신고당하는사람  -->
		신고자: <input type="hidden"   id="rp_writer"name="rp_writer" value="<%=m.getUser_id() %>"/> <%=m.getUser_id() %> <br />
		신고당하는사람: <input type="hidden"  id="rp_receiver" name="rp_receiver" value="신고당하는자 "/> 호스트 아이디  넣기
		
		<div class="container" >
			<!-- The Modal -->
			<div class="modal fade" id="reportModal" >
				<div class="modal-dialog">
					<div class="modal-content">
						
						<!-- Modal Header -->
						<div class="modal-header bg-success" style="background-color: #5cb85c; color:white;" >
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="modal-title" id="who"> ooo 님 신고하기</h2>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div class="container" style="width:100%;">
								<label for="comment">
									<h4><b>1. 신고하는 이유를 알려주세요<b></h4>
								</label> <br>
	
								<div class="form-check">
									<label class="form-check-label"> 
										<input type="radio"class="form-check-input" value="틀린정보" name="rp_type"> 부정확하거나 틀린 정보가 있어요.
									</label>
								</div>
								<div class="form-check">
									<label class="form-check-label">
										 <input type="radio"class="form-check-input" value="불친절" name="rp_type"> 불친절합니다.
									</label>
								</div>
								<div class="form-check">
									<label class="form-check-label"> 
										<input type="radio"class="form-check-input" value="사기" name="rp_type"> 사기입니다.
									</label>
								</div>
								<div class="form-check">
									<label class="form-check-label"> 
										<input type="radio"class="form-check-input"  value="기타" name="rp_type"> 기타
									</label>
								</div>
	
								<hr>
								
								<div class="form-group">
									<label for="rp_content">
										<h4><b>2. 자세히 알려주세요<b></h4>
									</label>
									<textarea class="form-control" rows="5" id="rp_content" name="rp_content"></textarea>
									 <p id = "keyCounter" align=right> 0/200 자</p>
								</div>
							</div>
						</div>
	
						<!-- Modal footer -->
						<div class="modal-footer ">
							<input type="button" value="신고하기" class="btn btn-success col-sm-3 pull-right" id="report" onclick="valueChk();">
						</div>
					</div>
				</div>
			</div>
	
		</div>
<%} %>

	<hr>


	<script>
    
 	$(function(){
		$('#rp_content').keyup(function(){
			var input = $(this).val().length;
			
			var remain = 200 -input;
			
			if(remain<0){
				alert('글자 수 초과');
				$(this).val($(this).val().substring(0,200));
				input--;
			}
			
			$('#keyCounter').html(input+"/200 자");
		});
	});
  	 
  	 
  	 // 빈값 체크
  	 function valueChk(){

 		var rpType =$("input[name='rp_type']:checked").val();
			console.log(rpType);
  		 if( !rpType || $('#rp_content').val()==""  ){
	  	           if(!rpType){
	  	               alert("신고하는 이유를 알려주세요");
	  	           }else if($('#rp_content').val()=="" ){
	  	        	 alert("자세히 알려주세요");
	  	                $('#rp_content').focus();
	  	           }
			}else{
				insert();
			} 		 
  	 }

  	 function insert(){
	  	 $.ajax({
				 url:"<%=request.getContextPath() %>/reportInsert.re",
				 type: "post",
				 data : { rp_writer: $('#rp_writer').val(),
						rp_receiver:$('#rp_receiver').val(),
						rp_type:$("input[name='rp_type']:checked").val(),
						rp_content:$('#rp_content').val()
						},
				success : function(data){
					if(data==0){
						alert('전송실패');
	  				}else{
						alert('전송완료');
						  $('#rp_content').val("");
						  $("input[name='rp_type']:checked").prop('checked',false);
						  $("#reportModal").modal("hide");
						  $('#reportBtn').prop('disabled',true).val('신고완료');
						}
				}, error : function(data){
					console.log("에러");
				}
			 });
  	 }
  	 
	
	</script>


</body>
</html>