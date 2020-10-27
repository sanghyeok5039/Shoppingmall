<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
function check(){

	var category = document.getElementById('category');
	if(category.value=="noselect"){
		alert('카테고리를 선택하세요.');
		return false;
	}
	
	var title = document.getElementById('qanda_title');
	if(title.value==""||title.value==null){
		alert('제목을 입력하세요.');
		return false;
	}
	
	var content = document.getElementById('qanda_content');
	if(content.value==""||content.value==null){
		alert('내용을 입력하세요.');
		return false;
	}
}
</script>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/top.jsp" flush="false"/>
<br><br>
	<div class="container">
		<div class="row" style="text-align:center">
			<div class="col-sm-1">&nbsp;</div>
			<div class="col-sm-9" style="align:right">
				<form name="writeForm" method="post" action="writeInqury" enctype="multipart/form-data" onsubmit="return check()">
					<table class="table table-bordered">
						<tr>
							<td align="center" style="background-color:#BDBDBD">카테고리</td>
							<td style="text-align: left">
								<select id="category" name="category">
									<option value="noselect">카테고리를 선택해주세요.</option>
									<option value="purchase">입금 및 결제</option>
									<option value="delivery">배송</option>
									<option value="cancel">환불 및 취소</option>
									<option value="exchange">상품교환</option>
									<option value="nonmember">비회원 문의</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#BDBDBD">제목</td>
							<td style="text-align: left"><input type="text" id="qanda_title" name="qanda_title"
								style="ime-mode: active;" size="65"></td>
						</tr>						
						<tr>
							<td align="center" style="background-color:#BDBDBD">내용</td>
							<td style="text-align: left">
								<textarea id="qanda_content" name="qanda_content" rows="10" cols="50" style="ime-mode: active;"></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#BDBDBD">첨부파일</td>
						<td style="text-align:left">
							<input type="file" name="file">
						</td>
						</tr>
					</table>
					<br> 
					<div style="text-align:right">
						<input type="submit"class="btn btn-outline-secondary" value="글쓰기"> 
						<input type="reset" class="btn btn-outline-secondary" value="다시작성">
					</div>
				</form>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>