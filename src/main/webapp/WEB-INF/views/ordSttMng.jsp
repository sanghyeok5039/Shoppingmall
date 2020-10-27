<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  
<meta charset="UTF-8">
<title>주문 상태 관리</title>
<!-- <script src="js/jquery-3.4.1.min.js"></script> -->
<script type="text/javascript" src="<c:url value="js/jquery-3.4.1.min.js"/>"></script>
<script>
$(document).ready(function(){
	$('#all').click(function() {
		   if($("#all").prop("checked")){
	            $("input[name=check]").prop("checked",true);
	        }else{
	            $("input[name=check]").prop("checked",false);
	        };
	});
});
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
<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br><br><br><br>
<div align="center"> 
<h2><b>주문상태 조회</b></h2>

<br><br>  
<form action="ordSttCndtnSrch">
<table >
	<tr bgcolor="#034f84" height="60"  >
		<td align=center width="800">
			<select name="classify">
				<option value="NO">주문번호</option>
				<option value="ID">회원ID</option>
				<option value="NAME">주문자/입금자</option>
				<option value="TEL">연락처</option>
			</select>
			<input type="text" name="srchWord"><input type="submit" value="검색">
		</td>
	</tr>

	<tr height="200"align=center bgcolor=#91A8d0>
		<td colspan=2 >
			<table> 
				<tr> 
					<td width="100" >주문번호</td>
					<td width="100">상품명</td>
					<td width="150">주문일시</td>
					<td width="100">주문자</td>
					<td width="100">총 주문액</td>
					<td width="100">결제방법</td>
					<td width="100">상태</td>
				</tr>
				
				<!-- 반복문 LIST SET -->
				<c:forEach var="orderStt" items="${ORDERLIST}">
				<tr height=50 >
						
					<td>${orderStt.no}</td>
					<td>${orderStt.pname}</td> <!-- 상품명 DTO 새로 파서 상품명까지 담으셈... -->
					<td>${orderStt.odate }</td>
					<td>${orderStt.mname }</td> <!-- 회원 이름 DTO 새로 파서... ㅅㅂ.. -->
					<td>${orderStt.total }</td>
					<td>${orderStt.payment } </td>
					<td>
						<select name="state">
							<option>입금대기</option>
							<option>상품준비중</option>
							<option>배송중</option>
							<option>배송완료</option>
						</select>
					</td>
				</tr>
				</c:forEach>
				
				
			</table>
		</td>
	</tr>
</table>
</form>	

</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>