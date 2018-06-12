<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

<!DOCTYPE html>
<html>
<head>
       <title>Update</title>      
      

<style type="text/css">
 img{
   width: 21%;
    height: 20%;
 }

 select {
    width: 21%;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: gray;
    border: 1px solid lightgray;
    border-radius: 3px;
}

.phone input[type=text]{
    width: 21%;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: gray;
    border: 1px solid lightgray;
    border-radius: 3px;
}
.nav-stacked>li.sele>a{
 
   color:white;
}
.nav-stacked>li>a:hover{
 
   color:black;
}

.item {
    position: relative;
    width: 100%;
    max-width: 400px;
    text-align: center;
}

.item #presentProfileImg {
    width: 100%;
    height: auto;
}

.item .btn {
    position: absolute;
   	
    top: 50%;
    left: 50%;
    transform: translate(100%, -220%);
    -ms-transform: translate(120%, -220%);
    background-color: black;
    background: transparent;
    color: gray;
    font-size: 15px;
    padding: 12px 24px;
    border: none;
    cursor: pointer;
    border-radius: 10px;
    text-align: center;
}
.item .btn >p{
 font-size: 4px;
 text-align: center;
}
.item .btn:hover {
    color: red;
    background-color: transparent;
    background: transparent;
}

</style>
<script>
	function profileModal(){
		$("#myModal4").modal();
		
	}
	function delMem(){
		$("#delMem").modal();
	}
</script>
</head>




<body>

<%@ include file= "../../views/common/header.jsp" %>


<div id="main">
	<div class="row content">
		<div class="col-sm-1 " ></div>  
    	<div class="col-sm-2 sidenav xs-hidden" >
  
			<ul class="nav nav-pills nav-stacked" data-spy="affix xs-hidden"  >
        
		        <li><a href="/semi/views/member/memberUpdate.jsp">사용자 정보 수정/추가</a></li>
		        <li><a href="/semi/views/member/certification.jsp">인증</a></li>
		        <li><a href="/semi/storage.do?id=<%= m.getUser_id()%>">보관 목록</a></li>
		        <li class="sele" style="background:#5cb85c"><a href="/semi/views/member/account.jsp">계정 관리</a></li>
			</ul><br>
      		<br><br><br><br><br><br><br>
    	</div>


    <div class="col-sm-6"> 
    	<div class="col-sm-12 col-xs-12" style="">
		
        	<form id="ccheck" class="form-horizontal" action="<%=request.getContextPath()%>/changePwd.me" method="post">  
      			<fieldset>
        		<legend>비밀번호 변경</legend>
        		 <input type="hidden" value="<%=m.getUser_id()%>" name="cgPwdid">
        		
        		<input type="hidden" value="<%=m.getPassword()%>" name="presentPwd">
        		
      			<div class="form-group">
             		 <label class="control-label col-sm-3" for="pwdc"> 기존 비밀번호:</label>

       				 <div class="col-sm-9"><input type="password" class="form-control" id="pwdc"  name="prePwd" ></div>
      			 </div>
      			 <div class="form-group">
             		 <label class="control-label col-sm-3" for="pwdc2"> 새 비밀번호:</label>

       				 <div class="col-sm-9"><input type="password" class="form-control" id="pwdc2"  name="pwd" ></div>
      			 </div>
      			<div class="form-group">
             		 <label class="control-label col-sm-3" for="pwdc3"> 새 비밀번호  확인 :</label>

       				 <div class="col-sm-9"><input type="password" class="form-control" id="pwdc3"  name="pwd"  ></div>
      			 </div> 
       			
						
				
			<div class="form-group">
			 <div class=" col-sm-3"></div>
			 <div class=" col-sm-9"><center><button id="changePwd" type="submit" class="btn btn-success" style="width:60%;" >비밀번호 변경</button></center></div>
 			</div>
			
      		</fieldset>  
      			<hr>

   		  </form>
   		  
   		<fieldset>
	   		<legend> 계정 삭제 </legend>
	   			<div class="row">
	   			<div class="col-sm-3"></div>
	   			<div class="col-sm-9 panel panel-danger">
      					<div class="panel-heading">계정을 삭제하면  </div>
     				   <div class="panel-body">  재활성화하거나, 데이터를 복구하거나, 계정에 다시 접근할 수 없습니다. <br>
												또한, 호스트 또는 게스트로서 예정된 모든 예약이 자동으로 취소됩니다.<br><br>
						<center><button type="button" class="btn btn-danger" style="width:60%; text-align: center; align:center;" onclick="delMem();">탈퇴</button></center>						 
   		
					</div>
					
					</div>
					</fieldset>
    	</div> 
	   		
   			
   		  
   		  
	</div>
    
    </div>
</div>



<div id="delMem" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background: #e06377; color:white;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" >계정 삭제<span class=""></span></h4>
      </div>
      <div class="modal-body">
      	<div class="row">
		  	<div class="col-sm-2"></div>
		       <div class="col-sm-8">	
		       <br>	 
		        <form action="<%=request.getContextPath()%>/myAccount.del">		
		       			 <center>계정을 삭제하면 데이터를 복구할 수 없습니다.</center>		
						<center>정말 계정을 삭제하시겠습니까?</center>
				<input type="hidden" value="<%=m.getUser_id()%>" id="profDelId" name="profDelId">
				 	<br>	
				<button id="authDelSubmit" type="submit" class="btn btn-danger btn-block" style="width: 100%;">삭제</button>
				</form>
				</div>
      		<div class="col-sm-2"></div>     
     	 
     </div>
      <div class="modal-footer">
     	 
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
  
</div>


<script>

var pwdch1 = false;
var pwdch2 = false;
var pwdch3 = false;

	
if(pwdch1 == false ){
	$("#changePwd").attr('disabled','disabled');
}
	
$("#pwdc").on("keyup",function(){
	   if ($(this).val()!='' && $(this).val()!=null && $(this).val().length !=0   ) {
           
           pwdch1= true;     
			if( pwdch1 ==true &&  pwdch2 ==true &&  pwdch3 ==true){
           	$("#changePwd").removeAttr("disabled")	            	
           	}
          }else{
           $("#pwdc").css("border","1px solid red");
           pwdch1= false
          }
	
	
});



$("#pwdc2").on("blur",function(){
            regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,}$/;
            v = $(this).val();
            if (regexp.test(v)) {
                $("#pwdc2").css("border","1px solid green");
                pwdch2= true;
                
                
				if( pwdch1 ==true &&  pwdch2 ==true &&  pwdch3 ==true){
	            	$("#changePwd").removeAttr("disabled")	            	
	            	}
               }else{
                $("#pwdc2").css("border","1px solid red");
                pwdch2= false
               }
});

$("#pwdc3").on("keyup",function(){
              
               if($(this).val()==$("#pwdc2").val() && $(this).val() != "" && pwdch2 ==true){
                $("#pwdc3").css("border","1px solid green");
                $(".pwd2Ref").show().fadeOut(2000);
                $(".pwd2Ref2").hide();
                 pwdch3 = true;
                 if( pwdch1 ==true &&  pwdch2 ==true &&  pwdch3 ==true){
 	            	$("#changePwd").removeAttr("disabled")
 	            	
 	            	}
					
               }else{
                $("#pwdc3").css("border","1px solid red");
                pwdch3= false;

               }
});
	


</script>	
			
			
			

</body>
</html>