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
<script src="js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#check_all').click(function(){
		if($("#check_all").prop("checked")){
			$("input[name=ntcNum]").prop("checked",true);
		}
		else{
			$("input[name=ntcNum]").prop("checked",false);
		}
		//$('#check_pno').prop('checked',this.checked);
	});
});
function check(){
	if($("input:checkbox[name=ntcNum]:checked").length==0){
		alert("삭제할 공지사항을 하나 이상 선택하세요.")
		return false;
	}
	return true;
};
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
		<div class="col-sm-12">
			<font style="font-size:3em;weight:bold">게시판 관리</font><br><hr>&emsp;
			<a href="noticeList" style="font-size:1.5em;weight:bold;color:black;text-decoration:none">공지사항</a>&emsp;&emsp;
			<a href="inquryList" style="color:gray;text-decoration:none">고객문의</a>&emsp;&emsp;
			<a href="mngViewFAQList?category=1" style="color:gray;text-decoration:none">FAQ 관리</a>
			<br><hr>
		</div>
		<div class="col-sm-12">
			<b><font size="5em" color="black">NOTICE</font>
			   <font size="3em" color="black">&nbsp;공지사항</font>
			</b>
			<form method="post" action="delNotice" onSubmit="return check()">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th style="text-align:center" width="30">
								<input type="checkbox" name="all" id="check_all">
							</th>
							<th style="text-align:center" width="30">번호</th>
							<th style="text-align:center" width="200">제목</th>
							<th style="text-align:center" width="100">작성자</th>
							<th style="text-align:center" width="150">작성 날짜</th>
							<th style="text-align:center" width="50">조회수</th>
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
							<td style="text-align:center">
								<input type="checkbox" name="ntcNum" id="check_pno" value="${list.notice_num}">
							</td>
							<td style="text-align:center">${list.notice_num}</td>
							<td style="text-align:left"><a href="viewNotice?ntcNum=${list.notice_num}&pageNum=${pageNum}">${list.notice_title}</a></td>
							<td style="text-align:center">${list.mbr_id}</td>
							<td style="text-align:center">
								<fmt:formatDate value="${list.notice_regDate}" pattern="yyyy-MM-dd HH:mm" />
							</td>
							<td style="text-align:center">${list.notice_readCount}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-sm-12" style="text-align:center">
					<c:if test="${PRE}">
						<a href="noticeList?pageNum=${startPage -10}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${i==pageNum}">
								<span style="color:black;font-size:larger"><b>${i}</b></span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="noticeList?pageNum=${i}">${i}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${NEXT}">
						<a href="noticeList?pageNum=${startPage+10}">[다음]</a>
					</c:if>
				</div>
				<div class="col-sm-12" style="text-align:right">
					<input type="button" class="btn btn-outline-secondary" value="글등록" onClick="location='writeNoticeForm'">&nbsp;
					<input type="submit" class="btn btn-outline-secondary" value="선택 글삭제">
				</div>
			</form>
		</div>
	</div>
</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>