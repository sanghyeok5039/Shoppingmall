<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script >
$(document).ready(function(){	
	alert("장바구니가 비었습니다. ") 
	document.getElementById('go').submit();
}); 
</script>
</head>
<body>
<form method="post" action="home" id="go">
</form>
</body>
</html>