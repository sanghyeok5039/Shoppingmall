<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/content.css" />
<script type = "text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src="resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script
	src="js/popper.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#findId").click(function() {
			var name = $("input[name='mbr_name']").val();
			var tel = $("input[name='mbr_idtel']").val();
			if (name == "" || tel == "") {
				alert("이름 또는 전화번호를 입력하세요.");
				return false;
			}
			var url = "/Shoppingmall/idFind.do";
			
			$.getJSON(url, {
				"name" : name,
				"tel" : tel,
			}, function(json) {
				var result_text = json.result;			
				var result = eval(result_text);
				if(result){
					alert("아이디는 " + json.id + " 입니다.");
				} else {
					alert("해당 아이디가 없습니다");
				}
			});
		});
		$("#findPw").click(function() {
			var id = $("input[name='mbr_id']").val();
			var tel = $("input[name='mbr_pwtel']").val();
			if (id == "" || tel == "") {
				alert("아이디 또는 전화번호를 입력하세요.");
				return false;
			}
			var url = "/Shoppingmall/pwFind.do";
			
			$.getJSON(url, {
				"id" : id,
				"tel" : tel,
			}, function(json) {
				var result_text = json.result;			
				var result = eval(result_text);
				if(result){
					alert("비밀번호는 " + json.pw + " 입니다.");
				} else {
					alert("비밀번호를 찾을 수 없습니다.");
				}
			});
		});
	});
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>ID/PW 찾기</h1>
        </div>
      </div>
    </div>
  </div> 
</div>
<div class = "main main-raised">
	<div class="container" id="content" style ="padding-top: 60px; padding-bottom: 60px">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<table class="table table-bordered">
						<tr>
							<td colspan="3" style="text-align: center"><h3>아이디 찾기</h3></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="이름"
								id="mbr_name" name="mbr_name"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="전화번호" id="mbr_idtel" name="mbr_idtel"></td>
						</tr>
						<tr>
							<td><input id="findId" name="findId" type="button"
								value="아이디 찾기" class="btn btn-primary btn-block center-block"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<table class="table table-bordered">
						<tr>
							<td colspan="3" style="text-align: center"><h3>비밀번호 찾기</h3></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="아이디" id="mbr_id" name="mbr_id"></td>

						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="전화번호" id="mbr_pwtel" name="mbr_pwtel"></td>
						</tr>
						<tr>
							<td class="align-middle"><input type="button"
								value="비밀번호 찾기" id="findPw" name="findPw"
								class="btn btn-primary btn-block center-block"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class = "col-lg-12" style="text-align:center;">	
			<button id="loginPage" onclick="location.href='loginPage'"
				class="btn btn-primary btn-block center-block">로그인</button>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>