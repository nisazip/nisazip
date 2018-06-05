<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
       <title>신분증인증</title>      
      

<style type="text/css">


.btn-file{
position :relative;
overflow: hidden;
}
.btn-file input[type=file]{
	position :absolute;
	top :0;
	right :0;
	min-width:100%;
	min-height:100%;
	font-size:100px;
	text-align :right;
	filter :alpha(opacity=0);
	opacity :0;
	outline : none;
	background :white;
	cursor :inherit;
	display: block;
}

</style>
<script type="text/javascript">
	function certificationModal(){
		$("#myModal5").modal();
	}

</script>
</head>




<body>

<%@ include file= "../../views/common/header.jsp" %>


<div id="main">
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 sidenav">
  
      <ul class="nav nav-pills nav-stacked">
        
        <li><a href="/semi/views/member/memberUpdate.jsp">사용자 정보 수정/추가</a></li>
        <li><a href="/semi/views/member/certification.jsp">사진 등록 및 인증</a></li>
        <li><a href="/semi/views/member/myBin.jsp">보관 목록</a></li>
      </ul><br>
      <br><br><br><br><br><br><br>
    </div>


  <div class="col-sm-6"> 
    
    		<div class="col-sm-12 col-xs-12" style="">
    			<fieldset>		
    			<legend>신분증 사진 올리기</legend>	
    			<div class="row">
	    			<div class="col-lg-3 xs-hidden"></div>	
    			 	<div class="col-lg-9 panel panel-danger">
      					<div class="panel-heading">일부 숙소를 예약하려면 신분증을 제출해야 합니다. 지금 신분증을 인증하여 여행에 미리 준비하세요. 신분증은 호스트에게 공개되지 않습니다. </div>
    				</div>   
    				<br>
    				<div class="col-lg-3 xs-hidden"></div>	
    				<div class="col-lg-9 panel panel-info">
      					<div class="panel-heading">인증 완료 방법 </div>
     				   <div class="panel-body">1. 프로필 사진을 아직 올리지 않았다면, 프로필 사진을 올리세요.   <br>
											2. 정부에서 발급한 신분증의 사진을 올리세요(예: 여권, 운전면허증, 비자 등). <br><
											업로드 시, 셀카 사진과 신분증의 사진은 동일한 인물이어야 하고, 유효한 신분증이어야 합니다.  개인정보 보호를 위해 사진을 올리기 전에 주민등록번호가 보이지 않도록 편집해주세요. 주민등록번호를 제외한 다른 정보는 모두 잘 보여야 합니다.</div>
    				</div>   
    				<div class="col-lg-3 xs-hidden"></div>	
    				<div class="col-lg-9 panel panel-info">
      				
     				  <div class="panel-body">업로드 시, 셀카 사진과 신분증의 사진은 동일한 인물이어야 하고, 유효한 신분증이어야 합니다.  개인정보 보호를 위해 사진을 올리기 전에 주민등록번호가 보이지 않도록 편집해주세요. 주민등록번호를 제외한 다른 정보는 모두 잘 보여야 합니다.</div>

    				</div>   
    			</div>		
    			<div class="row">
	    			<div class="col-lg-4 xs-hidden"></div>
	    			<div class="col-lg-7 col-xs-12">	
		    		   
						<center><img alt="" id="presentProfileImg"  class="align-center" style="width:300px; height: 200px; box-shadow: 4px 4px 3px gray;;"></center>
			    			<br><br>
    					<center><button class="btn btn-success" type="submit" style="width: 80%;" onclick="certificationModal();">신분증 입력/수정</button></center>
    				</div>
    			</div>
    			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    			</fieldset>   
    		</div>
</div>


<div id="myModal5" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">신분증 인증<span class=""></span></h4>
      </div>
      <div class="modal-body">
       	<div class="row">
       		<div class="col-sm-3 xs-hiiden"></div>       
       		<div class="col-sm-6 col-xs-10">
        	 <form  id="" role="form" action="<%= request.getContextPath()%>/certification.pic"  method="post" enctype="multipart/form-data">            
	             <div class="form-group">
	              
	              <img alt="" id="titleImg">
	              <input type="file"  id="profilePicture" name="profilePicture" onchange="LoadImg(this);">
	              <input type="hidden" value="<%= m.getUser_id()%>" name="uploadId">
	              
	            </div>
	            
	             <button type="submit" class="btn btn-success btn-block" style="width: 100%;"><span class="glyphicon glyphicon-off"></span>입력</button>
            </form>
            </div>
            <div class="col-sm-3 xs-hiiden""></div>
     	 </div>
      </div>
      <div class="modal-footer">
     	 
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script type="text/javascript">
$(function(){
	var id = "<%=m.getUser_id()%>";
		console.log(id);
		$.ajax({
			url:'/semi//presentCer.pic',
			type:'get',
			data:{id:id},
			success:function(result){
			$("#presentProfileImg").attr("src", "<%=request.getContextPath()%>\\resources\\thumbnail_uploadFiles\\"+result);		
			},
			error:function(){
			    alert("에러입니다");
			}
		});
								
	});
	
function LoadImg(value, num) {
    if (value.files && value.files[0]) {
       var reader = new FileReader();
       reader.onload = function(e) {
         
             $("#titleImg").attr("src", e.target.result).css({"width":"300px","height":"200px"});	          
       }
       reader.readAsDataURL(value.files[0]);
    }
 }
</script>


</body>
</html>