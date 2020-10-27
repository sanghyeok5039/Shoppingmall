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
<title>로그인</title>
<script>
	$(document).ready(function() {		
		$("#nonMbr_ordList").click(function() {
			var tel = $("#mbr_tel").val();
			var pw = $("#ord_pw").val();
			if (tel == "" || pw == "") {
				alert("연락처 또는 주문 비밀번호를 입력하세요.");
				return false;
			}
			var url = "/Shoppingmall/getNonMbr.do";
			
			$.getJSON(url, {
				"tel" : tel,
				"pw" : pw,
			}, function(json) {
				var result_text = json.result;			
				var result = eval(result_text);
				if(result){
					var re = "showOrderlist?mbr_id=" + json.mbr_id + "&startNum=1";
					window.location.replace(re);
				} else {
					alert("연락처나 주문 비밀번호를 확인해주세요.");
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
          <h1>비회원 주문조회</h1>
          <h3 class="title text-center"><a href = "loginPage">회원은 로그인 후 주문조회 가능</a></h3>
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
						<td><input type="text" class="form-control" placeholder="연락처"
							id="mbr_tel" name="mbr_tel"></td>
					</tr>
					<tr>
						<td><input type="password" class="form-control"
							placeholder="주문 비밀번호" id="ord_pw" name="ord_pw"></td>
					</tr>
					<tr>
						<td><input id="nonMbr_ordList" type="submit" value="비회원 주문 조회"
							class="btn btn-primary btn-block center-block"></td>
					</tr>
				</table>
		</div>
		<h3 align="center">주문 비밀번호는 관리자에게 문의하세요</h3>
	</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>