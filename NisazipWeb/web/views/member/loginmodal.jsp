<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>


 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-user"></span> Login</h4>
        </div>
        
        
        
        
        
        
        
        <div class="modal-body" style="padding:40px 50px;">
          <form  id="loginForm" role="form" action="<%= request.getContextPath()%>/login.me" method="POST">
            
             <div class="form-group">
              <label for="loginId"><span class="glyphicon glyphicon-eye-open"></span> 계정 </label>
              <input type="text" class="form-control" id="loginId" name="loginId" placeholder="ID나 EMAIL을 입력하세요">
            </div>
            <div class="form-group">
              <label for="loginPwd"><span class="glyphicon glyphicon-lock"></span> 비밀번호</label>
              <input type="password" class="form-control" id="loginPwd" name="pwd" placeholder="패스워드를 입력하세요">
            </div>
            <!-- <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div> -->
            <br>
              <button type="submit" id="loginSubmit" class="btn btn-success btn-block" style="height: 40px;"><span class="glyphicon glyphicon-off"></span>로그인</button>
          </form>
        </div>
        
        
        
        
        
        
        
        
        
        
        <div class="modal-footer">
          <button type="submit" class="btn btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
          <p>아직 회원이 아시니라면  <a data-target="#myModal2" data-toggle="modal" class="MainNavText" data-dismiss="modal" id="MainNavHelp" 
       href="#myModal">회원가입</a></p>
          <p> <a data-target="#myModal3" data-toggle="modal" class="findPwd" data-dismiss="modal" id="" 
       href="#myModal">비밀번호</a>를 잊으셨나요?</p>
          
        </div>
      </div>
      
    </div>
  </div><!-- modal2 end-->


 
<script>

if($("#loginId").val() == ""){
	$("#loginSubmit").attr('disabled','disabled');
}


$("#loginId").on("keyup",function(){
	console.log($("#loginId").val());
	if( $("#loginId").val() != null && $("#loginId").val() != "" && $("#logindPwd").val() != null && $("#loginPwd").val() != "" ){
		$("#loginSubmit").removeAttr("disabled")
		
	}
});

$("#loginPwd").on("keyup",function(){
	if( $("#loginId").val() != null && $("#loginId").val() != "" && $("#loginPwd").val() != null && $("#loginPwd").val() != "" ){
		$("#loginSubmit").removeAttr("disabled")
		
	}
});



//$("#loginPwd").on("keyup",function(){
//	if($("#loginId").val()== null ||$("#loginId").val()== ""|| $("#logPwd").val()== null ||$("#loginPwd").val()== "" ){
//		$("#loginSubmit").attr('disabled','disabled');
//		//$("#loginSubmit").removeAttr("disabled")
//	}else{$("#loginSubmit").removeAttr("disabled")}
//});

</script>

</body>
</html>