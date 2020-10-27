<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.js"></script>
<style type="text/css">
#faq:hover tbody tr:hover td {

    background: white;
    color: black;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
		
	// 수정하기
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/Shoppingmall/updateFAQ");
		formObj.attr("method", "get");
		formObj.submit();				
	})
		
	// 삭제하기
	$(".delete_btn").on("click", function(){

		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			
		formObj.attr("action", "/Shoppingmall/delFAQ?num=${dto.faq_num}&category=${dto.faq_category}");
		formObj.attr("method", "post");
		formObj.submit();
			
		}
	});
});
</script>
<style>
a.detail{
	color: #8C8C8C;
	text-decoration:none;
}
a.detail:hover{
	color: #353535;
	text-decoration:none;
	cursor:pointer;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/top.jsp" flush="false"/>
<div class="container">
    <div class="row">
    	<div class="col-sm-12">
    	<br><br>
    	</div>
        <div class="col-sm-12" style="aligh:center">
			<b><font size="5em" color="black">FAQ</font>
			   <font size="3em" color="black">&nbsp;자주묻는질문</font>
			</b>
			<table>
				<tr>
					<td><a class="detail" href="mngViewFAQList?category=1">▷ 입금/결제</a></td>
					<td>&emsp;<a class="detail" href="mngViewFAQList?category=2">▷ 배송</a></td>
					<td>&emsp;<a class="detail" href="mngViewFAQList?category=3">▷ 주문/조회</a></td>
					<td>&emsp;<a class="detail" href="mngViewFAQList?category=4">▷ 회원/기타</a></td>
					<td>&emsp;<a class="detail" href="mngViewFAQList?category=5">▷ 상품/재입고</a></td>
					<td>&emsp;<a class="detail" href="mngViewFAQList?category=6">▷ 변경/취소</a></td>
				</tr>
			</table>
			<form method="post" name="readForm">
				<input type="hidden" id="faq_num" name="faq_num" value="${dto.faq_num}">
				<table class="table table-bordered table-hover" id="faq">
					<thead>
						<tr style="background-color:#BDBDBD">
							<th style="text-align: center">분류</th>
							<th style="text-align: center">제목</th>
						</tr>
					</thead>
					<tbody style="background-color:white">
							<tr>
								<td style="text-align: center" width="20%"><b>Question</b></td>
								<td style="text-align: left" width="70%">
									<textarea rows="6"cols="95" name="faq_question"
										style="background-color:white;ime-mode: active;border: none;">${dto.faq_question}</textarea>
								</td>
							</tr>
							<tr style="background-color:white">
								<td style="text-align: center"><b>Answer</b></td>
								<td style="text-align: left">						
									<textarea rows="6"cols="95" name="faq_answer"
										style="background-color:white;ime-mode: active;border: none;">${dto.faq_answer}</textarea>						
								</td>						
							</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-12" style="text-align:right">
			<button type="button" class="btn btn-outline-secondary" 
				onClick="location.href='mngViewFAQList?category=${dto.faq_category}'">목록보기</button>
			<button type="button" class="update_btn btn btn-outline-secondary">수정</button>
			<button type="button" class="delete_btn btn btn-outline-secondary">삭제</button>
		</div>
    </div>
</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>