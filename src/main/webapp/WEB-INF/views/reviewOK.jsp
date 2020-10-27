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
	alert("리뷰작성 감사합니다.");
	history.go(-1);
	
}); 
</script>
<script type="text/javascript">
//	alert("리뷰작성 감사힙니다.");
//	history.go(-1);
</script>
</head>
<body>
<form method="post" action="showMainCategory" id="go">
		<input type="hidden" name="m_ctgr_id" value="1">
		<input type="hidden" name="startNum" value="1">
</form>
</body>
</html>