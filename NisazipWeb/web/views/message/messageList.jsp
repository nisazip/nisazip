<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title></title>
</head>
<body>
<%@ include file ="/views/common/header.jsp" %>
<pre>


asdf











</pre>
<form id ="msForm" method="post" action="<%=request.getContextPath()%>/msValue.ms">
	<input type="text" name="r1" value="user01"/>
	<input type="text" name="r2" value="user02" />
	<button type="submit" >메시지 보내기</button>
</form> <!-- onclick="aaa();" -->
<script>

</script>
</body>
</html>