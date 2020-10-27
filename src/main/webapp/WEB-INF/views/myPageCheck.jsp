<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#myPageContent {
	position:relative;
	padding-bottom: 100px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#idPwCheck").click(function(){
		if($("#mbr_id").val() == "" || $("#mbr_pw").val() == ""){
			alert("아이디와 비밀번호를 입력해 주세요.")
		}
	});
});
</script>

</head>
<body>
<div class="jumbotron bg-info text-white">
	<h1 align="center">본인 확인</h1>
</div>
<div class = "container" id = "myPageContent">
<form action = "myPage" method = "post" class ="form">
<table class = "table">
	<tr>
		<td align = "center">아이디  </td>
		<td><input type = "text" class ="form-control" name = "mbr_id" id = "mbr_id"></td>
	</tr>
	<tr>
		<td align = "center">비밀번호  </td>
		<td><input type = "password" class ="form-control" name = "mbr_pw" id = "mbr_pw"></td>
	</tr>
</table>
<input type = "submit" name ="idPwCheck" class = "btn btn-primary btn-block "id = "idPwCheck" value = "확인">
</form>
</div>
</body>
</html>