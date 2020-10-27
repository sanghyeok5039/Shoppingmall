<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색명, 분류</title>
<style>
table{
	padding : 20px;
}
h1{
	text-align: center;
}
#pass{
	text-align: center;
}
#alltable{
	padding: 10px;
}

</style>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>
</head>
<body>
<h1>검색결과 '<c:if test="${m_ctgr_name != null}">${m_ctgr_name}</c:if>
	<c:if test="${ctgr_name != null}">${ctgr_name}</c:if>
	<c:if test="${product_name != null}">${product_name}</c:if>' 입니다.
</h1>
<p id="pass">
	<c:if test="${m_ctgr_name != null}">
		<c:forEach var="i" items="${ctgrlist}">
			<form id="${i.ctgr_id}" method="post" action="showCategory">
			<input type="hidden" name="ctgr_id" value="${i.ctgr_id}">
			<input type="hidden" name="startNum" value="1">
			</form>
			<a href="#" onclick="document.getElementById('${i.ctgr_id}').submit();">-${i.ctgr_name}</a>
		</c:forEach>
	</c:if>
</p>
<div id="alltable" class = "container-fluid">
<table class = "table">
	<tr>
	<c:forEach var="dto" items="${list}" varStatus="st">
		<c:if test="${st.index eq '4'}"><tr>
		</c:if>
		<c:if test="${st.index eq '8'}"><tr>
		</c:if>
		<td>
			<table class ="table">
				 <tr>
				 	<td>
				 		<img src="img/${dto.product_img}" style="width: 150px" onclick="document.getElementById('name${dto.product_id}').submit();">
				 	</td>
				 </tr>
				 <tr>
				 	<td>
				 		<form id="name${dto.product_id}" method="post" action="show">
							<input type="hidden" name="id" value="${dto.product_id}">
							<input type="hidden" name="startNum" value="1">
						</form>
						-제품명 : <a href="#" onclick="document.getElementById('name${dto.product_id}').submit();">${dto.product_name}</a>
				 	</td>
				 </tr>
				 <tr>
				 	<td>
				 		-별점 : ${dto.product_totalgrade}
				 	</td>
				 </tr>
				 <tr>
				 	<td>
				 		-가격 : ${dto.product_price}
				 	</td>
				 </tr>
			</table>
		</td>
	</c:forEach>
	</tr>
</table>
</div>
<br><br>
<c:if test="${startPage > 10}">
	<c:if test="${m_ctgr_name != null}">
		<form id="before" method="post" action="showMainCategory">
			<input type="hidden" name="startNum" value="${startPage -12}">
			<input type="hidden" name="m_ctgr_id" value="${m_ctgr_id}">
		</form>
		<a href="#" onclick="document.getElementById('before').submit();">[이전]</a>
	</c:if>
	<c:if test="${ctgr_name != null}">
		<form id="before" method="post" action="showCategory">
			<input type="hidden" name="startNum" value="${startPage -12}">
			<input type="hidden" name="ctgr_id" value="${ctgr_id}">
		</form>
		<a href="#" onclick="document.getElementById('before').submit();">[이전]</a>
	</c:if>
	<c:if test="${product_name != null}">
		<form id="before" method="post" action="showName">
			<input type="hidden" name="startNum" value="${startPage -12}">
			<input type="hidden" name="product_name" value="${product_name}">
		</form>
		<a href="#" onclick="document.getElementById('before').submit();">[이전]</a>
	</c:if>
</c:if>
<table>
	<tr>
	<c:forEach var="i" items="${numlist}">
	<td>
		<c:if test="${m_ctgr_name != null}">
			<form id="list${i}" method="post" action="showMainCategory">
				<input type="hidden" name="m_ctgr_id" value="${m_ctgr_id}">
				<input type="hidden" name="startNum" value="${i}">
			</form>
			<a href="#" onclick="document.getElementById('list${i}').submit();">${i}</a>
		</c:if>
		<c:if test="${ctgr_name != null}">
			<form id="list${i}" method="post" action="showCategory">
				<input type="hidden" name="ctgr_id" value="${ctgr_id}">
				<input type="hidden" name="startNum" value="${i}">
			</form>
			<a href="#" onclick="document.getElementById('list${i}').submit();">${i}</a>
		</c:if>
		<c:if test="${product_name != null}">
			<form id="list${i}" method="post" action="showName">
				<input type="hidden" name="product_name" value="${product_name}">
				<input type="hidden" name="startNum" value="${i}">
			</form>
			<a href="#" onclick="document.getElementById('list${i}').submit();">${i}</a>
		</c:if>
	</td>
	</c:forEach>
</tr>
</table>
<c:if test="${endPage < pageCount}">
	<c:if test="${m_ctgr_name != null}">
		<form id="after" method="post" action="showMainCategory">
			<input type="hidden" name="startNum" value="${startPage +12}">
			<input type="hidden" name="m_ctgr_id" value="${m_ctgr_id}">
		</form>
		<a href="#" onclick="document.getElementById('after').submit();">[다음]</a>
	</c:if>
	<c:if test="${ctgr_name != null}">
		<form id="after" method="post" action="showCategory">
			<input type="hidden" name="startNum" value="${startPage +12}">
			<input type="hidden" name="ctgr_id" value="${ctgr_id}">
		</form>
		<a href="#" onclick="document.getElementById('after').submit();">[다음]</a>
	</c:if>
	<c:if test="${product_name != null}">
		<form id="after" method="post" action="showName">
			<input type="hidden" name="startNum" value="${startPage +12}">
			<input type="hidden" name="product_name" value="${product_name}">
		</form>
		<a href="#" onclick="document.getElementById('after').submit();">[다음]</a>
	</c:if>
</c:if>
</body>
</html>