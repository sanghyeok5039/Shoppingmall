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
<%@ include file="/WEB-INF/views/include/mngTop.jsp"%>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
				<font style="font-size: 3em; weight: bold">게시판 관리</font><br><hr>&emsp; 
				<a href="noticeList" style="color: gray; text-decoration: none">공지사항</a>&emsp;&emsp;
				<a href="inquryList" style="font-size: 1.5em; weight: bold; color: black; text-decoration: none">고객문의</a>&emsp;&emsp;
				<a href="mngViewFAQList?category=1" style="color: gray; text-decoration: none">FAQ 관리</a> <br>
				<hr>
		</div>
		<div class="col-sm-12">
			<b><font size="5em" color="black">Q&amp;A</font>
			   <font size="3em" color="black">&nbsp;1:1 문의</font>
			</b>
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th width="20" style="text-align: center">번호</th>
						<th width="200" style="text-align: center">제목</th>
						<th width="70" style="text-align: center">작성자</th>
						<th width="130" style="text-align: center">작성 날짜</th>
						<th width="60" style="text-align: center">답변</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${LIST.size() == 0 }">
							<tr>
								<td colspan="6" style="text-align:center"><b>등록된 글이 없습니다.</b></td>
							</tr>
					</c:if>
					<c:forEach var="list" items="${LIST}">
						<tr>
							<td style="text-align: center">${list.qanda_num}</td>
							<td style="text-align: left"><a
								href="mngViewInqury?iqNum=${list.qanda_num}&condition=${condition}">${list.qanda_title}</a>
							</td>
							<td style="text-align: center">${list.mbr_id}</td>
							<td style="text-align: center"><fmt:formatDate
									value="${list.qanda_regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td style="text-align: center">${list.qanda_at}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-12" style="text-align: center">
				<c:if test="${PRE}">
					<a
						href="inquryList?pageNum=${startPage -10}&condition=${condition}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
						<c:when test="${i==pageNum}">
							<span style="color: black; font-size: larger"><b>${i}</b></span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="inquryList?pageNum=${i}&condition=${condition}">${i}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${NEXT}">
					<a
						href="inquryList?pageNum=${startPage+10}&condition=${condition}">[다음]</a>
				</c:if>
			</div>
			<div class="col-sm-12">
				<form action="inquryList">
					<select name="condition" class="custom-select" style="width:150px;">
						<option value="ALL"
							<c:if test="${condition eq 'ALL'}">selected</c:if>>전체
							문의글</option>
						<option value="Y"
							<c:if test="${condition eq 'Y'}"  >selected</c:if>>답변완료
						</option>
						<option value="N"
							<c:if test="${condition eq 'N'}"  >selected</c:if>>미답변
						</option>
					</select>
					<input type="submit" class="btn btn-outline-secondary" value="조회">
				</form>
			</div>
		</div>
	</div>
</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>