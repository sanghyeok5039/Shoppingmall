<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>제품관리-조회</title>
<script type="text/javascript" src="<c:url value="js/jquery-3.4.1.min.js"/>"></script>
<script>
/* $(document).ready(function(){
	$('#all').click(function() {
		   if($("#all").prop("checked")){
	            $("input[name=check]").prop("checked",true);
	        }else{
	            $("input[name=check]").prop("checked",false);
	        };
	});
}); */
</script>

<style>
html, body{
	height:100%;
	width:100%;
	margin:0;
	align: center;
}


 
  table {
    border-top: 1px solid #444444;
    /* border-collapse: collapse; */
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
<style>


</style>
<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>




<div align="center">
<br><br>
 
<h1><b>상품조회</b></h1>

<br><br>
<table>
	<tr height="60" bgcolor="#034f84">
		<td width="800" align="center">
			<form action="prdCndtnSrch">
			<br><br><br>
				<select name="classify"   style="width:80px;height:35px; " >  
					<option value="PRODUCT_NAME">&nbsp;&nbsp;&nbsp;상품명</option>
					<option value="M_CTGR_NAME">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분류</option> 
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="50" name="prdSrchWord">
				<input type="submit" value="검색">
			</form>
		</td>
	</tr>
	
	<tr bgcolor="#91A8d0">
		<td align="center" height="200">
		<form action="prdMngReg" > <!-- getLIST  --> 
			<table  id="list"  bgcolor="white" >
				<tr></tr>			 
			
				<tr height="50" >
					<td align="center"width="100" ><b>이미지</b></td>
					<td align="center"width="250"><b>상품명</b></td>
					<td align="center"width="80"><b>판매가</b></td>
					<td align="center"width="80"><b>수량</b></td> 
					<td align="center"width="100"><b>상태</b></td>
					<td align="center"width="100"><b>상세정보</b></td>
				</tr>
				
 				<c:forEach var="data1" items="${PRDLIST}">
				<tr>
					<td align="center"><img width="80" height="80"src="${data1.prd_img}"></td>		<!-- 이미지 -->
					<td align="center">${data1.prd_name}</td>										<!-- 상품명 -->
					<td align="center">${data1.prd_price}</td>										<!-- 판매가 -->
					<td align="center">${data1.prd_cnt}</td>										<!-- 재고량 -->
					<td align="center">			 												<!-- 판매상태 -->
						<c:if test="${data1.prd_stt=='Y'}">판매중</c:if>
						<c:if test="${data1.prd_stt=='N'}">판매중지</c:if>
						<c:if test="${data1.prd_stt=='O'}">품절</c:if>
						<input type="hidden" name="prdId"		value="${data1.prd_id}"   >
						<input type="hidden" name="m_ctgr_id" 	value="${data1.m_ctgr_id}">
					</td>
					<td align="center"> 
						<input type="button" onclick="location.href='prdMngReg?prdId=${data1.prd_id}'" value="상세보기">
						<br>  
						<input type="button" onclick="location.href='prdInsertForm?prdId=${data1.prd_id}'" value="추가등록"> 
					</td>
				</tr>
				</c:forEach> 
				
			<tr align="center"> 
				<td style="width:100%;" colspan="6">   
					<br>
					<input type="button" style="width:100px;height:70px;" onclick="location.href='prdInsertForm?prdId=0'" value="신규상품등록">  
					<br><br>  
				</td>
			</tr>
			</table>
		</form>
			
		
		</td>
	</tr>
</table>


</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>