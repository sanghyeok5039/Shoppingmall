<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <title>Hello, world!</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, name=viewport" />
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
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
<style type="text/css">
.header_ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
#header .header_bot .gnb .ctgr {
    position: relative;
    padding: 0 23.6px;
    float: left;
    height: 58px;
    line-height: 58px;
    cursor: pointer;
}

.ctgr_d {
    overflow: hidden;
    height: 125px;
    display: none;
    margin-top: 0px;
    margin-bottom: 0px;
    padding-top: 5px;
    padding-bottom: 15px;
}


</style>
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
          <h1>Shopping Project</h1>
          <h3 class="title text-center">title</h3>
        </div>
      </div>
    </div>
  </div> 
</div>

<%@ include file="/WEB-INF/views/mainContainer.jsp" %>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>

</div>
</body>
</html>