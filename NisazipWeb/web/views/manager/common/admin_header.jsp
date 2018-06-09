<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
 #backToIndex:link { color: white; text-decoration: none;}
 #backToIndex:visited { color: white; text-decoration: none;}
 #backToIndex:hover { color: white; text-decoration: underline;}
</style>

</head>
<body>
	<header>
	    <div class="container container-fluid" style="color:white;">
	            <input type="button" value="관리 페이지" id="home_btn" class="home_btn" />
	            <p class="text-right"><a href="<%=request.getContextPath()%>" id="backToIndex">홈페이지로 돌아가기</a></p>
	    </div>

	</header>
</body>
</html>