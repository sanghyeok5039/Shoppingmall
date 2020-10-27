<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<script src="js/bootstrap.js"></script>
<script>
$("#inqury").click(function(){
	var id = session.getAttribute("mbr_id");
	if(id==null){
		alert("회원만 사용가능합니다.");
	}
})
</script>
<style>
a{
	color: black;
	text-decoration:none;
	
}
a.main{
	color: black;
	text-decoration:none;
	background-color:#EAEAEA;
}

a.detail{
	color: #8C8C8C;
	text-decoration:none;
}
a.detail:hover{
	color: #353535;
	text-decoration:none;
	cursor:pointer;
}
ul{
	list-style:none;
}
table{
	width:180px;
	background-color:#EAEAEA;
}
td{
	padding-left:15px;
}
#menu{
	height:50px;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td id="menu">
				<a class="main" href="csCenterNotice"><b>NOTICE</b>&emsp;공지사항</a>
			</td>
		</tr>
		<tr>
			<td id="menu">
				<a class="main" href="cstViewFAQList?category=1"><b>FAQ</b>&emsp;자주 묻는 질문</a>
			</td>
		</tr>
		<tr>
			<td>&emsp;<a class="detail" href="cstViewFAQList?category=1">▷ 입금/결제</a></td>
		</tr>
		<tr>
			<td>&emsp;<a class="detail" href="cstViewFAQList?category=2">▷ 배송</a></td>
		</tr>
		<tr>
			<td>&emsp;<a class="detail" href="cstViewFAQList?category=3">▷ 주문/조회</a></td>
		</tr>
		<tr>
			<td>&emsp;<a class="detail" href="cstViewFAQList?category=4">▷ 회원/기타</a></td>
		</tr>
		<tr>
			<td>&emsp;<a class="detail" href="cstViewFAQList?category=5">▷ 상품/재입고</a></td>
		</tr>
		<tr>
			<td>&emsp;<a class="detail" href="cstViewFAQList?category=6">▷ 변경/취소</a></td>
		</tr>

		<tr>
			<td id="menu"><a class="main" href="myInquryList" id="inqury"><b>Q&amp;A</b>&emsp;1:1문의</a></td>
		</tr>
	</table>
</body>
</html>