<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
		
	// 수정하기
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/Shoppingmall/updateNotice");
		formObj.attr("method", "get");
		formObj.submit();				
	})
		
	// 삭제하기
	$(".delete_btn").on("click", function(){

		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			
		formObj.attr("action", "/Shoppingmall/delNotice?ntcNum=${ntcDto.notice_num}");
		formObj.attr("method", "post");
		formObj.submit();
			
		}
	});
});
function fn_fileDown(fileNo){
	var formObj = $("form[name='readForm']");
	$("#FILE_NO").attr("value", fileNo);
	formObj.attr("action", "/Shoppingmall/noticeFileDown");
	formObj.submit();
}
</script>
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
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-9">
			<h4>공지사항</h4>
			<hr>
			<form name="readForm" method="post">
				<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
				<table class="table table-bordered">
					<tr>
						<td align="right" style="background-color:#EAEAEA">글번호</td>
						<td style="text-align:left"><input type="text" name="notice_num" value="${ntcDto.notice_num}" style="border:0px" readOnly></td>
						<td width="100" align="right" style="background-color:#EAEAEA">조회수</td>
						<td style="text-align:left">
							<input type="text" type="text" name="notice_readCount" value="${ntcDto.notice_readCount}" style="border:0px" readOnly>
						</td>
					</tr>
					<tr>
						<td align="right" style="background-color:#EAEAEA">제&emsp;목</td>
						<td colspan="3" style="text-align:left"><input style="width:500px" name="notice_title" value="${ntcDto.notice_title}"></td>
					</tr>
					<tr>
						<td width="200" align="right" style="background-color:#EAEAEA">작성자</td>
						<td colspan="3" width="150" style="text-align:left">
							<input type="text" name="mbr_id" value="${ntcDto.mbr_id}" readOnly style="border:0px">
						</td>
					</tr>
					<tr>
						<td width="200" align="right" style="background-color:#EAEAEA">작성일</td>
						<td colspan="3" style="text-align:left">${ntcDto.notice_regDate}</td>
					</tr>
					<tr>
						<td align="right" style="background-color:#EAEAEA">내&emsp;용</td>
						<td colspan="3" style="text-align:left">
							<textarea name="notice_content" id="notice_content" rows="10" cols="70"
 						     style="ime-mode:active;">${ntcDto.notice_content}</textarea>
						</td>
					</tr>
					<tr>
						<td width="200" align="right" style="background-color:#EAEAEA">첨부 파일</td>
						<td colspan="3" style="text-align:left">
							<c:forEach var="file" items="${fileList}">
								<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a> (${file.FILE_SIZE}kb)<br>
							</c:forEach>
						</td>
					</tr>
				</table>		
				<div class="col-sm-12" style="text-align:right">
					<button type="button" class="btn btn-outline-secondary" onClick="location.href='noticeList?pageNum=${pageNum}'">목록보기</button>
					<button type="button" class="update_btn btn btn-outline-secondary">수정</button>
					<button type="button" class="delete_btn btn btn-outline-secondary">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>