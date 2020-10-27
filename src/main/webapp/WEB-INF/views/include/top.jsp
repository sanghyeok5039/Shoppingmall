<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>top</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, name='viewport'" />
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
<script type="text/javascript"
	src="resources/jquery-ui/jquery-ui.min.js"></script>
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
        <a class="navbar-brand" href="home">
          <i class="material-icons">home</i> Home 
        </a>
        
        <button class="navbar-toggler toggled" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
            <span class="navbar-toggler-icon"></span>
        </button>
      	
      </div>
      
      <div class="collapse navbar-collapse">
          <ul class="navbar-nav ml-auto">
           <c:choose>
		   <c:when test="${loginUser.mbr_id == null}">
            <li class="nav-item">
              <a href="loginPage" class="nav-link">
                  <i class="material-icons">check</i> 로그인
              </a>
            </li>
            <li class="nav-item">
              <a href="signUpPage" class="nav-link">
                  <i class="material-icons">perm_identity</i> 회원 가입
              </a>
            </li>
            <li class="nav-item">
              <a href="nonMbrOrderListCheckPage" class="nav-link">
                  <i class="material-icons">credit_card</i> 비회원 주문 조회
              </a>
            </li>
            <li class="nav-item">
              <a href="basketshow" class="nav-link">
                  <i class="material-icons">shopping_cart</i> 장바구니
              </a>
            </li>
            <li class="nav-item">
              <a href="csCenterNotice" class="nav-link">
                  <i class="material-icons">announcement</i> 고객 센터
              </a>
            </li>       
           </c:when>
		   <c:otherwise>
		   <li class="nav-item">
              <a href="logOut" class="nav-link">
                  <i class="material-icons">cancel</i> 로그아웃
              </a>
            </li>
            <li class="nav-item">
              <a href="myPageContainer" class="nav-link">
                  <i class="material-icons">account_box</i> 마이 페이지
              </a>
            </li>
            <li class="nav-item">
              <a href="showOrderlist?mbr_id=${loginUser.mbr_id }&startNum=1" class="nav-link">
                  <i class="material-icons">credit_card</i> 주문 조회
              </a>
            </li>
            <li class="nav-item">
              <a href="basketshow" class="nav-link">
                  <i class="material-icons">shopping_cart</i> 장바구니
              </a>
            </li>
            <c:if test="${loginUser.mbr_level == 5}">
            <li class="nav-item">
              <a href="mngMain" class="nav-link">
                  <i class="material-icons">computer</i> 관리자 페이지
              </a>
            </li>
            </c:if>
            <li class="nav-item">
              <a href="csCenterNotice" class="nav-link">
                  <i class="material-icons">announcement</i> 고객 센터
              </a>
            </li>
		   </c:otherwise>
		   </c:choose>
          </ul>
      </div>
  </div>
</nav>
<div class="container" id = "head_top" style="width:100%;height:60px"></div>

</body>
</html>
