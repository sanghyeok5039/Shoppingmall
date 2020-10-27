<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/content.css" />
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
<title>로그인</title>
<script>
	$(document).ready(function() {		
		$("#signIn").click(function() {
			var id = $("#mbr_id").val();
			var pw = $("#mbr_pw").val();
			if (id == "" || pw == "") {
				alert("아이디 또는 비밀번호를 입력하세요.");
				return false;
			}
			var url = "/Shoppingmall/login.do";
			
			$.getJSON(url, {
				"id" : id,
				"pw" : pw,
			}, function(json) {
				var result_text = json.result;			
				var result = eval(result_text);
				if(result){
					alert(json.id + " 님 환영합니다.");
					window.location.replace("home");
				} else {
					alert("아이디나 비밀번호를 확인해주세요.");
				}
			});
		});
		
	});
</script>
</head>
<body onload = "myFunction()">

<div id = "folding" style="background-image: url('resources/assets/img/bg10.jpg'); width: 100%; height: 100%" >
<img alt="" src="">
<div class="sk-folding-cube" >
  <div class="sk-cube1 sk-cube"></div>
  <div class="sk-cube2 sk-cube"></div>
  <div class="sk-cube4 sk-cube"></div>
  <div class="sk-cube3 sk-cube"></div>
</div>
</div>
<script>
var myVar;

function myFunction() {
  myVar = setTimeout(showPage, 1000);
}

function showPage() {
  document.getElementById("folding").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>

<div style="display:none;" id = "myDiv" class ="animate-bottom">
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="page-header header-filter" data-parallax="true" style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>로그인</h1>
        </div>
      </div>
    </div>
  </div> 
</div>
<div class = "main main-raised">
	<div class = "container-fluid" style ="padding-top: 60px; padding-bottom: 60px">
	<div class="container" id="loginContent" style= "width:540px; padding-top: 60px">	
		<div class="form-group">
				<table class="table">
					<tr>
						<td><input type="text" class="form-control" placeholder="아이디"
							id="mbr_id" name="mbr_id"></td>
					</tr>
					<tr>
						<td><input type="password" class="form-control"
							placeholder="비밀번호" id="mbr_pw" name="mbr_pw"></td>
					</tr>
					<tr>
						<td><input id="signIn" type="submit" value="회원 로그인"
							class="btn btn-primary btn-block center-block"></td>
					</tr>
				</table>
			<table class="table">
				<tr>
					<td><input id="findId" type="button" value="아이디/비밀번호 찾기"
						onclick="location.href='findIdPw'"
						class="btn btn-primary btn-block"></td>
				</tr>
				<tr>
					<td><input id="signUp" type="button" value="회원 가입"
						onclick="location.href='signUpPage'"
						class="btn btn-primary btn-block"></td>
				</tr>
			</table>
		</div>
	</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>

</div>
</body>
</html>