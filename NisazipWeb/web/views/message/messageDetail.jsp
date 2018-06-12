<%@page import="kh.message.model.service.MessageService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.message.model.vo.* ,java.util.*"%>
    <%
    	Message message =(Message)request.getAttribute("message");
    	int day = (int) request.getAttribute("day");
    	ArrayList<MessageContent> mclist =(ArrayList<MessageContent> )request.getAttribute("mclist"); 
    	HashMap<String,String> hostInfo = (HashMap<String,String> ) request.getAttribute("hostInfo");
    	
    	/* [START] DEPEND FOR ERROR MESSAGE, IF NULL */
    	//if(mclist == null || hostInfo == null) // go to error page.
    %>
   
<!DOCTYPE html>
<html>
    <head>  
     <style>
		
		.container_right {
		    border: 2px solid #dedede;
		    background-color: #f1f1f1;
		    border-radius: 5px;
		    padding: 10px;
		    margin: 10px 0;
		}
		
		.container_left {
		    border: 2px solid #dedede;
		    background-color: #f1f1f1;
		    border-radius: 5px;
		    padding: 10px;
		    /* margin: 10px 0; */
		    margin-top: 10px;
		    margin-bottom: 10px;
		}
		
		
		
		.chat-message {
		  padding: 10px 20px;
		}
		.message-avatar {
		  max-width: 50px;
		    width: 100%;
		     height: 50px;
		     border-radius: 50%;    
		}
		.message {
		  background-color: #fff;
		  border: 1px solid #e7eaec;
		  text-align: left;
		  display: block;
		  padding: 10px 20px;
		  position: relative;
		  border-radius: 4px;
		}
		.chat-message.left .message {
		  text-align: left;
		  margin-left: 55px;
		  
		}
		.chat-message.right .message {
		  text-align: right;
		  margin-right: 55px;
		}
		
		/* 사진 */
		.chat-message.left .message-avatar {
		  float: left;
		  margin-right: 10px;
		}
		 .chat-message.right .message-avatar {
		  float: right;
		  margin-left: 10px;
		}
		
		/* 날짜 */
		 .chat-message.left .message-date {
		  float: right;
		}
		.chat-message.right .message-date {
		  float: left;
		}
		
		
		/* 내용*/
		.chat-message.right .message-content {
		  text-align: right;
		  /* margin-right: 55px; */
		}
		
		.chat-message.left .message-content {
		  text-align: left;
		  /* margin-right: 55px; */
		}
		
		
		
		/* 나 */
		.chat-message.right .message-author{
		text-align: right;
		}
		
		
		
		.message-date {
		  font-size: 12px;
		  /* color: #888888; */
		  color:black;
		}
		.message-content {
		  display: block;
		}
		hr{
			margin-top: 20px !important;
		    margin-bottom: 10px !important;
		}

</style>
</head>
<body>
 <%@ include file ="../common/header3.jsp"%>
<br /><br /><br /><br /><br />
 <%
 	// 메시지 보낼사람 찾기
 	String receiver = null;

 	if (m.getUser_id().equals(message.getM_writer()))
 		receiver = message.getM_receiver();
 	else if (m.getUser_id().equals(message.getM_receiver()))
 		receiver = message.getM_writer();
 	else
 		receiver = "살려주세요 ㅠㅠ";

 	//사진찾깈
 	HashMap<String, String> hmap = new MessageService().findProfile(m.getUser_id());
 	String userProfile = hmap.get("profile");

 	HashMap<String, String> hmap2 = new MessageService().findProfile(receiver);
 	String yourProfile = hmap2.get("profile");
 	String yourName = hmap2.get("userName");
 %>

<div class="container" style="background-color: white; " >
    <input type="hidden" name="m_no" id="m_no" value="<%= message.getM_no() %>" />
     <br />
      <h2 > <b  style="text-decoration:underline"><%= yourName %> </b>님과 대화해 보세요!</h2>
                
    <div class="row "  ">

        <div class="col-sm-4 container_left  " style="text-align: center; background-color: white; " >
            <img src="<%=request.getContextPath()%>/resources/memberImg/<%=yourProfile%>"alt="사진없음"  style="width:50%; margin: 0 auto; " class="img-circle "  >
            <h2><%=yourName %></h2>
            <hr style="border :1px solid #a1a1a1;">
            <h4 >문의 내용</h4>
            <div class="container_left" style="background-color: white;">
            	<%=message.getM_content() %>
          
            </div>
            <div class="container_left" style="background-color: white;">
                 <span class="label label-success">  <b> 호스팅이름 </b></span> <br>
                <span> <b><%=hostInfo.get("hostingName") %></b></span>
                <hr>
                    <div class="row">
                        <div class="col-sm-5">
                            <span class="label label-success">  <b> 체크인 </b></span> <br>
                            <span ><%= message.getCheckin().substring(0, 10)  %> </span>
                        </div>
                        <div  class="col-sm-2"> ~ </div>
                        <div  class="col-sm-5">
                            <span class="label label-success">  <b>체크아웃</b> </span> <br>
                            <span><%= message.getCheckout().substring(0, 10) %> </span>
                        </div>
                    </div>

                    <hr>
                    <div >
                        <span class="label label-success"><b>인원</b></span> <br>
                        <span> <%=message.getGuest_num() %> 명 </span>
                    </div>

                    <hr>
                    <div >
                   
                        <span class="label label-success"><b> 예상 금액</b></span><br>
                        <span> <%=hostInfo.get("price") %> 원 (1일 기준) </span><br>
                        <span>x <%=day %> 일</span><br>
                        <span>x <%=message.getGuest_num() %> 인</span>
                          <hr style="border :1px solid #a1a1a1;">
                        <% int total= (int)(message.getGuest_num() * day  * Integer.parseInt(hostInfo.get("price")) * 1.1);%>
                        <span><b> <%=  total %> 원 </b> <br />(부가세 10% 포함)</span>
                    </div>

            </div>
        </div>

        
        <!--오른 전체칸 -->
        <div class="container   col-sm-6 col-sm-offset-1 " style="background-color: white; ">
              
	        <!-- 내용출력칸  #f4f5f5-->
		   <div id="chat"class= "container_right" style="overflow-y:scroll;  height:650px; background-color: rgb(168, 207, 168); ">
					<!-- <div align="center"><h3>대화를 시작해보세요</h3><hr /></div> -->
             <% if(mclist!=null){ %>
                 	<% for(MessageContent mc :mclist) {
                      		
                      		if(m.getUser_id().equals(mc.getMs_writer())){
                      			%>
                      			  <div id="me" class="chat-message right">
                             <img id ="profile"class="message-avatar" src="<%=request.getContextPath()%>/resources/memberImg/<%=userProfile%>"alt="사진없음"> 
                                <div id= "message-author" class="message-author" > 나</div>
                            <div id= "message" class="message" style="background-color:rgb(255, 255, 102);" >
                                <span id="message-content" class="message-content"><%=mc.getMs_content() %></span>
                            </div>
                                <div id= "message-date" class="message-date">  <%=mc.getMs_date_time() %> </div>
                        </div>  
                      		<% } else{%>
                        	 <div id="you"class="chat-message left">
                                <img id ="yprofile" class="message-avatar"  src="<%=request.getContextPath()%>/resources/memberImg/<%=yourProfile%>"alt="사진없음">
                                    <div  id= "ymessage-author"  class="message-author" >  <%=yourName %></div>
                             		  <div id= "ymessage" class="message">
                                    <span id="ymessage-content"  class="message-content"><%=mc.getMs_content()%></span>
                             		  </div>
                                    <div id= "ymessage-date" class="message-date"> <%=mc.getMs_date_time() %> </div>
                            </div> 

                      <%} %>
                      <%} %>
                 <%} %>
            
            </div>
            

            <!-- 메세지 보내기 -->
                <div class= "container col-sm-12"  style="background-color: white; border: 2px solid #dedede; ">  
                    <div class="row " style="padding:10px;">
                    	<div class="input-group " style="width:100%;">
	                        <textarea id ="ms_content" name="ms_content" class="form-control" rows="2" style="border:none; width:80% "></textarea>
	                        <input class ="btn btn-success" type="button" value="보내기" onclick="sendMS();"style="width:20%; height:52px;" >
                        </div>
                    </div>
                   <p id = "keyCounter" align=right> 0/200 자</p>
                   
     		   </div>
  		  </div>
	</div>
</div>

<script>
	var webSocket = new WebSocket('ws://localhost:8088'+'<%=request.getContextPath()%>/unicast');

	// 메시지를 받을 때 표현할 html 작성
	webSocket.onmessage = function(event){
		onMessage(event);
	}
	
	function onMessage(event) {
	var message = event.data.split("|");
		
		// 보낸 사람의 ID
		var sender = message[0];
		var content = message[1];
		var time = message[2];

		if(content == ""||sender.match("<%=receiver%>")  ){
		
		} else {
			
			
	 var $chat =$('#chat').addClass('container_right');
			
		$chat.html($chat.html()+" <div id='you' class='chat-message left'><img id ='yprofile' class='message-avatar'  src='<%=request.getContextPath()%>/resources/memberImg/<%=yourProfile%>'alt='사진없음'>" 
							+ "<div  id= 'ymessage-author'  class='message-author' >" +sender +   "<div id= 'ymessage' class='message'><span id='ymessage-content'  class='message-content'>"
							+ content.replace(/[\r\n]/gim,"<br>") +"</span> </div><div id= 'ymessage-date' class='message-date'>" +time+" </div></div> ");

		$('#chat').scrollTop($('#chat')[0].scrollHeight);
		}
	}
	

	

	function sendMS(){
		var date = new Date();
		var year = date.getYear() + 1900; 
		var month = date.getMonth() + 1; 
			month = month >= 10 ? month : '0' + month;
		var day = date.getDate(); //day는 현재 일자의 요일을 나타냄. 0 = 일요일 1 = 월요일
			day = day >= 10 ? day : '0' + day;
		var hour = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		var time = year + "-" +month + "-" + day + " " + hour + ":" + min + ":" +sec;
			
		if($('#ms_content').val()==""){
			alert('메시지를 입력해주세요');
			return false;
		}
		// 서버로 보낼 데이터 작성
		 var $chat =$('#chat').addClass('container_right');
		$chat.html($chat.html()+" <div id='you' class='chat-message right'><img id ='yprofile' class='message-avatar'  src='<%=request.getContextPath()%>/resources/memberImg/<%=userProfile%>'alt='사진없음'>" 
							+ "<div  id= 'ymessage-author'  class='message-author' >" +"나" +   "<div id= 'ymessage' class='message' style='background-color:rgb(255, 255, 102);'><span id='ymessage-content'  class='message-content'>"
							+ $('#ms_content').val().replace(/[\r\n]/gim,"<br>") +"</span> </div><div id= 'ymessage-date' class='message-date'>"+ time+ "</div></div> ");
		
		$('#chat').scrollTop($('#chat')[0].scrollHeight);
		
		webSocket.send("<%=m.getUser_name() %>|"+ $('#ms_content').val()+ "|"+time);

		 $.ajax({
				url:'<%= request.getContextPath()%>/msInsert.ms',
				type:'post',
				data :{ 
					m_no : $('#m_no').val(),
					ms_content :$('#ms_content').val(),
					ms_writer : '<%= m.getUser_id()%>',
					ms_receiver : '<%= receiver%>'
				}, success: function(data){
					if(data!=null){
						$('#ms_content').val('');
						$('#keyCounter').html("0/200 자");
						
						unReadChk();
						
					} 
					else{
						alert('실패');
					}
				}		
		 });
		 
 
	
	}
		
	function unReadChk(){
		 $.ajax({
				url:'<%= request.getContextPath()%>/unread.ms',
				type:'post',
				data :{ 
					m_no : $('#m_no').val()
				
				}, success: function(data){
					if(data==1){
					console.log('성공');						
					} 
					else{
						alert('실패');
					}
				}		
		 });
		 
	}
	

	
	$(function(){
		$('#ms_content').keyup(function(){
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

</script>
</body>
</html>
