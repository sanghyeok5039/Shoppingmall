<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.js"></script>
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
<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br><br>
<div class="container">
    <div class="row">
    	<div class="col-sm-12">
			<font style="font-size:3em;weight:bold">게시판 관리</font><br><hr>&emsp;
			<a href="noticeList" style="color:gray;text-decoration:none">공지사항</a>&emsp;&emsp;
			<a href="inquryList" style="color:gray;text-decoration:none">고객문의</a>&emsp;&emsp;
			<a href="mngViewFAQList?category=1" style="font-size:1.5em;weight:bold;color:black;text-decoration:none">FAQ 관리</a>
			<br><hr>
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
			<table class="table table-bordered table-hover">
				<thead>
					<tr style="background-color:#BDBDBD">
						<th style="text-align: center" width="30%">분류</th>
						<th style="text-align: center" width="70%">제목</th>
					</tr>
				</thead>
				<tbody style="background-color:white">
					<c:if test="${LIST.size()==0}">
   						 <tr>
   						 	<td colspan="2" style="text-align:center;font-weight:bold">등록된 글이 없습니다.</td>
   						 </tr>
					</c:if>
					<c:forEach var="list" items="${LIST}">
						<tr>
							<td style="text-align: center" width="30%">${category}</td>
							<td style="text-align: left" width="70%">
								<a href="viewFAQ?num=${list.faq_num}&category=${faq_category}"><b>Q.${list.faq_question}</b></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-12" style="text-align:right">
					<button type="button" class="btn btn-outline-secondary" 
						onClick="location.href='writeFAQForm?category=${faq_category}'">등록</button>
			</div>
		</div>
    </div>
</div>
<br>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>