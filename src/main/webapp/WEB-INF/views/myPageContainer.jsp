<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.navButton {
	width: 250px !important;
	margin: 5px !important;
}
</style>
<link rel="stylesheet" type="text/css" href="css/content.css" />
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
	<script type="text/javascript" src="js/bootstrap.min.js.map"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, name='viewport'" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--  Fonts and icons  -->
      <!-- Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
<!-- Material Kit CSS -->
<link href="resources/assets/css/material-kit.css" rel="stylesheet" />
<!--   Core JS Files   -->
<script src="resources/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="resources/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="resources/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="resources/assets/js/plugins/moment.min.js"></script>
<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="resources/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="resources/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="resources/assets/js/material-kit.js" type="text/javascript"></script>

</head>
<script type="text/javascript">
$(document).ready(function(){
	if("${myPageState }" == "success"){
		
		if("${myPageView}" == "updatePage"){
			$('#myPageContent').load("updateMbrPage");
		}
		else if("${myPageView}" == "secessionPage"){
			$('#myPageContent').load("secessionPage");
		}
		else if("${myPageView}" == "pointPage"){
			$('#myPageContent').load("pointView");
		}
		else if("${myPageView}" == "basketPage"){
			$('#myPageContent').load("basketView");
		} 
		else {
			$("#myPageContent").load("myPageView");
		}
		
		$("#myPageView").click(function(){
			$("#myPageContent").load("myPageView");
		});
		$("#updateMember").click(function(){
			$('#myPageContent').load("updateMbrPage");
		});
		$("#secession").click(function(){
			$('#myPageContent').load("secessionPage");
		});
		$("#pointView").click(function(){
			$('#myPageContent').load("pointView");
		});
	} else {
		$("#myPageContent").load("myPageCheck");
	};

});
</script>
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
          <h1>마이페이지</h1>
        </div>
      </div>
    </div>
  </div> 
</div>
<div class = "main main-raised">
	<div class="container-fluid" style ="padding-top: 60px; padding-bottom: 60px">
		<div class="row">
			<div class="col-lg-4">
				<ul class="nav nav-pills nav-pills-rose flex-column">
					<li class="nav-item"><a class="nav-link active" href="#tab1" data-toggle="tab" 
						id="myPageView">회원 정보 보기</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab"
						id="updateMember">회원 정보 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab"
						id="secession">회원 탈퇴</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab"
						id="pointView">포인트 적립내역</a></li>
				</ul>
			</div>
			<div class="col-lg-8">
				<div class = "main main-raised">
				<div class = "container" style ="padding-top: 60px; padding-bottom: 60px">
					<div class ="tab-content"  id ="myPageContent"></div>
				</div>
				</div>
			</div>			
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>

</div>
</body>
</html>