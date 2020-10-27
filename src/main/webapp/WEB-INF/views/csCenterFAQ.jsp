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
<script>
$(function(){
	$("#id").click(function(){
		
	})
})
</script>
<style>
.textarea_size {
    resize:none;
    line-height:150%;
    width:100%;
    overflow-y:hidden;
    height:30px;
    border:1px solid #ccc;
}
</style>
<script>
function cmaTextareaSize(obj, bsize) { // 객체명, 기본사이즈
    var sTextarea = document.getElementById(obj);
    var csize = (sTextarea.scrollHeight >= bsize) ? sTextarea.scrollHeight+"px" : bsize+"px";
    sTextarea.style.height = bsize+"px"; 
    sTextarea.style.height = csize;
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/top.jsp" flush="false"/>
<div class="container">
    <div class="row">
    	<div class="col-sm-12">
    	<br><br>
    	</div>
        <div class="col-sm-2">
        	<%@ include file="/WEB-INF/views/include/csCenterLeftMenu.jsp" %>
        </div>
        <div class="col-sm-10">
			<b><font size="5em" color="black">FAQ</font>
			   <font size="3em" color="black">&nbsp;자주묻는질문</font>
			</b>
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
							<td style="text-align: center">${category}</td>
							<td style="text-align: left"><b>Q.${list.faq_question}</b></td>
						</tr>
						<tr style="background-color:#EAEAEA">
							<td style="text-align: center"></td>
							<td style="text-align: left">						
								<textarea rows="4"cols="95"
									style="background-color:#EAEAEA;ime-mode: active;border: none;" readOnly>A. ${list.faq_answer}</textarea>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>