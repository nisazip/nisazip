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


  <div class="col-sm-5"> 
    
    		<div class="col-sm-12 col-xs-12" style="">
    			<fieldset>		
    			<legend>신분증 사진 올리기</legend>	
    			
    			<div class="row">
	    			<div class="col-lg-4 xs-hidden"></div>
	    			<div class="col-lg-8 col-xs-12">	
		    		    			
						<center><img alt="" id="presentProfileImg"  class="align-center" style="width:300px; height: 200px; box-shadow: 4px 4px 3px gray;;"></center>
			    			<br><br>
    					<center><button class="btn btn-success" type="submit" style="width: 80%;" onclick="certificationModal();">신분증 입력/수정</button></center>
    				</div>
    			</div>
    			</fieldset>   
    		</div>
</div>


<div id="myModal5" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">프로필 사진 설정<span class=""></span></h4>
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