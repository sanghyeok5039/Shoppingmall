<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<style>
a{
	color: #8C8C8C;
	text-decoration:none;
}

a:hover{
	color: #353535;
	text-decoration:none;
	cursor:pointer;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-12" style="text-align:center;">
			<br>
			<h2>${loginUser.mbr_name} 관리자님 ! 환영합니다.</h2>
			<c:if test="${closingComplete ==false}">
				<span style="font-size:1.5em;color:#FF1212;font-weight:bold">전날 마감처리를 완료해주세요.</span>
			</c:if>
			<br><br>
		</div>
		<div class="col-sm-4" style="text-align:center;">
			<table class="table">
				<tr><td>오늘 총 주문 건수</td></tr>
				<tr>
				  <td>
				    <font size="10em"><fmt:formatNumber value="${ORD_CNT}" 
				    	pattern="#,###,###,###" /></font>건
				  </td>
				</tr>
			</table>
		</div>
		<div class="col-sm-4" style="text-align:center;">
			<table class="table">
				<tr><td>오늘 총 매출</td></tr>
				<tr>
			  	  <td>
			   	    <font size="10em"><fmt:formatNumber value="${TODAY_SALE}" 
				    	pattern="#,###,###,###" /></font>원
				  </td>
				</tr>
			</table>
		</div>
		<div class="col-sm-4" style="text-align:center;">
			<table class="table">
				<tr><td>오늘 가입자 수</td></tr>
				<tr>
				  <td>
				    <font size="10em"><fmt:formatNumber value="${TODAY_JOIN}" 
				    	pattern="#,###,###,###" /></font>명
				  </td>
				</tr>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>