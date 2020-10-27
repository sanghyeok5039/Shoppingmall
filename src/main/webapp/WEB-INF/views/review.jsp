<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div id="reviewList">
<table border="1" class = "table" style ="width: 100%">
	<thead>
		<tr>
			<th>작성자</th>
			<th>별점</th>
			<th>작성일</th>
			<th>내용</th>
		</tr>	
	</thead>
<c:forEach var="dto" items="${show}">
	<tr>
		<td>
			 ${dto.mbr_id}
		</td>
		<td>
			${dto.review_grade}
		</td>
		<td>
			${dto.review_regdate}
		</td>
		<td width="600px">
			${dto.review_content}
		</td>

	</tr>
</c:forEach>
</table>
<c:if test="${startPage > 12}">
		<a id="before" href="#">[이전]</a>
		<script>
			$(document).ready(function(){
				$("#${before}").click(function(){
					$("#review_container").load("review_list",{"startNum":"${startPage-12}","product_id":"${id}"});
				});
			}); 
		</script>
	</c:if>

	<c:forEach var="i" items="${numlist}">
		<a id="${i}" href="#">${i}</a>
		<script>
			$(document).ready(function(){
				$("#${i}").click(function(){
					$("#review_container").load("review_list",{"startNum":"${i}","product_id":"${id}"});
				});
			}); 
		</script>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a id="after" href="#">[다음]</a>
		<script>
			$(document).ready(function(){
				$("#${after}").click(function(){
					$("#review_container").load("review_list",{"startNum":"${startPage+12}","product_id":"${id}"});
				});
			}); 
		</script>
	</c:if>
</div>
</body>
</html>