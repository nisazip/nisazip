<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.report.model.vo.*"%>
    <% Report rp = (Report) request.getAttribute("report"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/semi/resources/css/bootstrap.css">
<script src="/semi/resources/js/jquery-3.3.1.min.js"></script>
<script src="/semi/resources/js/bootstrap.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
		<h2>신고정보라능</h2>

		<table class="table table-striped" id="tab">
			<thead>
				<tr>
					<th>신고번호</th>
					<th>신고자</th>
					<th>피신고자</th>
					<th>신고유형</th>
					<th>신고내용</th>
					<th>신고일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%= rp.getRp_no() %></td>
					<td><%= rp.getRp_writer() %></td>
					<td><%= rp.getRp_receiver() %></td>
					<td><%= rp.getRp_type() %></td>
					<td><%= rp.getRp_content() %></td>
					<td><%= rp.getRp_date() %></td>
				</tr>

			</tbody>
		</table>
	</div>
</body>
</html>