<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, kh.message.model.vo.*"%>
    
    <%
    ArrayList<HashMap<String, Object>> mlist = (ArrayList<HashMap<String, Object>>)request.getAttribute("mlist");
    ArrayList<HashMap<String, Object>> rlist = (ArrayList<HashMap<String, Object>>)request.getAttribute("rlist");
    %>
<!DOCTYPE html>
<html>
    <head>  

     <style>
		.time-right {
		    float: right;
		     color: #aaa;
		
		}
		 img{
		    max-width: 60px;
		    width: 100%;
		     height: 60px;
		     border-radius: 50%;  
		}
		.list{
		    border: 2px solid #dedede;
		    background-color: white;
		    border-radius: 5px;
		    padding-top: 10px;
		    margin: 10px 0;		 
		}
		.target { 
			/* 한 줄 자르기 */
			 display: inline-block; 
			 width: 80%; white-space: nowrap; 
			 overflow: hidden; text-overflow: ellipsis; 
			/* 여러 줄 자르기 추가 스타일 */
			 white-space: normal; line-height: 1.2; 
			 height: 2.4em; text-align: left; 
			 word-wrap: break-word; 
			display: -webkit-box; 
			-webkit-line-clamp: 2; 
			-webkit-box-orient: vertical; 	
		}
	</style>
</head>
<body>
 <%@ include file ="../common/header3.jsp"%>

  
	<div class="container col-sm-5" style="margin-left:30%; margin-top:7%;">
		<div class="row">
			  <h2>메시지 보관함</h2>
			  <br>
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist">
				    <li class="nav-item"   style=" margin-left: 0px;">
				      <a class="nav-link active" data-toggle="tab" href="#home">받은 메시지</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link"  style=" margin-left: 0px;" data-toggle="tab" href="#menu1">보낸 메시지</a>
				    </li>
			  </ul>
		</div>
  <!-- Tab panes -->
  	<div class="container col-sm-12">
  	  		<div class="tab-content  ">
			    <div id="home" class="container tab-pane active col-sm-12 "><br>
			         	
			         	<%if(rlist.size()==0) {%>
			         			<div class=" jumbotron" style="text-align:center; width:100%;">
			         				<h3>메시지가 없습니다. </h3> <br />
			         				<button class="btn btn-success">숙소 보러가기</button>
			         				<button class="btn btn-success">트립 보러가기</button>
			         			</div>
			         	<%}%>			 		         	
			           		<%
			             	for(int i = 0 ; i<rlist.size(); i++){
			           			HashMap<String, Object> hmap = rlist.get(i);   	  	
			           		%>
				        	
					   		   	<div class="row list "  style="border: 2px solid #dedede; ">
					   		   		<input type="hidden" id="m_no" name="m_no" value="<%=hmap.get("m_no") %>" />
					                
					                <!-- 받은 메시지 -->
					              
					              <div class="col-sm-2" style="text-align: center;">
					                    <img value ="<%=hmap.get("senderProfile") %>" src="<%=request.getContextPath()%>/resources/memberImg/<%=hmap.get("senderProfile") %>" alt="사진없음" style="width:100%;"> 
					                    <p><%=hmap.get("senderName") %> </p> 
					                </div>
					                  <div class="col-sm-4 "  >
					                          <span class="label label-success" style="margin-bottom:10px;">호스팅  정보</span> 
					                        <span class="target" > <%=hmap.get("hostingName") %> </span> 
					                </div>
					
					                <div class="col-sm-6 ">
					                           <span class="label label-success" style="margin-bottom:10px;">문의 내용</span> <span class="label label-danger"><%=  hmap.get("mRead")%></span> <br />
					                       <span class="target"> <%=hmap.get("m_content") %> </span>
					                    <span class="time-right ">  <%=hmap.get("m_date_time") %></span>
					                </div>        
			
					           </div>	 
					          
			           	<%}%> 
			    </div>
			    <div id="menu1" class="container tab-pane fade col-sm-12"><br>
			   		
			   			 <%if(mlist.size()==0) {%>
			         			<div class=" jumbotron" style="text-align:center;">
			         				<h3>메시지가 없습니다. </h3> <br />
			         				<button class="btn btn-success">숙소 보러가기</button>
			         				<button class="btn btn-success">트립 보러가기</button>
			         			</div>
			         	<%}%>
			         	
			        	<% for(int i = 0 ; i<mlist.size(); i++){
			           		HashMap<String, Object> hmap = mlist.get(i);   	
			           	%>
			                 
			           		<!-- <div class="badge badge-light">보낸메시지</div> -->
					   		   	<div class="row list" style="border: 2px solid #dedede; ">
					   		   		<input type="hidden" id="m_no" name="m_no" value="<%=hmap.get("m_no") %>" />
					                
					                <!-- 보낸메시지 -->
					              
					                <div class="col-sm-2" style="text-align: center;">
					                    <img value ="<%=hmap.get("senderProfile") %>" src="<%=request.getContextPath()%>/resources/memberImg/<%=hmap.get("senderProfile") %>" alt="사진없음" style="width:100%;"> 
					                    <p><%=hmap.get("senderName") %> </p> 
					                </div>
					                  <div class="col-sm-4 "  >
					                          <span class="label label-success" style="margin-bottom:10px;">호스팅  정보</span> 
					                        <span class="target" > <%=hmap.get("hostingName") %> </span> 
					                </div>
					
					                <div class="col-sm-6 ">
					                           <span class="label label-success" style="margin-bottom:10px;">문의 내용</span> <span class="label label-danger"><%=  hmap.get("mRead")%></span> <br />
					                       <span class="target"> <%=hmap.get("m_content") %> </span>
					                    <span class="time-right ">  <%=hmap.get("m_date_time") %></span>
					                </div>      
			
					           </div>	 
					        
			           	<%}%> 
			           	
			    </div>
			    
 		 </div>
	</div>
</div>





	<script>
	 	$(function(){
			$('.list').mouseenter(function(){
				$(this).css({
	                "background" : "#dedede",
					"cursor":"pointer"});
			}).mouseleave(function(){
	            $(this).css({
	                "background" : "white"
					});
			}).click(function(){
				var num = $(this).find('input').val();
				var profile=$(this).find('img').val();
				console.log(num);
				console.log(profile);
				  location.href="<%=request.getContextPath()%>/messageSelect.m?m_no="+num; 
			});
		});
		
	</script>



</body>
</html>
