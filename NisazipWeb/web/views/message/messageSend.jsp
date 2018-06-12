<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
<!--       <link rel="stylesheet" href="/semi/resources/css/bootstrap.css">        
      <script src="/semi/resources/js/jquery-3.3.1.min.js"></script>
      <script src="/semi/resources/js/bootstrap.js"></script>
 -->
     <style>
     
     .modal-dialog {
  width: 50%;
  /* height: 100%; */
  margin: 0;
  padding: 0;
}
.modal-content {
  height: auto;
  /* min-height: 100%; */
  border-radius: 0; 
}



     </style>

    </head>
 <body>
       <%@ include file ="../common/header3.jsp"%>

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />


	  <%if(m==null){ %>
			로그인먼저!
            <h1 >호스트 : <span id="host">호이짜</span> </h1>
        <input type="button" class="btn btn-success" data-toggle="modal" data-target="#messageModal" value="연락하기" onclick="alert('로그인창이동');" >
		
		<% }else {%>
				보내는 사람 이라능 : <input id="m_writer"  name="m_writer" type="hidden" value = "<%= m.getUser_id() %>"/> <%= m.getUser_id() %> <br />
				받는 사람이라능 : <input  id="m_receiver" name="m_receiver" type ="text"/> 상세페이지에서 받을 것   <br />
				호스팅 아이디 정보도 넘겨야함  : <input  id="hosting_id" name="hosting_id" type="text" value="" /> 상세페이지에서 받을 것 EX) R2 /T2 
			
			<input type="button" class="btn btn-success" data-toggle="modal" data-target="#messageModal" value="연락하기" >
		    
		    <div class="container" style="width:100%;">
		        <!-- The Modal -->
		        <div class="modal fade" id="messageModal" >
		          <div class="modal-dialog">
		            <div class="modal-content">
		            
		              <!-- Modal Header -->
		              <div class="modal-header" style="background-color: #5cb85c; color:white;" >
		                <button type="button" class="close" data-dismiss="modal">&times;</button>
		                <h2 class="modal-title" id="who"><b>ooo 님에게 메시지 보내기</b></h2>
		              </div> 
		
		              <!-- Modal body -->
		              <div class="modal-body">
		                    
		                <div class="container " style="width:100%;">
		                    <div class="row " style="width:100%;">
		              		<h3><b>HOST 님에게 연락하기!<b></h3>
		                        <h4> 
		                            <ul>
		                              <li>이곳에 오시게 된 이유는 무엇인가요? </li>
		                              <li>누구와 같이 오시나요?</li>
		                              <li>언제쯤 오시나요?</li>
		                              <li>필요한 것이 있으신가요?</li>
		                              <li>궁금한 점이 더 있으신가요?</li>
		                            </ul>  
		                       </h4>
		                    </div>
		                    
		                    <hr>
		                    
		                    <h3><b>여행계획<b></h3>
		                    <div class="row" style="width:100%;">
		                        <div class="col-sm-4">체크인
		                          <input type="date" id="checkin" name="checkin" class="form-control col1-sm-4  " placeholder="체크아웃">  
		                       </div>
						
		                        <div class="col-sm-4 col-sm-offset-1">체크아웃
		                          <input type="date" id="checkout" name="checkout" class="form-control col1-sm-4  " placeholder="체크아웃">
		                        </div>
		
		                        <div class="col-sm-2 col-sm-offset-1">인원
		                          <input type="number" id = "guest_num" name="guest_num" value="" min="1" max="10" class="form-control" placeholder="명" > 
		                        </div>
		                  	</div>
		                    <hr>
		                     <h4><b>메세지보내기<b></h4>
		                    <div class="row" style="width:100%;">
			                 <textarea class="form-control" rows="5" id="m_content" name="m_content" style="margin-left:10px;"></textarea>
							<p id = "keyCounter" align=right> 0/200 자</p>
		                    </div>
		                        
		                </div>
		              </div>
		              
		                  <div class="modal-footer">
		                        <input type="button" value="보내기" class="btn btn-success col-sm-3 pull-right " onclick="valueChk();">
		                  </div>
		            </div>
		          </div>
		        </div>
		        
		      </div>

      <%} %>
      <hr>
      
     
      
      
         <script>
     	$(function(){
    		$('#m_content').keyup(function(){
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

	function valueChk(){
	console.log($('#checkin').val());
	var stDateArr = $('#checkin').val().split('-');
	var endDateArr = $('#checkout').val().split('-');
	var stDate = new Date(stDateArr[0],stDateArr[1],stDateArr[2]);
	var endDate = new Date(endDateArr[0],endDateArr[1],endDateArr[2]);
	
	
		if($('#checkin').val()==""  || $('#checkout').val()==""||$('#guest_num').val()==""){			
			alert("여행계획을 알려주세요");			
		}else if($('#m_content').val()=="" || $('#m_content').val()==null){
				alert("메시지를 입력해주세요");
		}else if(stDate >endDate){
			alert('기간을 다시 확인해주세요');
		}else{
			 insert(); 
		}
     }
	
	
	/* m_receiver hosting_id checkin checkout guest_num m_content */
	function insert(){
		
		$.ajax({
			url: "<%=request.getContextPath()%>/messageSend.m",
			type : "post",
			data : {
				m_writer : $('#m_writer').val(),
				m_receiver : $('#m_receiver').val(),
				hosting_id : $('#hosting_id').val(),
				checkin : $('#checkin').val(),
				checkout : $('#checkout').val(),
				guest_num : $('#guest_num').val(),
				m_content : $('#m_content').val().replace(/[\r\n]/gim,"<br>")
				
			}, success: function(data){
				if(data==0)
					alert('전송실패');
				else{
					alert('전송완료');
					$('#m_content').val('');
					$('#messageModal').modal('hide');
					
				}
			}, error: function(data){
				console.log('에러');
			}
			
		});
		
	}

  	
      </script>

<hr> <br><br><br><br>
    </body>
</html>