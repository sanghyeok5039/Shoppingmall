<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<style>
a{
	color: #8C8C8C;
	text-decoration:none;
}

a:hover{
	color: #353535;
	text-decoration:none;
	cursor:pointer;
}
#title{
	align:center;
	background-color:#EAEAEA;
	font-weight: bold;
	width:200px;
}
#content{
	background-color:white;
	text-align:left;
}
</style>
<script type="text/javascript">
function fn_fileDown(fileNo){
	var formObj = $("form[name='readForm']");
	$("#FILE_NO").attr("value", fileNo);
	formObj.attr("action", "/Shoppingmall/noticeFileDown");
	formObj.submit();
}
</script>
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
				<form name="readForm">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
				</form>	
				<table class="table table-bordered">
					<tr>
						<td id="title">글번호</td>
						<td id="content">
							<input type="text" value="${ntcDto.notice_num}" style="border:0px" readOnly>
						</td>
						<td width="100" id="title">조회수</td>
						<td id="content">
							<input type="text" value="${ntcDto.notice_readCount}" style="border:0px" readOnly>
						</td>
					</tr>
					<tr>
						<td id="title">제&emsp;목</td>
						<td colspan="3" id="content">		
							<input type="text" value="${ntcDto.notice_title}" style="border:0px" readOnly>
						</td>
					</tr>
					<tr>
						<td id="title">작성자</td>
						<td colspan="3" width="150" id="content">
							<input type="text" value="${ntcDto.mbr_id}" style="border:0px" readOnly>
						</td>
					</tr>
					<tr>
						<td id="title">작성일</td>
						<td colspan="3" id="content">
							<fmt:formatDate value="${ntcDto.notice_regDate}" pattern="yyyy-MM-dd HH:mm" />
						</td>
					</tr>
					<tr>
						<td id="title">내&emsp;용</td>
						<td colspan="3" id="content">
							<textarea name="notice_content" id="notice_content" rows="10" cols="70"
									style="ime-mode: active;border: none;resize: none" readOnly>${ntcDto.notice_content}
							</textarea>
						</td>
					</tr>
					<tr>
						<td id="title">첨부 파일</td>
						<td colspan="3" id="content">
							<c:forEach var="file" items="${fileList}">
								<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a> (${file.FILE_SIZE}kb)<br>
							</c:forEach>
						</td>
					</tr>
				</table>
				<div class="col-sm-12" style="text-align: right">
					<input type="button" value="목록보기" class="btn btn-outline-secondary" onClick="location.href='csCenterNotice'">
				</div>
			</div>
	</div>
</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>