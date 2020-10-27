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
	 if (confirm("이미존재하는 제품입니다. 장바구니로 이동하시겠습니까?") == true){  
		 document.getElementById('go').submit();
	 }else{ 
	     history.go(-1);
	 }
}); 
</script>
</head>
<body>
<form method="post" action="basketshow" id="go">
<input type="hidden" name="mbr_id" value="${mbr_id}">
</form>
</body>
</html>