<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron bg-info text-white">
<h1 align="center">회원 정보</h1>
</div>
<div class = "container-fluid">
<table class = "table">
	<tr>
		<th>아이디  </th>
		<th><font>${loginUser.mbr_id }</font></th>
	</tr>
	<tr>
		<td>이름  </td>
		<td><font>${loginUser.mbr_name }</font></td>
	</tr>
	<tr>
		<td>성별  </td>
		<td><font>${loginUser.mbr_sex }</font></td>
	</tr>
	<tr>
		<td>생년월일  </td>
		<td><font>${loginUser.mbr_brthdy }</font></td>
	</tr>
	<tr>
		<td>연락처  </td>
		<td><font>${loginUser.mbr_tel }</font></td>
	</tr>
	<tr>
		<td>주소  </td>
		<td><font>${loginUser.mbr_adres }</font></td>
	</tr>
	<tr>
		<td>이메일  </td>
		<td><font>${loginUser.mbr_email }</font></td>
	</tr>
	<tr>
		<td>현재 포인트  </td>
		<td><font>${loginUser.mbr_point }</font></td>
	</tr>
</table>
</div>
</body>
</html>