<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
.noneBorder{
	border-right: none;
}

.td1 {
	background-color: gray;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/mngTop.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<button type="button" class="btn btn-secondary btn-lg btn-block" 
				onclick="location.href='closing'"><span style="font-size:2em;font-weight:bold">마감하기</span></button>
				<form method=post action="saleListCondition">
					<table border="1">
						<tr>
							<td style="background-color: #BDBDBD; width: 100px;text-align:center"><b>기간선택</b></td>
							<td id="noneBorder">
								<select name="year" id="year">
									<option value=2020 <c:if test="${year == 2020}">selected</c:if>>2020년</option>
									<option value=2019 <c:if test="${year == 2019}">selected</c:if>>2019년</option>
									<option value=2018 <c:if test="${year == 2018}">selected</c:if>>2018년</option>
									<option value=2017 <c:if test="${year == 2017}">selected</c:if>>2017년</option>
								</select> 
								<select name="month" id="month">
									<option value=1 <c:if test="${month == 1}" >selected</c:if>>1월</option>
									<option value=2 <c:if test="${month == 2}" >selected</c:if>>2월</option>
									<option value=3 <c:if test="${month == 3}" >selected</c:if>>3월</option>
									<option value=4 <c:if test="${month == 4}" >selected</c:if>>4월</option>
									<option value=5 <c:if test="${month == 5}" >selected</c:if>>5월</option>
									<option value=6 <c:if test="${month == 6}" >selected</c:if>>6월</option>
									<option value=7 <c:if test="${month == 7}" >selected</c:if>>7월</option>
									<option value=8 <c:if test="${month == 8}" >selected</c:if>>8월</option>
									<option value=9 <c:if test="${month == 9}" >selected</c:if>>9월</option>
									<option value=10 <c:if test="${month == 10}">selected</c:if>>10월</option>
									<option value=11 <c:if test="${month == 11}">selected</c:if>>11월</option>
									<option value=12 <c:if test="${month == 12}">selected</c:if>>12월</option>
								</select>
								<input type="submit" id="submit" value="검색" style="text-align:right">
							</td>
							<td width="650px"></td>
						</tr>
						<tr>
							<td style="background-color: #BDBDBD; width: 100px; text-align:center"><b>매출</b></td>
							<td style=" vertical-align:top">
								<h4>&nbsp;${year}년</h4>
								<table border="1" style="text-align:center;">
									<tr>
										<th>월</th>
										<th>총금액</th>
									</tr>
									<c:forEach var="i" begin="1" end="12">
										<tr>
											<td style="width: 200px; background-color: #EAEAEA">${i}월</td>
											<td style="width: 600px; text-align: right"><fmt:formatNumber
													value="${mList.get(i)}" pattern="#,###,###,###" />원</td>
										</tr>
									</c:forEach>
									<tr>
										<td style="width: 200px; background-color: #EAEAEA"><b>연 매출</b></td>
										<td style="width: 600px; text-align: right"><fmt:formatNumber
												value="${yearTot}" pattern="#,###,###,###" />원</td>
									</tr>
								</table>
							</td>
							<td>
								<h4>&nbsp;${month}월</h4>
								<table border="1" style="text-align: center">
									<tr>
										<th>일</th>
										<th>총금액</th>
										<th>일</th>
										<th>총금액</th>
									</tr>
									<c:forEach var="i" begin="1" end="15">
										<tr>
											<td style="width: 200px; background-color: #EAEAEA">${i}일</td>
											<td style="width: 600px; text-align: right"><fmt:formatNumber
													value="${dList.get(i)}" pattern="#,###,###,###" />원</td>
											<td style="width: 200px; background-color: #EAEAEA">${i+16}일</td>
											<td style="width: 600px; text-align: right"><fmt:formatNumber
													value="${dList.get(i+16)}" pattern="#,###,###,###" />원</td>
										</tr>
									</c:forEach>
									<tr>
										<td style="width: 200px; background-color: #EAEAEA">16일</td>
										<td style="width: 600px; text-align: right"><fmt:formatNumber
												value="${dList.get(16)}" pattern="#,###,###,###" />원</td>
										<td style="width: 200px; background-color: #EAEAEA"><b>월 매출</b></td>
										<td style="width: 600px; text-align: right"><fmt:formatNumber
												value="${monthTot}" pattern="#,###,###,###" />원</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>