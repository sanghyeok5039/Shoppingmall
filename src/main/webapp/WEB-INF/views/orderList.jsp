<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
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
	<%@ include file="/WEB-INF/views/include/top.jsp"%>
	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand text-center">
						<h1>주문 내역</h1>
						<h3 class="title text-center"></h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="container-fluid" style ="padding-top: 60px; padding-bottom: 60px">
			<div id="alltable" class="container-fluid">
				<table border="1" class="table">
					<tr>
						<td align = "center" width="100px">주문일시</td>
						<td align = "center" width="400px">상품정보</td>
						<td align = "center" width="100px">수량</td>
						<td align = "center" width="100px">결제금액</td>
						<td align = "center" width="400px">배송지</td>
						<td align = "center" width="100px">배송현황</td>
						<td align = "center" width="150px">비고</td>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.date}</td>
							<td>
								<table>
									<tr>
										<td><img src="img/${dto.product_img}" width="100px"
											height="100px"></td>
										<td>제품명 : ${dto.name}</td>
									</tr>
								</table>
							</td>
							<td align = "center">${dto.num}</td>
							<td align = "right">${dto.ords_total}</td>
							<td>${dto.ords_delv_adres}</td>
							<td align = "center">${dto.ords_delv_state}</td>
							<td>
								<form id="${dto.ords_date}" method="post"
									action="showOrderdetaillist">
									<input type="hidden" name="date" value="${dto.date}"> <input
										type="hidden" name="mbr_id" value="${mbr_id}"> <input
										type="hidden" name="totalprice" value="${dto.ords_total}">
									<input type="hidden" name="startNum" value="1">
								</form>
								<button class ="btn btn-primary btn-block"
									onclick="document.getElementById('${dto.ords_date}').submit();">상세정보
									보기</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div align="center">
				<c:if test="${startPage > 10}">
					<form id="before" method="post" action="showOrderlist">
						<input type="hidden" name="startNum" value="${startPage -12}">
						<input type="hidden" name="mbr_id" value="${mbr_id}">
					</form>
					<a href="#" onclick="document.getElementById('before').submit();">[이전]</a>
				</c:if>
				<table>
					<tr>
						<c:forEach var="i" items="${numlist}">
							<td>
								<form id="list${i}" method="post" action="showOrderlist">
									<input type="hidden" name="mbr_id" value="${mbr_id}"> <input
										type="hidden" name="startNum" value="${i}">
								</form> <a href="#"
								onclick="document.getElementById('list${i}').submit();">${i}</a>
							</td>
						</c:forEach>
					</tr>
				</table>
				<c:if test="${endPage < pageCount}">
					<form id="after" method="post" action="showOrderlist">
						<input type="hidden" name="startNum" value="${startPage +12}">
						<input type="hidden" name="mbr_id" value="${mbr_id}">
					</form>
					<a href="#" onclick="document.getElementById('after').submit();">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footerContainer.jsp"%>
</div>
</body>
</html>