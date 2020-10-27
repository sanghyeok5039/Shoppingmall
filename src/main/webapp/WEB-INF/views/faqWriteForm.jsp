<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function check(){
	
	var category = document.getElementById('category');
	if(category.value=="noselect"){
		alert('카테고리를 선택하세요.');
		return false;
	}
	
	var question = document.getElementById('faq_question');
	if(question.value==""||question.value==null){
		alert('질문을 입력하세요.');
		return false;
	}
	
	var answer = document.getElementById('faq_answer');
	if(answer.value==""||answer.value==null){
		alert('답변을 입력하세요.');
		return false;
	}
}
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
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-9">
			<h4>FAQ 등록</h4>
			<hr>
			
			<form name="writeForm" method="post" action="writeFAQ" onsubmit="return check()">
				<table class="table table-bordered">
					<tr>
						<td align="center" style="background-color:#BDBDBD">Category</td>
						<td style="text-align: left">
							<select id="category" name="faq_category">
								<option value="1">입금/결제</option>
								<option value="2">배송</option>
								<option value="3">주문/조회</option>
								<option value="4">회원/기타</option>
								<option value="5">상품/재입고</option>
								<option value="6">변경/취소</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right" style="background-color:#BDBDBD">Question</td>
						<td style="text-align:left">
							 <textarea name="faq_question" id="faq_question" rows="5" cols="95" placeholder="500자 내외로 입력하세요."
 						     	style="ime-mode:active;resize:none"></textarea>
						</td>
					</tr>
					<tr>
						<td align="right" style="background-color:#BDBDBD">Answer</td>
						<td style="text-align:left">
							<textarea name="faq_answer" id="faq_answer" rows="5" cols="95" placeholder="500자 내외로 입력하세요."
 						     	style="ime-mode:active;resize:none"></textarea>
						</td>
					</tr>
				</table>
				<div class="col-sm-12" style="text-align:right">
					<button type="button" onClick="location.href='mngViewFAQList?category=${category}'">목록보기</button>
					<input type="submit" value="글등록">
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>