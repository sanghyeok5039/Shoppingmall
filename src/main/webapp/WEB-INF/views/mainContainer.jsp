<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/content.css" />
<title>Insert title here</title>
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
<script type = "text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type = "text/javascript" src="resources/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script
	src="js/popper.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){

	$("#mainListContent").load("mainpage");

}); 
</script>


</head>
<body>

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
  <br>
  <br>
  <div class="container"  id = "main_container">
    <div class="section text-center">
    	<div class="container" id = "mainListContent">
				<%@ include file="/WEB-INF/views/mainpage.jsp" %>
	 </div>      
   </div>
  </div>
</div>

	
</body>
</html>