<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#myPageContent {
	position:relative;
	padding-bottom: 100px;
}
</style>
<script type = "text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src="resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){		
	var pwReg = /^[a-z]+[a-z0-9]{7,20}$/gi;
	var emailReg =  /^[a-z]+[a-z0-9]/gi;
	var numReg = /[0-9]/gi;
	
	$("#selectEmail").change(function() {
		if($(this).val()=="inputSelf"){
			$('#emailSuffix').val("");
			$("#emailSuffix").attr("readonly", false);
		} else {
			$('#emailSuffix').val($(this).val());
			$("#emailSuffix").attr("readonly", true);
		}
	});
	$("#update").click(function(){
		//항목 체크
		
		var pw = $("input[name='mbr_pw']").val();
		if(pw == ""){
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
		if(name == ""){
			alert("이름를 입력하세요.");
			$("#mbr_name").focus();
			return false;
		}
		
		var brth = $("input[name='mbr_brthdy']").val();
		if(brth == "" || numReg.test(brthdy) == false || brthdy.length != 8){
			alert("생년월일을 입력하세요.");
			$("#mbr_brthdy").focus();
			return false;
		}
		
		var tel = $("input[name='mbr_tel']").val();
		if(tel == ""  || numReg.test(tel) == false || tel.length > 12){
			alert("연락처를 입력하세요.");
			$("#mbr_pw").focus();
			return false;
		}
		
		var post = $("input[name='postcode']").val();
		if(post == ""){
			alert("주소를 입력하세요.");
			$("#postcode").focus();
			return false;
		}
		
		var email = $("input[name='emailPrefix']").val();
		var emailsuf = $("input[name='emailSuffix']").val();
		if(email == "" || emailsuf == "" || emailReg.test(email) == false){
			alert("이메일을 확인하세요.");
			$("#emailPrefix").focus();
			return false;
		}
		
		if(confirm("수정하시겠습니까?") == true){
			document.form.submit();
		} else {
			return;
		}
	});
	$('#mbr_pwConfirm').keyup(function(){
		var pass1 = $("#mbr_pw").val();
		var pass2 = $("#mbr_pwConfirm").val();
		
		if(pass1 == pass2){
			$("#passEqual2").html("<span style='color:green'>비밀번호가 일치합니다.</span>");
		} else {
			$("#passEqual2").html("<span style='color:red'>비밀번호가 일치하지 않습니다.</span>");
		}
	});
});
</script>

<%@ include file="postSearch.jsp" %>
<%@ include file="datepicker.jsp" %>

</head>
<body>
<div class = "jumbotron bg-info text-white">
	<h1 align="center">회원 정보 수정</h1>
</div>
<div class ="container-fluid" id = "myPageContent">
<form action="updateMbr" method="post" class = "form">
<table class = "table">
	<tr>
		<td>아이디<font style="color:red;">*</font></td>
		<td><input type ="text" class = "form-control" id = "mbr_id" name = "mbr_id" value ="${loginUser.mbr_id }" readonly = "readonly"></td>
	</tr>
	<tr>
		<td>비밀번호<font style="color:red;">*</font></td>
		<td><input type ="password" class = "form-control" id = "mbr_pw" name = "mbr_pw"></td>
		<td>(영어 대소문자/숫자, 8~16글자)</td>
	</tr>
	<tr>
		<td>비밀번호 확인<font style="color:red;">*</font></td>
		<td><input type ="password" class = "form-control" id = "mbr_pwConfirm" name = "mbr_pwConfirm"></td>
		<td><span id="passEqual2"></span></td>
	</tr>
	<tr>
		<td>이름<font style="color:red;">*</font></td>
		<td><input type ="text" class = "form-control" id = "mbr_name" name = "mbr_name" value = "${loginUser.mbr_name }"></td>
	</tr>
	<tr>
		<td>성별<font style="color:red;">*</font></td>
		<td>
			<c:if test="${loginUser.mbr_sex eq '남성'}">
				<input type = "radio" name = "mbr_sex" id = "mbr_sex_male" value="male" checked>남성
				<input type = "radio" name = "mbr_sex" id = "mbr_sex_female" value="female">여성
			</c:if>
			<c:if test="${loginUser.mbr_sex eq '여성'}">
				<input type = "radio" name = "mbr_sex" id = "mbr_sex_male" value="male">남성
				<input type = "radio" name = "mbr_sex" id = "mbr_sex_female" value="female" checked>여성
			</c:if>
		</td>
	</tr>
	<tr>
		<td>생년월일<font style="color:red;">*</font></td>
		<td>
			<input type ="text" class = "form-control" id ="mbr_brthdy" name = "mbr_brthdy" value = "${loginUser.mbr_brthdy }">
		</td>
	</tr>
	<tr>
		<td>연락처<font style="color:red;">*</font></td>
		<td><input type ="text" class = "form-control" id = "mbr_tel" name ="mbr_tel" value ="${loginUser.mbr_tel }"></td>
	</tr>
	<tr>
		<td>주소<font style="color:red;">*</font></td>
		<td><input type="text" class = "form-control" id="postcode" name ="postcode" placeholder="우편번호" value = "${loginUser.postcode }" readonly></td>
		<td><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class ="btn btn-primary"></td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td colspan="3"><input type="text" id="roadAddress" name = "roadAddress" placeholder="도로명주소" class="form-control" value = "${loginUser.roadAddress }"></td>	
	</tr>
	<tr>
		<td>지번 주소</td>
		<td colspan="3"><input type="text" id="jibunAddress" name = "jibunAddress" placeholder="지번주소" class="form-control"></td>
	</tr>
	<tr>
		<td>상세주소</td>
		<td colspan="3"><input type="text" id="detailAddress" name = "detailAddress" placeholder="상세주소" class="form-control" value = "${loginUser.detailAddress }"></td>	
	</tr>
	<tr>
		<td><span id="guide" style="color:#999;display:none"></span>참고항목</td>
		<td colspan="3"><input type="text" id="extraAddress" name = "extraAddress" placeholder="참고항목" class="form-control"></td>
	</tr>
	<tr>
	<tr>
		<td>이메일<font style="color:red;">*</font></td>
		<td>
			<div class="row">
				<div class ="col-5">
					<input type ="text" id = "emailPrefix" class = "form-control" name = "emailPrefix" style ="width:100%" value = "${loginUser.emailPrefix }">
				</div>
				<div class ="col-1">
					@
				</div>
				<div class ="col-5">
					<input type = "text" id = "emailSuffix" class = "form-control" name = "emailSuffix" style ="width:100%" value = "${loginUser.emailSuffix }">		
				</div>
			</div>
		</td>
		<td>
			<select id = "selectEmail" name = "selectEmail" class ="custom-select">
				<option value = "inputSelf" selected="selected">직접 입력</option>
				<option value = "naver.com">naver.com</option>
				<option value = "daum.net">daum.net</option>
				<option value = "gmail.com">gmail.com</option>
			</select>
		</td>
	</tr>
</table>
<input type = "submit" id ="update" value = "정보 수정" class = "btn btn-primary btn-block">
</form>
</div>
</body>
</html>