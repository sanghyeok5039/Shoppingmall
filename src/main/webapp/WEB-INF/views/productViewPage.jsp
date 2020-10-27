<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색명, 분류</title>
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
<style type="text/css">
#menu{
	margin : 10px 0px 10px 0px;
	background-color: #dee2e6;
}
.ul li{
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #F9F9F9;
	min-width: 160px;
	padding: 8px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.dropdown:hover .dropdown-content { display: block; }
.dropdown-content a {
	color: black;
	padding: 8px;
	text-decoration: none;
	display: block;
}
.dropdown-content a:hover { background-color: #CD853F; }
.dropdown:hover .dropdown-content { display: block; }
.dropdown:hover .dropdown-button { background-color: #CD853F; }
</style>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>

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
          <h1>제품 검색</h1>
          <h3 class="title text-center"></h3>
        </div>
      </div>
    </div>
  </div> 
</div>

<div class="main main-raised">
	<div class = "container-fluid" style="width: 100%; height: 60px; border-bottom: 1px solid black">		
		<div class ="row">
			<div class="col-8">
				<ul class="nav nav-pills nav-pills-primary">
					<c:forEach var ="menu" items ="${MENU}">
  					<li class="nav-item">
						<div class = "dropdown">
							<a class = "dropdown-button nav-link" href='showMainCategory?m_ctgr_id=${menu.m_Ctgr_Id}&startNum=1'>${menu.m_Ctgr_Name}</a>
							<div class="dropdown-content">
								<c:forEach var ="ctgr" items ="${menu.ctgryList}">
									<a href='showCategory?ctgr_id=${ctgr.ctgr_Id}&startNum=1'>${ctgr.ctgr_Name }</a>
								</c:forEach>
							</div>
						</div>
  					</li>
  					</c:forEach>
  				</ul>
			</div>
			<div class="col-4">
		  		<ul class="nav justify-content-end">
  					<li class="nav-item">
  						<div align="right">
							<form class="form-inline ml-auto" method="post" action="showName">
                				<div class="form-group no-border">
                  					<input type="text" class="form-control" placeholder="Search" name="product_name">
                  					<input type="hidden" name="startNum" value="1">
                				</div>
                				<button type="submit" class="btn btn-white btn-just-icon btn-round">
                   					<i class="material-icons">search</i>
                				</button>
            				</form>
            			</div>
  					</li>
				</ul>				
			</div>
		</div>		 	
	</div>
  <div class="container"  id = "main_container">
    <div class="section text-center">
    	<div class="container" id="content">		
			<%@ include file="/WEB-INF/views/productViewList.jsp" %>
		</div>
	  </div>      
  </div>
</div>



<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>

</div>
</body>
</html>