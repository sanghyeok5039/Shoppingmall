<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function check(){
	
	var title = document.getElementById('notice_title');
	if(title.value==""||title.value==null){
		alert('제목을 입력하세요.');
		return false;
	}
	
	var content = document.getElementById('notice_content');
	if(content.value==""||content.value==null){
		alert('내용을 입력하세요.');
		return false;
	}
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
			<h4>공지사항 등록</h4>
			<hr>
			
			<form name="writeForm" method="post" action="writeNotice" enctype="multipart/form-data" onsubmit="return check()">
				<table class="table table-bordered">
					<tr>
						<td align="right" style="background-color:#EAEAEA">제목</td>
						<td style="text-align:left">
							<input type="text"  size="40" maxlength="50" 
							 name="notice_title" id="notice_title" style="ime-mode:active;">
						</td>
					</tr>
					<tr>
						<td align="right" style="background-color:#EAEAEA">내용</td>
						<td style="text-align:left">
							<textarea name="notice_content" id="notice_content" rows="10" cols="70"
 						     style="ime-mode:active;resize:none"></textarea>
						</td>
					</tr>
					<tr>
						<td align="right" style="background-color:#EAEAEA">첨부파일</td>
						<td>
							<input type="file" name="file">
						</td>
					</tr>
				</table>
				<div class="col-sm-12" style="text-align:right">
					<button type="button" class="btn btn-outline-secondary" onClick="location.href='noticeList?pageNum=${pageNum}'">목록보기</button>
					<input type="submit" class="btn btn-outline-secondary" value="글등록">
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>