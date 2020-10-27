<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.js"></script>
<style>
a{
	color:black;
	text-decoration:none;
}
a.detail{
	color:black;
	text-decoration:none;
}
a.detail:hover{
	color: #8C8C8C;
	text-decoration:none;
	cursor:pointer;
}
ul{
	list-style:none;
}

td{
padding-left:15px;
}
#menu{
	height:50px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="container">
    <div class="row">
    	<div class="col-sm-12">
    	<br><br>
    	</div>
        <div class="col-sm-3">
        	<%@ include file="/WEB-INF/views/include/csCenterLeftMenu.jsp" %>
        </div>
        <div class="col-sm-9">
				<h4>공지사항</h4>
				<hr>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th style="text-align: center" width="30">번호</th>
							<th style="text-align: center" width="200">제목</th>
							<th style="text-align: center" width="100">작성자</th>
							<th style="text-align: center" width="150">작성 날짜</th>
							<th style="text-align: center" width="80">조회수</th>
						</tr>
					</thead>
					<tbody style="background-color:white">
						<c:forEach var="list" items="${LIST}">
							<tr>
								<td style="text-align: center">${list.notice_num}</td>
								<td style="text-align: left"><a class="detail"
									href="cstViewNotice?ntcNum=${list.notice_num}">${list.notice_title}</a></td>
								<td style="text-align: center">${list.mbr_id}</td>
								<td style="text-align: center">
									<fmt:formatDate value="${list.notice_regDate}" pattern="yyyy-MM-dd HH:mm" />
								</td>
								<td style="text-align: center">${list.notice_readCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-sm-12" style="text-align: center">
					<c:if test="${PRE}">
						<a href="csCenterNotice?pageNum=${startPage -10}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${i==pageNum}">
								<span style="color: black; font-size: larger"><b>${i}</b></span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="csCenterNotice?pageNum=${i}">${i}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${NEXT}">
						<a href="csCenterNotice?pageNum=${startPage+10}">[다음]</a>
					</c:if>
				</div>
			</div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>