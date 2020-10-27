<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>

<style>
html, body{
	height:100%; 
	width:100%;
	margin:0;
}
  table {
    /* border-top: 1px solid #444444; */
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    /* padding: 10px; */
  }


body{
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
.container{
	width: 500px;
	/* margin: 0 auto;  */
}



ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
} 
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	/* padding: 15px; */
}

.tab-content.current{
	display: inherit;
}




</style>
<head>
<meta charset="UTF-8">
<title>월/일별 매출조회</title>
<%-- <script type="text/javascript" src="<c:url value="/static/js/jquery-3.4.1.min.js"/>"></script> --%>
<script src="js/jquery-3.4.1.min.js"></script>

<script>

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});

});



</script>
<style>
html, body{
	height:100%;
	width:100%;
	margin:0;
}
  table {
    /* border-top: 1px solid #444444; */
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    /* padding: 10px; */
  }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>

<br><br>
<div align="center"><h3><b>판매 내역 조회</b></h3></div>

<br>

<div class="container">

	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">월간</li>
		<li class="tab-link" data-tab="tab-2">일간</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		<!-- 월별 주문 총액 -->
		<form action="monthlyInqry">
		<table style="width:100%">
		<tr>
		<td>
			<tr align="center">
				<td width="450">
					<br>
					<h3>월별 주문 총액</h3>
				</td>
			</tr>
			<tr align="center">
				<td> 
				<br>  
				<select name="year"  style="width:75px;height:30px;  text-align:center "  >
					<c:forEach var="i" begin="0" end="10" step="1" varStatus="status" >
						<option value="${year-i}" <c:if test="${year-i == param.year}"> selected="selected" </c:if>>
							&nbsp;&nbsp;&nbsp;
							${year-i}
						</option>
					</c:forEach>
				</select>년&nbsp;&nbsp;<input type="submit" value="검색">
				
				<br><br>
				
				</td>
			</tr>
		</table>
		<br>
		<table style="width:100%">
			<tr> 
				<td>
					<table style="width:100%">
						<tr align="center" height="50"><td width="80">월</td><td width="150">총금액</td></tr>
						
						<c:forEach var="monthValue" items="${MONTHLY}" varStatus="status"  >
						<tr align="center" height="50"><td>${status.index+1}월</td><td>${monthValue.revenue} </td></tr>
						</c:forEach>
						
						<tr align="center"  height="50">
							<td width="150">연간총계</td> <td width="300">${mTOT}</td>
						</tr>
					</table>
				</td>
			</tr>
			
		</table>
		</form>
		
		
	</div>
	
				
	<div id="tab-2" class="tab-content">
	<form action="dailyInqry">
	<table style="width:100%">
		<tr align="center">
			<td width="450">
				<br>
				<h3>일별 주문 총액</h3>
			</td>
		</tr>
		<tr align="center">
			<td>
			<br>
			<select name="year" style="width:75px;height:30px;  text-align:center " >
				<c:forEach var="i" begin="0" end="10" step="1" varStatus="status" >
					<option value="${year-i}" <c:if test="${year-i == param.year}"> selected="selected" </c:if> >
						&nbsp;&nbsp;&nbsp;
						${year-i}
					</option>
				</c:forEach>
			</select>년&nbsp;&nbsp;
				
			<select name="month" style="width:65px;height:30px;  text-align:center " >
				<c:forEach var="month" begin="1" end="12" step="1" varStatus="status" >
					<option value="${month}"<c:if test="${month == param.month}"> selected="selected" </c:if> >

						<c:if test="${month < 10 }">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${month}
						</c:if>
						<c:if test="${month >= 10 }">
							&nbsp;&nbsp;&nbsp;&nbsp;
							${month}
							
						</c:if>
						 
					</option>
				</c:forEach>
			</select>월&nbsp;&nbsp;&nbsp;<input type="submit" value="검색">
				
			<br><br>
			</td>
		</tr>
		</table>
		
		<br>		
		
		<table style="width:100%">
			<tr align="center"  height="50"><td width="80">일</td><td width="150">총금액</td></tr>
			
			<c:forEach var="dailyValue" items="${DAILY}" varStatus="status" >
			<tr align="center"  height="50"><td>${status.index+1}</td><td>${dailyValue.revenue}</td></tr>
			</c:forEach>
			
			<tr  align="center"  height="50" >
				<td width="150">총계</td> <td width="300">${dTOT}</td>
			</tr>
		</table>
	</form>
	</div>
	

</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>