	<%@page import="kh.board.model.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.board.model.vo.*, java.util.*"%>
    
     <%
    	Board b = (Board) request.getAttribute("b");
   		  ArrayList<BoardComment> clist =  (ArrayList<BoardComment>) request.getAttribute("clist");  
     
     %>
<!DOCTYPE html>
<html>
    <head>  
       <!-- <script src="/semi/resources/js/jquery-3.3.1.min.js"></script> -->
<!--       <link rel="stylesheet" href="/semi/resources/css/bootstrap.css">        
      <script src="/semi/resources/js/bootstrap.js"></script>
 -->
<!-- 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> -->
 
     <style>
		table th{
		background-color: #eeeeee;
		width:15%;
		text-align: center;
		
		}

	 	.table th, .table td{
		border : 1px solid #a1a1a1;
		 border-left:none;
		border-right:none;
		} 
	
     </style>
<script>
	function prevBoard(){
 		<% Board prevBoard =  new BoardService().prevBoard(b.getB_no()); %>	
 		<%if (prevBoard==null) {%>
	 		alert('이전글이 없습니다.');
 		<%} else{%>
 		var num =<%= prevBoard.getB_no()%>
 		location.href = '<%= request.getContextPath()%>/boardSelect.bo?b_no=' +num ;
 		<%} %>
 	}
	
	function nextBoard(){
		<% Board nextBoard =  new BoardService().nextBoard(b.getB_no()); %>	
		<%if (nextBoard==null) {%>
 		alert('다음글이 없습니다.');
		<%} else{%>
		var num =<%= nextBoard.getB_no()%>
		location.href = '<%= request.getContextPath()%>/boardSelect.bo?b_no=' +num ;
		<%} %>
	}
</script>
    </head>
    <body>
         <%@ include file="../common/header4.jsp" %>
        <br><br><br><br><hr>
<!--  -->

        <div class="container col-sm-6">
        	<h1 align="left">Q & A 게시판</h1>
        	<p> <i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은 글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i></p>
        	<br />
                <div class="row">
                    <table class="table table-bordered1" style="text-align: center; table-layout: fixed; ">
		                   <colgroup>
			                    <col width="10%">  <!-- 글 번호 -->
			                    <col width="20%">   <!--  제목   -->
			                    <col width="10%"> <!-- 작성자 -->
			                    <col width="20%"> <!-- 작성일 -->
			                    <col width="10%">
			                    <col width="20%">
			                </colgroup>
                       	 <tbody>
                                <tr>
                                    <th > 제목</th>
                                    <td colspan="5" ><%= b.getB_title() %>
                                    	<input type="hidden" name="b_no" value="<%= b.getB_no()%>"> 
                                    </td>
                                   
                                </tr>
                                <tr>
                                    <th >작성자</th>
                                    <td><%= b.getB_writer() %></td>
                                    <th >작성시간</th>
                                    <td><%= b.getB_date_time() %></td>
                                    <th> 조회수</th>
                                    <td><%= b.getB_count() %></td>
                                </tr>   

                                <tr>
                                    <td colspan="6" style="min-height: 200px; text-align: left; border-bottom: 2px solid #a1a1a1;">
                                     <pre style="word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;
                                     white-space: -o-pre-wrap;word-break:break-all;"><%= b.getB_content()%></pre></td>
                                </tr>
                        </tbody>
                    </table>
                    
                </div>
  					<div class=" row justify-content-end">
  						 <% if(m!=null&& m.getUser_name().equals(b.getB_writer())){ %>
  						 <input type="button" class="btn btn-success " onclick = "goUpdateView();" value="수정"> &nbsp;
  						 <%} if(m!=null  && m.getUser_id().equals("admin") || m!=null&& m.getUser_name().equals(b.getB_writer()))   {%> 
                         <input type="button" class="btn btn-success " onclick= "goBoardDelete(); "value="삭제"> &nbsp;
     				      <%}  %>
     				    
     				    
     				      <input type="button" class="btn btn-success " onclick = "getList();"value="목록">
        			</div>
                    
             
                
            </div>

<br /><br />
            <!--  -->        
            <div class="container col-sm-6 ">
           
            <%  if( clist!=null){
					    for(BoardComment bc :clist){  %>
               
				 <div class="row">
                    <h3> 답변 </h3>   
                </div>
               
	                <div class="row table">
	                    <table class="col-sm-12"  >
	                        <tbody>
	                            <tr>
	                                <th >작성자
	                                </th>
	                                <td width="35%" align="center"> <%= bc.getC_writer() %></td>
	                                <th >답변시간</th>
	                                <td width="35%" align="center"><%=bc.getC_date_time() %></td>
	                            </tr>
	                            <tr>
	                                <td colspan="4" ><%=bc.getC_content().replace("\r\n", "<br>")%></td>
	                           </tr>
	                            <!-- 관리자일때만-->
	                            <% if(m!=null && m.getUser_id().equals("admin")){ %>
	                            <tr>    
	                                <td colspan="4" align="right" style="border-bottom:none;">
	                                	<input type="hidden" id="c_no" name="c_no" value=<%=bc.getC_no() %>>   	
	                                    <input type="button" class="btn btn-success btn-sm" value="수정" onclick="bCommentUpdate(this);">
	                                    <input type="button" class="btn btn-success btn-sm" value="삭제" onclick="bCommentDelete(this);">
	                                </td>
	                            </tr>
	                            <%} %>
	                      
	                        </tbody>
	                    </table>
	                </div>
	                  <%} }%>
       		 </div>
			
		
			
			
			
			
			
        <br /><br />
           <!--  관리자일때만  -->
           <% if( m!=null && m.getUser_id().equals("admin") ){ %>
           		<form action="<%=request.getContextPath()%>/bCommentInsert.bo" method="post" id="addComment">
                    <div class="container col-sm-6"  >
                    <hr style="border :1px solid #a1a1a1;"/>
                        <div class="row">
                           <label id = "subject" ><h3>답변하기</h3></label>
                            <div class="input-group ">
                            	<input type="hidden" name="c_writer" value="<%= m.getUser_name()%>" />
                            	<input type="hidden" name="b_no" value="<%= b.getB_no()%>" />
                                <textarea style="height:200px;" name ="c_content" id="c_content1"class="form-control"></textarea>
                            </div>
                        </div>
                         <div class="row justify-content-end" >
                           <button class="btn btn-success" type="submit" >등록</button>
                        </div>
                    </div>
                </form>
                
                <form  method="post"   >
                    <div class="container col-sm-6"   style="display:none;" id="modifyCommentContent" >
                        <div class="row ">
                           <label id = "subject" ><h3>답변 수정하기</h3></label>
                            <div class="input-group "> 
                            	<input type="hidden" name="b_no" value="<%= b.getB_no()%>" />
                                <textarea style="height:200px;"name ="c_content" id="c_content2"class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="row justify-content-end" >
                                <button   class="btn btn-success " type="button"id="modifyComment" >수정</button> &nbsp;
                                <button  class="btn btn-success " type="button" onclick="refresh();" >취소</button>
                   		</div>
                    </div>
                </form>
                <%} %>
     
     
     <br />
			
			  <div class="container col-sm-6"  >
			    <hr style="border :1px solid #a1a1a1;"/>
                  <div class="row table">
                   <table class="col-sm-12" id="nextTable" >
	                        <tbody>
	                            <tr>
	                                <th >이전글</th>
	                                	<%if( prevBoard==null){%>
									  <td  align="center"  onclick="prevBoard();" id="prevTd">	<span> 이전글이 없습니다.</span>	 </td>
										<%} else {%>
									  <td  align="center" onclick="prevBoard();">	<span ><%=prevBoard.getB_title() %></span> </td>
										<% } %>
	                                
                                </tr>     

								<tr>
	                                 <th>다음글</th>
	                                	<%if( nextBoard==null){%>
										   <td  align="center" onclick="nextBoard();"> <span > 다음글이 없습니다.</span>	</td>
										<%} else {%>
										   <td  align="center" onclick="nextBoard();"><span ><%=nextBoard.getB_title() %></span></td>
										<% } %>
                                </tr>     
	                        </tbody>
	                    </table>
                  
				</div>                
             </div>
       
      <hr>            
<br><br><br><br>
 <script>
 	// 목록
	function getList(){
		 location.href="<%= request.getContextPath() %>/boardList.bo";
	} 
	
 	// 게시물 수정
	function goUpdateView(){
		 location.href="<%= request.getContextPath() %>/boardUpdateView.bo?b_no="+<%= b.getB_no()%>;
	}
	
 	// 게시물 삭제
	function goBoardDelete(){
		 location.href="<%= request.getContextPath() %>/boardDelete.bo?b_no="+<%= b.getB_no()%>;
	}
	
 	// 댓글 삭제
	function bCommentDelete(obj){
		var cno = $(obj).parent().children().eq(0).val();
		console.log(cno);
		 location.href="<%= request.getContextPath() %>/bCommentDelete.bo?b_no="+<%= b.getB_no()%>+'&c_no='+cno;  
	}
 	
 	// 새로고침
	function refresh(){
		
		 location.reload();
	}
	
 	// 댓글 수정
	function bCommentUpdate(obj){
		var cno1 = $(obj).parent().children().eq(0).val();
		var content1 = $(obj).parent().parent().prev().find('td').html().replace(/<br>/g, '\n');
		$(obj).css('display','none');
				
		$('#addComment').css('display','none');
		$('#modifyCommentContent').css('display','block');
		$('#c_content2').focus().text(content1 );

		$('#modifyComment').click(function(){ 		
			location.href="<%=request.getContextPath()%>/bCommentUpdate.bo?b_no="+<%= b.getB_no()%>+'&c_no='+cno1+'&c_content='+$('#c_content2').val().replace(/\n/g, '<br>');				
		 });
		/* .replace(/\n/g, '<br>') */
	}

 	// 댓글 내용 확인
	$('#addComment').submit(function(){ 
		        if($('#c_content1').val()==""){ 
		            alert('관리자! 답변 내용 입력하시오'); 
					$('#c_content1').focus();	
		            return false; 
			 }
	 });
	
	$(function(){
		$('#nextTable tr td').mouseenter(function(){
			$(this).css({
                "background" : "#dedede",
				"cursor":"pointer"});
		}).mouseleave(function(){
            $(this).css({
                "background" : "white"
				});
		})
	});



 </script>
   </body>
</html>