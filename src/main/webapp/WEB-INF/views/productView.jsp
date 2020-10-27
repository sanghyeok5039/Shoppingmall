<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품명</title>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" href="css/loader2.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/material-kit.js"></script>
<style type="text/css">
#alltable{
	padding: 10px;
}
#table{
	width: 400px;
	height: 450px;
	border: 1;
	padding: 10px;
	border-style: solid; 
}
#button{
	text-align: right;
}
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
<script type = "javascript">
	function showBig(val) {
	 var obj = document.getElementById("big");
	  obj.src = "img/" + val;
	}
</script>
<script>
$(document).ready(function(){
	$("#num").change(function() {
		var num = document.getElementById("num").value;
	    document.getElementById("set").value = num;
	});
	$("#sel").change(function() {
		var count = $("#sel option:selected").val();
		var split = count.split('/');
	    document.getElementById("product_detail_id1").value = split[2];
	    document.getElementById("product_detail_id2").value = split[2];
	    document.getElementById("price").value = split[1];
	    document.getElementById("stock").value = split[0];
	    document.getElementById("point").value = split[1]/10;
	});
	$("#review_container").load("review_list",{"startNum":"1","product_id":"${show.product_id}"});
	$("#orderthis").click(function(){
		if($("#sel option:selected").text() == "-옵션-"){
    		alert("옵션을 선택하세요.");
    		$("#sel").focus();
    		return false;
    	}
		
	});
	$("#basketthis").click(function(){
		if($("#sel option:selected").text() == "-옵션-"){
    		alert("옵션을 선택하세요.");
    		$("#sel").focus();
    		return false;
    	}
	});
}); 
</script>
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

<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand text-center"><h1>제품 상세보기</h1></div>
				</div>
			</div>
		</div>
	</div>

	<div class="main main-raised">
		<div class="container-fluid"
			style="width: 100%; height: 60px; border-bottom: 1px solid black">
			<div class="row">
				<div class="col-8">
					<ul class="nav nav-pills nav-pills-primary">
						<c:forEach var="menu" items="${MENU}">
							<li class="nav-item">
								<div class="dropdown">
									<a class="dropdown-button nav-link"
										href='showMainCategory?m_ctgr_id=${menu.m_Ctgr_Id}&startNum=1'>${menu.m_Ctgr_Name}</a>
									<div class="dropdown-content">
										<c:forEach var="ctgr" items="${menu.ctgryList}">
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
								<form class="form-inline ml-auto" method="post"
									action="showName">
									<div class="form-group no-border">
										<input type="text" class="form-control" placeholder="Search"
											name="product_name"> <input type="hidden"
											name="startNum" value="1">
									</div>
									<button type="submit"
										class="btn btn-white btn-just-icon btn-round">
										<i class="material-icons">search</i>
									</button>
								</form>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container-fluid" id="main_container" style = "padding-bottom: 30px">
			
				<div class="container" id="content">
		<table class = "table">
		<tr>
		<td>
			<div class = "container">
				<img src="img/${show.product_img}" id="big">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		<td>
		<form method="post" action="directopen">
		<div class = "form-group has-default bmd-form-group">
			<table id="table" class = "table" style="width:100%">
				<tr>
					<td colspan="2">
						<h2 align="center">${show.product_name}</h2>
					</td>
				</tr>
				<tr>
					<td>
						판매가격 
					</td>
					<td>
						<input type="text" id="price" disabled="disabled" class = "form-control">
					</td>
				</tr>
				<tr>
					<td>
						택배비
					</td>
					<td>
						2500원(50,000원 이상 구매시 무료)
					</td>
				</tr>
				<tr>
					<td>
						적립포인트
					</td>
					<td>
						<input type="text" id="point" disabled="disabled" class = "form-control">
					</td>
				</tr>
				<tr>
					<td>
						별점  
					</td>
					<td>
						${show.product_totalgrade}
					</td>
				</tr>
				<tr>
					<td>
						제품옵션
					</td>
					<td>
						<select id="sel" class = "custom-select">
							<option value="option" selected="selected">-옵션-</option>
								<c:forEach var="i" items="${showdetail}">
								 	<option value="${i.product_count}">${i.product_size}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>					
						재고수량
					</td>
					<td>
						<input type="text" value="0" id="stock" disabled="disabled" class = "form-control">
					</td>
				</tr>
				<tr>
					<td>
						수량
					</td>
					<td>
						<input type="text" value="1" name="num" id="num" onclick="num()" class = "form-control">							
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" value="${show.product_id}" name="product_id">
						<input type="hidden" value="" name="product_detail_id" id="product_detail_id1">
						<input type="hidden" value="123" name="mbr_id">								
						<input type="submit" value="결제" id="orderthis" class= "btn btn-primary btn-block">&nbsp; 
					</td>
				</tr>
			</table>
		</div>
		</form>
				<tr>
					<td>
					</td>
					<td>
						<form method="post" action="basketinsert" name="basket">
							<input type="hidden" value="${show.product_id}" name="product_id">
								<input type="hidden" value="" name="product_detail_id" id="product_detail_id2">
								<input type="hidden" value="123" name="mbr_id">
								<input type="hidden" value="1" name="num" id="set">
								<input type="submit" value="장바구니" id="basketthis" class= "btn btn-primary btn-block">&nbsp; 
						</form>
					</td>
				</tr>
	</table>


<br><br>

<p align="center"> 
	<img src="img/${show.product_content}">
</p>
<hr>
<h1>리뷰 작성</h1>
<hr>
<div id="alltable">
<h3 >제목</h3>
<form method="post" action="review_insert"> 
<input type="text" class ="form-control" style="width:100%" name="review_title" id="reviewtext">
<br>
<h3>내용</h3>
<textarea rows="10" cols="150" class ="form-control" name="review_content" id="reviewtext"></textarea>
<br>
<h3>별점</h3>
<select name="review_grade" id="reviewtext">
	<option value="1">★</option>
	<option value="2">★★</option>
	<option value="3">★★★</option>
	<option value="4">★★★★</option>
	<option value="5">★★★★★</option>
</select>
<input type="hidden" class ="form-control" name="product_id" value="${show.product_id}">
<input type="hidden" class ="form-control" name="mbr_id" value="${loginUser.mbr_id }">
<br>
<p align="right"><input type="submit"  class="btn btn-primary" value="리뷰작성"></p>
</form>
</div>
<hr>
<h1>제품 리뷰</h1>
<hr>
<div id="review_container"></div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</div>
</body>
</html>