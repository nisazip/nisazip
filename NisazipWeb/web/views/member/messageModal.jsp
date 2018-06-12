<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.vertical-alignment-helper{
	display:table;
	height:100%;
	width:100%;
	
}
.vertical-alignment-center{
	display:table-cell;
	vertical-align:middle;

}
.modal-content{
	width:inherit;	
	height:inherit;	
	margin: 0 auto;

	
}
</style>



</head>
<body>
<% 
	String messageContent = null;
	if(session.getAttribute("messageContent")!= null){
		messageContent = (String)session.getAttribute("messageContent");
	}
	String messageType = null;
	if(session.getAttribute("messageType")!= null){
		messageType = (String)session.getAttribute("messageType");
		
	}
	
	if(messageContent!=null){
%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-warning">
					<div class="modal-header" <% 
					if(messageType.equals("오류메세지")){ %> style="background: #e06377; color:white;" <%}else{%>  style="background: #daebe8; color:#3b3a30;"<%} %> >
						<button type="button" class="close" data-dismiss="modal"> 
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" <% if(messageType.equals("오류메세지")){ %> style="background: #e06377; color:white;"<%}else{%>  style="background: #daebe8; color:#3b3a30;"<%} %>  >
							<center><%= messageType %></center>
						</h4>
					
					</div>
					
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-3"></div>
							<center><div class="col-lg-6"><%= messageContent %></div></center>
							<div class="col-lg-3"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
			</div>
		</div>
	</div>
</div>
<%} %>
<script type="text/javascript">
	$("#messageModal").modal("show");
	
</script>
<%
	session.removeAttribute("messageContent");
	session.removeAttribute("messageType");

%>
</body>
</html>