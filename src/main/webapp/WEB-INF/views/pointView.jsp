<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#myPageContent {
	position:relative;
	padding-bottom: 100px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<style type="text/css">
#myPageContent {
	position:relative;
	padding-bottom: 100px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron text-center"><h2>포인트 적립/사용 내역</h2></div>

<div class ="container-fluid" id = "myPageContent">
<table class ="table ">
	<thead class ="thead-light">
	<tr>
		<th>날짜</th>
		<th>적립 포인트</th>
		<th>사용 포인트</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var ="point" items = "${POINT}">
		<tr>
			<td>${point.pt_date }</td>
			<td>${point.pt_in }</td>
			<td>${point.pt_out }</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td>Total Point : ${pointTotal}</td>
		</tr>
	</tfoot>
</table>
</div>
</body>
</html>