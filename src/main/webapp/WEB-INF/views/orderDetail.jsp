<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세내역</title>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<style type="text/css">
#alltable {
	padding: 10px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>주문 상세 내역</h1>
        </div>
      </div>
    </div>
  </div> 
</div>
<div class="main main-raised">
	<div class="container"  id = "main_container">
   		<div class="section text-center">
    		<div class="container" id="content">
<div id="alltable" >
<table border="1" class = "table">
	<tr>
		<td width="100px">주문일시
		</td>
		<td width="400px">상품정보
		</td>
		<td width="50px">수량
		</td>
		<td width="100px">금액
		</td>
		<td width="100px">비고
		</td>
	</tr>
<c:forEach var="dto" items="${list}">	
	<tr>
		<td>${dto.date}
		</td>
		<td>
		<table>
				<tr>
					<td><img src="img/${dto.product_img}" width="100px" height="100px"></td>
					<td>상품명 : ${dto.name}<br>
						옵션 : ${dto.size}</td>
				</tr>
			</table>
		</td>
		<td>${dto.ords_detail_count}
		</td>
		<td>${dto.price}
		</td>
		<td>
			<form id="${dto.product_id}" method="post" action="show">
				<input type="hidden" name="id" value="${dto.product_id}">
				<input type="hidden" name="startNum" value="1">
			</form>
			<button onclick="document.getElementById('${dto.product_id}').submit();">상품정보보기</button>
		</td>
	</tr>
</c:forEach>	
</table>
</div>
<div id="alltable">
<table class = "table" >
	<tr>
		<td colspan=4>최종결제 정보</td>
	</tr>
	<tr>
		<td>
			총 합계금액 
		</td>
		<td>
			포인트 적립
		</td>
		<td>
			할인내역
		</td>
		<td>
			총 결제금액
		</td>
	</tr>
	<tr>
		<td>
			${price}
		</td>
		<td>
			${pt_in}
		</td>
		<td>
			${pt_out}
		</td>
		<td>
			${totalprice}
		</td>
	</tr>
</table>
</div>
<br>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>