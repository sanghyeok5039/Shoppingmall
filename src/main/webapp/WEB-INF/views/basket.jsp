<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/material-kit.js"></script>
<style type="text/css">
#alltable {
	padding: 10px;
}
</style>
</head>
<body onload = "myFunction()">

<div id = "folding" style="background-image: url('resources/assets/img/bg10.jpg'); width: 100%; height: 100%" >
<img alt="" src="">
<div class="sk-folding-cube" >
  <div class="sk-cube1 sk-cube"></div>
  <div class="sk-cube2 sk-cube"></div>
  <div class="sk-cube4 sk-cube"></div>
  <div class="sk-cube3 sk-cube"></div>
</div>
</div>
<script>
var myVar;

function myFunction() {
  myVar = setTimeout(showPage, 1000);
}

function showPage() {
  document.getElementById("folding").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>

<div style="display:none;" id = "myDiv" class ="animate-bottom">

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>장바구니</h1>
        </div>
      </div>
    </div>
  </div> 
</div>

<div class="main main-raised">
<div id="alltable" class = "container">
<table border="1" class = "table">
	<tr>
		<td align="center" width="400px">상품정보
		</td>
		<td align="center" width="100px">합계
		</td>
		<td align="center" width="50px">수량
		</td>
		<td align="center" width="100px">포인트
		</td>
		<td align="center" width="100px">총 합계
		</td>
		<td align="center" width="100px">비고
		</td>
	</tr>
	<c:forEach var="dto" items="${list}">
	<c:if test="${empty dto.delivery}">
	<tr>
		<td>
		<table class = "table">
				<tr>
					<td><img src="img/sample1.jpg" width="100px" height="100px"></td>
					<td>상품명 : ${dto.product_name}<br>
						옵션 : ${dto.product_size}</td>
				</tr>
		</table>
		</td>
		<td align="right">${dto.product_price}원
		</td>
		<td>${dto.num}개
		</td>
		<td>${dto.mbr_point}point
		</td>
		<td align="right">${dto.total_price}원
		</td>
		<td>
		<form method="post" action="basketdelete">
			<input type="hidden" value="${mbr_id}" name="mbr_id">
			<input type="hidden" value="${dto.product_detail_id}" name="product_detail_id">
			<input type="submit" value="삭제하기" class ="btn btn-warning btn-block">
		</form>
		</td>
	</tr>
	</c:if>
	<c:if test="${not empty dto.delivery}">
		<tr>
			<td align="center">
				배송비 
			</td>
			<td align="right" colspan="5">
				${dto.delivery} 원
			</td>
		</tr>
		<tr>
			<td align="center">
				총 합계 
			</td>
			<td align="right" colspan="5">
				 ${dto.total_price} 원
			</td>
		</tr>
	</c:if>
	</c:forEach>
</table>
<form method="post" action="basketopen">
<input type="hidden" value="${mbr_id}" name="mbr_id">
<input type="submit" value="결제하기" class = "btn btn-primary btn-block">
</form>
</div>
</div>

<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</div>
</body>
</html>