<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>
<style type="text/css">
#alltable {
	padding: 10px;
}
#border{
	border: 1px solid;
	height: 150px;
	width: 700px;
}
</style>
</head>
<body onload="window.resizeTo(400,100)">
<h1>리뷰작성자 : 00</h1>
<hr>
<div id="alltable">
<div id="border">&nbsp;리뷰내용</div>
</div>
<br>
<h3>별점 : ★</h3>
<hr>
<h3>댓글</h3>
<div id="alltable">
<div id="border">&nbsp;ㄴ댓글내용</div>
</div>
<div id="alltable" align="right"><button class="btn">이전<div class="ripple-container"></div></button>
								 <button class="btn">다음<div class="ripple-container"></div></button>
</div>
<div id="alltable" align="right"><button class="btn">뒤로가기<div class="ripple-container"></div></button></div>
</body>
</html>