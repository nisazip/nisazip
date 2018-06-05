<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String messageType = (String)session.getAttribute("messageType");
	String messageContent = (String)session.getAttribute("messageContent");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<% 
	String messageContent = null;
	if(session.getAttribute("messageContent")!= null){
		messageContent = (String)session.getAttribute("messageContent");
	}
	String messageType = null;
	if(session.getAttribute("messageType")!= null){
		messageContent = (String)session.getAttribute("messageType");
		
	}
	if(messageContent!=null){
%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" <%if(messageType.equals("오류메시지")) out.println("panel-warnig"); else out.println("panel-success"); %>>
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal"> 
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					
					</div>
					
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#messageModal").modal("show");
	
</script>
<%
	session.removeAttribute("messageContent");
	session.removeAttribute("messageType");

%>
</body>
</html>