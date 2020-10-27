<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>
</head>
<body>

		<div class="row">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-361282">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-361282"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-361282"></li>
						<li data-slide-to="2" data-target="#carousel-361282"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="img/mainimg1.jpg" />
							<div class="carousel-caption">
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="img/mainimg2.jpg" />
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="img/mainimg3.jpg" />
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-361282"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-361282"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span> </a>
				</div>
			</div>
		</div>
<!--  -->
<h1>Best choice</h1>
<table class = "table">
	<tr>
	<c:forEach var="dto" items="${list}" varStatus="st">
		<c:if test="${st.index eq '4'}"><tr>
		</c:if>
		<c:if test="${st.index eq '8'}"><tr>
		</c:if>
		<td>
			<table class ="table">
				 <tr>
				 	<td>
				 		<img src="img/${dto.product_img}" style="width: 150px" onclick="document.getElementById('name${dto.product_id}').submit();">
				 	</td>
				 </tr>
				 <tr>
				 	<td>
				 		<form id="name${dto.product_id}" method="post" action="show">
							<input type="hidden" name="id" value="${dto.product_id}">
							<input type="hidden" name="startNum" value="1">
						</form>
						-제품명 : <a href="#" onclick="document.getElementById('name${dto.product_id}').submit();">${dto.product_name}</a>
				 	</td>
				 </tr>
				 <tr>
				 	<td>
				 		-별점 : ${dto.product_totalgrade}
				 	</td>
				 </tr>
			</table>
		</td>
	</c:forEach>
	</tr>
</table>


</body>
</html>