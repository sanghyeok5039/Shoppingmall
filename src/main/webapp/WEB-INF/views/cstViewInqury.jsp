<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<br>
			</div>
			<div class="col-sm-3">
				<%@ include file="/WEB-INF/views/include/csCenterLeftMenu.jsp"%>
			</div>
			<div class="col-sm-9">
				<h4>문의</h4>
				<hr>
				<table class="table table-bordered">
					<tr>
						<td align="right" style="background-color: #EAEAEA">제목</td>
						<td colspan="3" style="text-align: left">${iqDto.qanda_title}</td>
					</tr>
					<tr>
						<td width="200" align="right" style="background-color: #EAEAEA">작성자</td>
						<td width="250" style="text-align: left">${iqDto.mbr_id}</td>
						<td width="200" align="right" style="background-color: #EAEAEA">작성일</td>
						<td style="text-align: left">
							<fmt:formatDate value="${iqDto.qanda_regDate}" pattern="yyyy-MM-dd HH:mm" />
						</td>
					</tr>
					<tr>
						<td align="right" style="background-color: #EAEAEA">첨부파일</td>
						<td colspan="3" style="text-align: left"><c:forEach
								var="file" items="${fileList}">
								<a href="#"
									onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
							</c:forEach></td>
					</tr>
					<tr>
						<td align="right" style="background-color: #EAEAEA">내용</td>
						<td colspan="3" style="text-align: left">${iqDto.qanda_content}</td>
					</tr>
					<tr>
						<td align="right" style="background-color: #EAEAEA">답변 내용</td>
						<td colspan="3" style="text-align: left"><textarea
								name="qanda_answer" rows="10" cols="70"
								style="ime-mode: active;" readonly onfocus="this.blur();">${iqDto.qanda_answer}</textarea>
						</td>
					</tr>
				</table>
				<input type="hidden" value="${iqDto.qanda_num}" name="qanda_num">
			</div>
			<div class="col-sm-12" style="text-align: right">
				<input type="button" value="문의글 보기" class="btn btn-outline-secondary"
					onClick="location='myInquryList?${pageNum}'">
			</div>
		</div>
	</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>