<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#content {
	position: relative;
	padding-bottom: 100px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/content.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	var idcheck = false;
	var idReg = /^[a-z]+[a-z0-9]{3,15}$/gi;
	var pwReg = /^[a-z]+[a-z0-9]{7,20}$/gi;
	var numReg = /[0-9]/gi;
	var emailReg =  /^[a-z]+[a-z0-9]/gi;
	$("#checkId").click(function() {
		var id = $("input[name='mbr_id']").val();
		if (id == "") {
			alert("아이디를 입력하세요.");
			idcheck = false;
			$("mbr_id").focus();
			return false;
		}
		   
        if( !idReg.test(id) ) {
            alert("아이디는 영문자로 시작하는 4~15자 영문자 또는 숫자이어야 합니다.");
            idcheck = false;
			$("mbr_id").focus();
			return false;
        }
			
		var url = "/Shoppingmall/idCheck.do";

		$.getJSON(url, {
			"id" : id
		}, function(json) {
			var result_text = json.result;
			var result = eval(result_text);

			if (result) {
				alert("사용 가능한 ID입니다.");
				$("mbr_id").focus();
				idcheck = true;
			} else {
				alert("사용 불가능한 ID입니다.");
				$("mbr_id").focus();
				idcheck = false;
			}
		});

	});

	$("#selectEmail").change(function() {
		if ($(this).val() == "inputSelf") {
			$("#emailSuffix").val("");
			$("#emailSuffix").attr("readonly", false);
		} else {
			$("#emailSuffix").val($(this).val());
			$("#emailSuffix").attr("readonly", true);
		}
	});
	
	$("#submit").click(function() {
		var id = $("input[name='mbr_id']").val();
		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#mbr_id").focus();
			return false;
		}
		if(idcheck == false) {
			alert("아이디 중복 검사가 필요합니다.");
			$("#mbr_id").focus();
		}

		var pw = $("input[name='mbr_pw']").val();
		if (id == "") {
			alert("패스워드를 입력하세요.");
			$("#mbr_pw").focus();
			return false;
		}
		
		if(!pwReg.test(pw)){
			alert("비밀번호는 영문자로 시작하는 8~20자 영문자 또는 숫자이어야 합니다.");
			$("#mbr_pw").focus();
			return false;
		}

		var name = $("input[name='mbr_name']").val();
		if (name == "") {
			alert("이름를 입력하세요.");
			$("#mbr_name").focus();
			return false;
		}

		var brthdy = $("input[name='mbr_brthdy']").val();
		if (brthdy == "" || numReg.test(brthdy) == false || brthdy.length != 8) {
			alert("생년월일을 확인하세요.");
			$("#mbr_brthdy").focus();
			return false;
		}

		var tel = $("input[name='mbr_tel']").val();
		if (tel == "" || numReg.test(tel) == false || tel.length > 12) {
			alert("연락처를 확인하세요.");
			$("#mbr_pw").focus();
			return false;
		}

		var postcode = $("input[name='postcode']").val();
		if (postcode == "") {
			alert("주소를 입력하세요.");
			$("#postcode").focus();
			return false;
		}
		
		var detailAddress = $("input[name='detailAddress']").val();
		if (detailAddress == "") {
			alert("상세주소를 입력하세요.");
			$("#detailAddress").focus();
			return false;
		}

		var email = $("input[name='emailPrefix']").val();
		var emailsuf = $("input[name='emailSuffix']").val();
		if (email == "" || emailsuf == "" || emailReg.test(email) == false) {
			alert("이메일을 확인하세요.");
			$("#emailPrefix").focus();
			return false;
		}
		

		if ($("#termsAgree1").is(":checked") == false) {
			alert("terms1 not check");
			return false;
		}
		if ($("#termsAgree2").is(":checked") == false) {
			alert("terms2 not check");
			return false;
		}
	});
	$('#mbr_pwConfirm').keyup(function() {
		var pass1 = $("#mbr_pw").val();
		var pass2 = $("#mbr_pwConfirm").val();

		if (pass1 == pass2) {
			$("#passEqual2")
			.html(
			"<span style='color:green'>비밀번호가 일치합니다.</span>");
		} else {
			$("#passEqual2")
			.html(
			"<span style='color:red'>비밀번호가 일치하지 않습니다.</span>");
		}
	});
});
</script>

<%@ include file="postSearch.jsp"%>
<%@ include file="datepicker.jsp"%>
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

	<%@ include file="/WEB-INF/views/include/top.jsp"%>
	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand text-center">
						<h1>회원 가입</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="container-fiuld" id="content">
			<div class="container"
				style="padding-top: 60px; padding-bottom: 60px">
				<form action="insertMbr" method="post" class ="form">
					<div class="form-group">
						<table class="table">
							<tr>
								<td>아이디<font style="color: red;">*</font></td>
								<td><input class="form-control" type="text" id="mbr_id"
									name="mbr_id"></td>
								<td><input class="form-control" type="button" class ="btn" id="checkId"
									value="아이디 중복확인"></td>
								<td>(4~15글자, 영어 대소문자/숫자만 가능)</td>
							</tr>
							<tr>
								<td>비밀번호<font style="color: red;">*</font></td>
								<td><input class="form-control" type="password" id="mbr_pw"
									name="mbr_pw" maxlength='16'></td>
								<td></td>
								<td>(8~20글자, 영어 대소문자/숫자만 가능)</td>
							</tr>
							<tr>
								<td>비밀번호 확인<font style="color: red;">*</font></td>
								<td><input class="form-control" type="password"
									id="mbr_pwConfirm" name="mbr_pwConfirm" maxlength='16'></td>
								<td><span id="passEqual2"></span></td>
							</tr>
							<tr>
								<td>이름<font style="color: red;">*</font></td>
								<td><input class="form-control" type="text" id="mbr_name"
									name="mbr_name"></td>
							</tr>
							<tr>
								<td>성별<font style="color: red;">*</font></td>
								<td><input type="radio" name="mbr_sex"
									id="mbr_sex" value="male" checked>남자 
									<input type="radio" name="mbr_sex" id="mbr_sex"
									value="female">여자</td>
							</tr>
							<tr>
								<td>생년월일<font style="color: red;">*</font></td>
								<td><input class="form-control" type="text" id="mbr_brthdy"
									name="mbr_brthdy"></td>
							</tr>
							<tr>
								<td>연락처<font style="color: red;">*</font></td>
								<td><input class="form-control" type="text" id="mbr_tel"
									name="mbr_tel"></td>
								<td>'-' 제외</td>
							</tr>
							<tr>
								<td>주소<font style="color: red;">*</font></td>
								<td><input class="form-control" type="text" readonly
									id="postcode" name="postcode" placeholder="우편번호" readonly></td>
								<td><input class="form-control btn btn-primary" type="button"
									onclick="execDaumPostcode()" value="우편번호 찾기"></td>
							</tr>
							<tr>
								<td>도로명 주소</td>
								<td colspan="3"><input class="form-control" type="text"
									id="roadAddress" name="roadAddress" placeholder="도로명주소"
									class="form-control"></td>
							</tr>
							<tr>
								<td>지번 주소</td>
								<td colspan="3"><input class="form-control" type="text"
									id="jibunAddress" name="jibunAddress" placeholder="지번주소"
									class="form-control"></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td colspan="3"><input class="form-control" type="text"
									id="detailAddress" name="detailAddress" placeholder="상세주소"
									class="form-control"></td>
							</tr>
							<tr>
								<td><span id="guide" style="color: #999; display: none"></span>참고항목</td>
								<td colspan="3"><input class="form-control" type="text"
									id="extraAddress" name="extraAddress" placeholder="참고항목"
									class="form-control"></td>
							</tr>
							<tr>
								<td>
									이메일<font style="color: red;">*</font>
								</td>
								<td>
									<div class ="row">
										<div class ="col-5">
											<input class="form-control" type="text" id="emailPrefix" name="emailPrefix">
										</div>
										<div class ="col-1">
											@
										</div>
										<div class ="col-5">
											<input class="form-control" type="text" id="emailSuffix" name="emailSuffix">
										</div>
									</div>
								</td>
								<td>
									<select class="custom-select" id="selectEmail" name="selectEmail">
										<option value="inputSelf" selected="selected">직접 입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</td>
							</tr>
						</table>
					<hr>

					<h2>약관 1</h2>
					<br>
					<textarea class="form-control" readonly rows="10" cols="80"
						style="resize: none;"><%@ include file="/resources/terms/term1.jsp" %></textarea>
					<br><div align="right"> <input type="checkbox" id="termsAgree1"
						name="termsAgree1" >동의 1 </div>
					<br>
					<hr>
					<h2>약관 2</h2>
					<br>
					<textarea class="form-control" readonly rows="10" cols="80"
						style="resize: none;"><%@ include file="/resources/terms/term2.jsp" %></textarea>
					<br> <div align="right">
					<input type="checkbox" id="termsAgree2"
						name="termsAgree2">동의 2 <br> </div>
					<hr> 
					<input type="submit" class ="btn btn-primary btn-block" value="회원가입" id="submit" name="submit">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footerContainer.jsp"%>
</div>
</body>
</html>