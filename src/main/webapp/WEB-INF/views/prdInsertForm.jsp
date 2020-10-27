<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<%-- <script type="text/javascript" src="<c:url value="js/jquery-3.4.1.min.js"/>"></script> --%>

<script src="js/jquery-3.4.1.min.js"></script>

</head>


<style>
html, body{
	height:100%;
	width:100%;
	margin:0;
	align: center;
}
 
  table {
    /* border-top: 1px solid #444444; */    
  	border-collapse: collapse; 
    background: #ededed;
	color: #222; 
	
	
  }
  th{   
   	border-bottom: 3px solid #444444; 
    padding: 10px; 
    background: #ededed;
	color: #222; 
  } 
  td {
    border-bottom: 1px solid  #444444;  
    padding: 10px;
    background: #ededed;
	color: #222;
  }
</style>


<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>

<div align=center>
 
<br><br>

<h1><b>상품등록</b></h1>
<form action="prdInsert"> 
<table>
	<tr height="350"> 
		<td align="center">
			<table>
				<tr height="60">  
					<td width="100">상품명</td>
					<td align="center" > 
						<input type="hidden" name="prdId" value="${param.prdId }">
						<input type="text" name="prdName">
					</td>
				</tr>
				
				<!-- 분류  -->
				<tr height="60" >
					<td>분류</td>
					<td align="center" >
						<select id="mainCtgrSelected" name="mainCtgrSelected" onchange="">
							<option>-- 대분류 --</option>
							<c:forEach var="mCtgr" items="${MCTGR}"  >    <!-- 대분류 -->
							<option value="${mCtgr.m_Ctgr_Id}"onclick="proc()" <c:if test="${dto.m_ctgr_id == mCtgr.m_Ctgr_Id }"> selected="selected" </c:if> >${mCtgr.m_Ctgr_Name }</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;
						<select id="sub" name="sub">
							<option>-- 소분류 --</option>
							<c:forEach var="ctgr" items="${CTGR}">		<!-- 소분류 -->
							<option value="${ctgr.ctgr_Id }"<c:if test="${dto.ctgr_id == ctgr.ctgr_Id }"> selected="selected" </c:if>>${ctgr.ctgr_Name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr height="60">
					<td>요약 설명</td>
					<td align="center">
						<textarea name="memo"  rows="8" cols="" ></textarea>
					</td>
				</tr>
				 
				<tr height="55">
					<td>이미지</td>	
					
					<td align="center">
						<input type="file" name="file"/>
					</td>
				</tr>
			</table>
		</td>
		<td width="20"><br></td>  	
		<td width="400" align="center"> 
			<table >
				<tr height="90" bgcolor="#91A8d0">
					<td>상태</td>	
					<td>
						<input type="radio" name="state" value="Y" >판매중
						<input type="radio" name="state" value="N">판매중지
						<input type="radio" name="state" value="O" >품절
					</td>
				</tr> 
				<tr height="90">
					<td>판매가</td>	
					<td align="center">
						<input type="text" name="price">
					</td>
				</tr>
				<tr height="90" >
					<td width="80">사이즈</td>
					<td align="center" >
						<input type="text" name="size"> 
					</td>
				</tr>
				<tr height="90" > 
					<td >수량</td><td align="center"><input type="text" name="cnt"></td>
				</tr> 
				<tr height="90" >
					<td >색상</td><td align="center"><input type="text" name="color"></td>
				</tr>
			</table>
		</td>
	</tr> 
	<tr height="50" >
		<td colspan="3" align="center">
			<input type="submit" value="등록" style="width:80px">
			&nbsp;&nbsp;&nbsp;
			<input type="reset" value="초기화" style="width:80px">
			&nbsp;&nbsp;&nbsp;
			<input type="button" value="목록으로" style="width:80px" onclick="location.href='prdMngList'">
		</td>
	</tr>
</table>
</form>


</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>