<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!--  -->
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$('#check_all').click(function(){
		if($("#check_all").prop("checked")){
			$("input[name=checkbox]").prop("checked",true);
		}
		else{
			$("input[name=checkbox]").prop("checked",false);
		}
		//$('#check_pno').prop('checked',this.checked);
	});
});
</script>
<style>
a{
	color: #8C8C8C;
	text-decoration:none;
}

a:hover{
	color: #353535;
	text-decoration:none;
	cursor:pointer;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"><img src="image/home.jpg"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="mngMain.jsp">
					&emsp;&emsp;<b>Home</b><span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					   role="button" data-toggle="dropdown">&emsp;&emsp;<b>제품관리</b>
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">&emsp;&emsp;<b>상품 조회</b></a>
						<a class="dropdown-item" href="#">&emsp;&emsp;<b>상품 등록</b></a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">&emsp;&emsp;<b>제품 입출고 관리</b></a></li>
				<li class="nav-item"><a class="nav-link" href="notice.jsp">&emsp;&emsp;<b>공지사항</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#">&emsp;&emsp;<b>고객 문의</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#">&emsp;&emsp;<b>주문 상태 관리</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#">&emsp;&emsp;<b>매출 및 마감 관리</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#">&emsp;&emsp;<b>회원 정보 관리</b></a></li>
			</ul>
		</div>
	</nav>
	<br><br>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h4>title</h4>
				<hr>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-12" style="text-align:center;">
				<a href="#"><img src="image/top.jpg" alt=""></a>
			</div>
		</div>
	</div>
	<div style="text-align:center; background-color:#F6F6F6">
		<br>
		<a href="#">제품관리</a> 
		&emsp;&emsp;&emsp;<a href="#">제품 입출고 관리</a>
		&emsp;&emsp;&emsp;<a href="#">공지사항</a>      
		&emsp;&emsp;&emsp;<a href="#">고객 문의</a>   
		&emsp;&emsp;&emsp;<a href="#">주문 상태 관리</a>  
		&emsp;&emsp;&emsp;<a href="#">매출 및 마감 관리</a>
		&emsp;&emsp;&emsp;<a href="#">회원 정보 관리</a> 
		<br>
	</div>
	<div style="text-align:center; background-color:#F6F6F6">
		<br>
	</div>
</body>
</html>