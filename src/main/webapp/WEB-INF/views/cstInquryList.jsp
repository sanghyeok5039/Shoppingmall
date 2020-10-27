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
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
a {
	color: #8C8C8C;
	text-decoration: none;
}

a:hover {
	color: #353535;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/top.jsp" flush="false"/>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-3">
    		<%@ include file="/WEB-INF/views/include/csCenterLeftMenu.jsp" %>
	    </div>
		<div class="col-sm-9">
			<h4>1:1 문의</h4>
			<hr>

			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th width="20" style="text-align: center">번호</th>
						<th width="200" style="text-align: center">제목</th>
						<th width="130" style="text-align: center">작성 날짜</th>
						<th width="60" style="text-align: center">답변여부</th>
					</tr>
				</thead>
				<tbody style="background-color:white">
					<c:if test="${CNT==0}">
						<tr>
							<td style="text-align:center" colspan="4"><b>등록된 글이 없습니다.</b></td>
						</tr>
					</c:if>
					<c:forEach var="list" items="${LIST}">
						<tr>
							<td style="text-align: center">${list.qanda_num}</td>
							<td style="text-align: left"><a href="viewMyInqury?iqNum=${list.qanda_num}">${list.qanda_title}</a></td>
							<td style="text-align: center"><fmt:formatDate value="${list.qanda_regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td style="text-align: center">${list.qanda_at}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-12" style="text-align: right">
				<input type="button" value="문의하기" class="btn btn-outline-secondary" onClick="location='writeInquryForm'">
			</div>
			<div class="col-sm-12" style="text-align: center">
				<c:if test="${PRE}">
					<a href="myInquryList?pageNum=${startPage-10}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
						<c:when test="${i==pageNum}">
							<span style="color: black; font-size: larger"><b>${i}</b></span>&nbsp;
							</c:when>
						<c:otherwise>
							<a href="myInquryList?pageNum=${i}">${i}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${NEXT}">
					<a href="myInquryList?pageNum=${startPage+10}">[다음]</a>
				</c:if>
			</div>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>