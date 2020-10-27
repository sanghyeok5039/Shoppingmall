<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>회원 정보 관리</title>
<script type="text/javascript" src="<c:url value="js/jquery-3.4.1.min.js"/>"></script>
<style>
html, body{
	height:100%;
	width:100%;
	margin:0;
	align: center;
}
.container{
	width: 800px;
	align: center;
	margin: 0 auto; 
}



  table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
    background: #ededed;
	color: #222;
  }
  th{
   	border-bottom: 1px solid #444444;
    padding: 10px;
    background: #ededed;
	color: #222;
  } 
  td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    background: #ededed;
	color: #222;
  }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br><br>

<div align="center">
<h3><b>회원정보</b></h3>

<br><br>  

<div id="container"> 
<table >
	<tr height="60" bgcolor="#034f84">
		<td width="800" align="center">
			<!-- 콘트롤러 조회조건 전송 --> 
			<br><br>
			<form action="mbrSrchCndtn"> 
				<select name="classify" style="width:75px;height:30px; " >
					<option value="MBR_NAME">&nbsp;&nbsp;&nbsp;&nbsp;이름</option>
					<option value="MBR_ID">&nbsp;&nbsp;&nbsp;회원ID</option>
					<option value="MBR_TEL">&nbsp;&nbsp;&nbsp;연락처</option>
					<!-- <option value="mbrEmail">이메일</option> -->
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="mbrSrchWord">
				<input type="submit" value="검색">
			</form>
			<br> 
		</td>
	</tr>
	<tr bgcolor=#91A8d0>
		<td align="center" height="200">
		<form action="mbDetail">
			<table>
				<tr height="60">
					<td width="60">이름</td>
					<td width="100">아이디</td>
					<td width="90">연락처</td>
					<td width="150">주소</td>
					<td width="100">가입일</td>
					<td width="100">생일</td>
					<td width="50">회원등급</td>
					<td width="50">상세보기</td>
				</tr>
				
 				<c:forEach var="data" items="${MBRLIST}">
					<tr height="60">
						<td>${data.mbr_name }</td>
						<td>${data.mbr_id }<input type="hidden" name="id" value="${data.mbr_id }"></td>
						<td>${data.mbr_tel }</td>
						<td>${data.mbr_adres }</td>
						<td>${data.mbr_rgsde }</td>
						<td>${data.mbr_brthdy }</td>
						<td>
							<select name="mbr_level" >
								<option value="1" <c:if test="${data.mbr_level == 1 }"> selected="selected" </c:if>>&nbsp;&nbsp;&nbsp;&nbsp;Silver</option>
								<option value="2" <c:if test="${data.mbr_level == 2 }"> selected="selected" </c:if>>&nbsp;&nbsp;&nbsp;&nbsp;Gold</option>
								<option value="3" <c:if test="${data.mbr_level == 3 }"> selected="selected" </c:if>>&nbsp;Platinum&nbsp;</option>
								<option value="4" <c:if test="${data.mbr_level == 4 }"> selected="selected" </c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIP</option>
							</select>
						</td>
						<td>
							<input type="button" onclick="location.href='mbDetail?id=${data.mbr_id}'" value="상세보기">
						</td>
					</tr>
				</c:forEach> 
			</table>
		</form>
		</td>
	</tr>
</table>
</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>