<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
html, body{
	height:100%;
	width:100%;
	margin:0;
	align: center;
}
table {
	border-top: 1px solid #444444;
    border-collapse: collapse;
    background: #ededed;
	color: #222;
}

th {
	border-bottom: 1px solid #444444;
    padding: 10px;
    background: #ededed;
	color: #222;
	height: 100;
}

td {
	border-bottom: 1px solid #444444;
    padding: 10px;
    background: #ededed;
	color: #222;
}



</style>
<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<div align="center">

<br><br>
<h2><b>회원정보 상세</b></h2>

<!-- <input type="button"   onclick="location.href='mbrMng'"   value="뒤로가기"> -->
<br><br>


<form action="mbUpdate">


<table style="width: 800px"> 
	<tr> 
	</tr>

	<tr> 
		<td align=center ><br><br><b>ID</b></td> <td align=center><br><br>${dto.mbr_id } <input type="hidden"name="id"value="${dto.mbr_id }"> </td>
	</tr>
	<tr>
		<td align=center ><b>등급</b></td> <td align=center>${dto.mbr_grade }</td>
	</tr>
	<tr>
		<td align=center ><b>성명</b></td>	<td align=center>${dto.mbr_name }</td>
	</tr>
	<tr>
		<td align=center ><b>연락처</b></td>	<td align=center>${dto.mbr_tel }</td>
	</tr>
	<tr>
		<td align=center ><b>주소</b></td>	<td align=center>${dto.mbr_adres }</td>
	</tr>
	<tr>
		<td align=center ><b>가입일</b></td>	<td align=center>${dto.mbr_rgsde }</td>
	</tr>
	<tr>
		<td align=center ><b>레벨</b></td>	 
		<td align=center >
			<select name="MBR_LEVEL" >
				<option value="1" <c:if test="${dto.mbr_level == 1 }"> selected="selected" </c:if>>&nbsp;&nbsp;&nbsp;&nbsp;Silver</option>
				<option value="2" <c:if test="${dto.mbr_level == 2 }"> selected="selected" </c:if>>&nbsp;&nbsp;&nbsp;&nbsp;Gold</option>
				<option value="3" <c:if test="${dto.mbr_level == 3 }"> selected="selected" </c:if>>&nbsp;Platinum&nbsp;</option>
				<option value="4" <c:if test="${dto.mbr_level == 4 }"> selected="selected" </c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIP</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align=center ><b>성별</b></td>
		<td align=center id="MBR_SEX">
			<c:if test="${dto.mbr_sex==0 }">남자</c:if>
			<c:if test="${dto.mbr_sex==1 }">여자</c:if>
		</td>
	</tr>
	<tr>
		<td align=center ><b>생일</b></td> 	<td align=center>${dto.mbr_brthdy }</td>
	</tr>	
	<tr>
		<td align=center ><b>POINT</b></td> 	<td align=center>${dto.mbr_point }</td>
	</tr>
	<tr>
		<td align=center ><b>탈퇴여부</b></td>	<td align=center>${dto.mbr_secsn }</td>
	</tr>	
	
	<tr >
		<td align="center" colspan="2"> <br><input type="submit" value="레벨수정"> <br><br> </td> 
	</tr> 
	<tr> 
	</tr>
</table>


</form>

</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>

