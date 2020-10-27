<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#myPageContent {
	position:relative;
	padding-bottom: 120px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
<div class="jumbotron text-center"><h2>주문 내역</h2></div>
<div class ="container-fluid" id = "myPageContent">
<table class ="table">
	<thead class ="thead-light">
	<tr>
		<th>상품 정보</th>
		<th>판매가</th>
		<th>수량</th>
		<th>배송비</th>
		<th>적립 포인트</th>
		<th>합계</th>
		<th>배송 상태</th>
		<th>비고(상세 정보 보기)</th>
	</tr>
	</thead>
	<tbody>
	<!-- c:foreach 사용 예정 -->
	<c:forEach var ="orders" items = "${RESULT}">
		<tr>
			<td>${orders.name }</td>
			<td>${orders.price }</td>
			<td>${orders.quantity }</td>
			<td>${orders.delprice }</td>
			<td>${orders.point }</td>
			<td>${orders.total }</td>
			<td>${orders.delstate }</td>
			<td>${orders.name }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>