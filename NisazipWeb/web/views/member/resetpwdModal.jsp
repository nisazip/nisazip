<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.vertical-alignment-helper{
display:table;
}



</style>
</head>
<body>
<!-- Modal -->
<div id="myModal3" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">비밀번호를 잊으셨나요?<span class=""></span></h4>
      </div>
      <div class="modal-body">
        <p> 비밀번호를 찾고자 하는 계정의 아이디를 입력하세요</p> 
        <p>	가입 시 입력한 이메일주소로 비밀번호 재설정 링크를 보내드립니다.</p>
        <p> 확인하고 재설정하시기 바랍니다. </p>
        
          <form  id="resetForm" role="form" action="<%= request.getContextPath()%>/send.mail"  method="get">            
             <div class="form-group">
              <label for="resetId"><span class="glyphicon glyphicon-eye-open"></span> 계정 </label>
              <input type="text" class="form-control" id="resetId" name="resetId" placeholder="ID나 EMAIL을 입력하세요">
             </div>            
             <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>이메일 보내기</button>
           </form>
      </div>
      <div class="modal-footer">
     	 
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</body>
</html>