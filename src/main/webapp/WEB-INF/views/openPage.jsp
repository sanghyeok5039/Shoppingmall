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
	alert("결제완료. 메인페이지로 갑니다.") 
	document.getElementById('go').submit();
}); 
</script>
</head>
<body>
<form method="post" action="home" id="go">
		<input type="hidden" name="m_ctgr_id" value="신발">
		<input type="hidden" name="startNum" value="1">
</form>
</body>
</html>