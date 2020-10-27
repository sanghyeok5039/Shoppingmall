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

<script src="js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#secessionCheck").click(function(){
		var id = $("#mbr_id").val();
		var pw = $("#mbr_pw").val();
		if(confirm("탈퇴하시겠습니까?") == true){
			if(id == "" || pw == ""){
				alert("아이디와 비밀번호를 입력해 주세요.")
				return false;
			}
			
			var url = "/myapp/secession.do";
			$.getJSON(url, {
				"id" : id,
				"pw" : pw,
			}, function(json) {
				var result_text = json.result;			
				var result = eval(result_text);
				if(result){
					alert("회원 탈퇴 성공!");
					window.location.replace("home");
				} else {
					alert("아이디나 비밀번호를 확인해주세요.");
				}
			});
		}
		
		
	});
});
</script>
</head>
<body>
<div class ="container-fluid" id = "myPageContent">
<div class="jumbotron bg-info text-white">
<h1 align="center">회원 탈퇴</h1>
</div>
<div class ="form-group">
<table class ="table">
	<tr>
		<td align = "center">아이디 </td>
		<td>			
			<input type = "text" name = "mbr_id" id = "mbr_id" class ="form-control">
		</td>
	</tr>
	<tr>
		<td align = "center">비밀번호 </td>
		<td>
			<input type = "password" name = "mbr_pw" id = "mbr_pw" class ="form-control">
		</td>
	</tr>
</table>
</div>
<button type = "button" name ="secessionCheck" id = "secessionCheck" class ="btn btn-warning btn-block">회원 탈퇴</button>
</div>

</body>
</html>
