<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>top</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-widtd,initial-scale=1.0,name='viewport'"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--  Fonts and icons  -->
      <!-- Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

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
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$("ul.menu > li > .sub").hide();
	
	$("ul.menu > li").hover(function(){
		$(this).find(".sub").slidDown(300);
	},function(){
		$("ul.menu > li > .sub").slideUp(300);
	});
</script>
<script type="text/javascript" src="resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body class ="index-page sidebar-collapse">
  <nav class="navbar navbar-color-on-scroll fixed-top navbar-expand-lg" id="sectionsNav" id = "navbar">
  <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="mngMain">
          <i class="material-icons">home</i><b>Manager Home</b>
        </a>
        
        <button class="navbar-toggler toggled" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      
      <div class="collapse navbar-collapse">
          <ul class="navbar-nav ml-auto menu">
          	<li class="nav-item dropdown">
				<a class="nav-link" href="prdMngList">&emsp;<i class="material-icons">category</i>
					<font style="font-size:14px;font-weight:bold">제품관리</font></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="noticeList">&emsp;<i class="material-icons">description</i>
					<font style="font-size:14px;font-weight:bold">게시판 관리</font></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="ordSttMng">&emsp;<i class="material-icons">list</i>
					<font style="font-size:14px;font-weight:bold">주문 상태 관리</font></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="saleList">&emsp;<i class="material-icons">attach_money</i>
				<font style="font-size:14px;font-weight:bold">매출 관리</font></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="mbrMng">&emsp;<i class="material-icons">perm_identity</i>
				<font style="font-size:14px;font-weight:bold">회원 정보 관리</font></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="home">&emsp;<i class="material-icons">computer</i>
				<font style="font-size:14px;font-weight:bold">고객 페이지</font></a>
			</li>
          </ul>
      </div>
  </div>
</nav>
<div class="container" id = "head_top" style="width:100%;height:60px"></div>

</body>
</html>
