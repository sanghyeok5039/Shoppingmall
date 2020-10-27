<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>제품 관리-등록</title>
<%-- <script type="text/javascript" src="<c:url value="js/jquery-3.4.1.min.js"/>"></script> --%>
<script src="js/jquery-3.4.1.min.js"></script>

<script>
$(document).ready(function(){
	
	$('#sizeList').change(function(){
		/* var size = document.getElementById("sizeList").value;
			alert(size); */
		/* var id = '${dto.prd_id}';
			alert(id); */
			
		$.ajax({
			url: "/myapp/sizeCnt.do",
			type: "POST",
			data: {data : size, id: '${dto.prd_id}' },
			success: function(data){
				
				$('#sizeCnt').text(data);
			},
			error: function(){
				alert("simpleWithObject err");
			}
		});
	});
});

</script>
<style>
html, body{
	height:100%;
	width:100%;
	margin:0;
}
 
  table {
    border-top: 1px solid #444444;
    /* border-collapse: collapse; */
    background: #ededed;
	color: #222;
	margin:auto; 
	text-align: center;
  }
  th{
   	border-bottom: 1px solid #444444;
    padding: 10px;
    background: #ededed;
	color: #222;
	margin:auto; 
  } 
  td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    background: #ededed;
	color: #222;
	margin:auto;  
  }
  
</style>
<script>
$(document).ready(function(){
	$('#img').click(function(){
		
		
	});
	
});



function change() {
	
	var sItem = document.getElementById("mainCtgrSelected");
	
	
	//location.href="itemChange";
}
  <!-- 메인카테고리 콤보박스 값 클릭했을 때 가져옴.--> 
function proc(){
	var item = document.getElementById("mainCtgrSelected").value;
	document.getElementById("result2").innerText = item;
	
	
}
<!-- 가져온 값을 바탕으로 다건조회를 돌려서 서브카테고리 콤보값을 SET 해야 함 -->
 
function slctSize(){
	var item = document.getElementById("sizeList").value;
}
function cnt(){
	var size = document.getElementById("sizeList").value;
	document.getElementById("result2").innerText = size;
	
	$.ajax({
		url: "sizeCnt",
		type: "GET",
		data: size,
		success: function(data){
			alert("뭐야");
			$('#sizeCnt').text(data);
		},
		error: function(){
			alert("simpleWithObject err");
		}
	});
}

</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/mngTop.jsp" %>
<br> <br> <br>

<div align="center">
<h2><b>상세보기 / 수정</b></h2>
<br><br>
<form action="prdUpdate">
 
<table >
	<tr height="400" >
	
		<td  >
			<table>
				<tr></tr><tr></tr><tr></tr><tr></tr> 
				<tr height="40" >
					
					<td >
					<br><br><br>   
					상품명
					</td>
					<td > 
						<br><br><br>
						<input type="hidden" name="prdId" value="${dto.prd_id }">
						<input type="text" name="prdName" value="${dto.prd_name }" >
					</td>
					
				</tr>
				
				<!-- 분류  -->
				<tr height="40">
					<td>분류</td><td>
						<select id="mainCtgrSelected" name="mainCtgrSelected" onchange="">
							<option>-- 대분류 --</option>
							<c:forEach var="mCtgr" items="${MCTGR}"  >    <!-- 대분류 -->
							<option onclick="proc()" value="${dto.m_ctgr_id }"<c:if test="${dto.m_ctgr_id == mCtgr.m_Ctgr_Id }"> selected="selected" </c:if> >${mCtgr.m_Ctgr_Name }</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;
						<select id="sub" name="sub">
							<option>-- 소분류 --</option>
							<c:forEach var="ctgr" items="${CTGR}">		<!-- 소분류 -->
							<option value="${dto.ctgr_id}" <c:if test="${dto.ctgr_id == ctgr.ctgr_Id }"> selected="selected" </c:if>>${ctgr.ctgr_Name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>요약 설명</td>
					<td>
						<textarea name="memo"  rows="8" cols="" >${dto.prd_cntnt }</textarea>
					</td>
				</tr>
				 
				<tr height="40">
					<td>이미지</td>	
					 	
					<td> 
							<img id="img"width="60" height="60" src="${dto.prd_img }">
							<input id="file" type="file" name="img" value="${dto.prd_img }">
					</td>
				</tr>
				<tr height="50">
					<td>상태</td>	
					<td>
					<input type="radio" name="stt" value="Y"   <c:if test="${dto.prd_stt == 'Y'}"> checked="checked"</c:if>>판매중
					<input type="radio" name="stt" value="N" <c:if test="${dto.prd_stt == 'N'}"> checked="checked"</c:if>>판매중지
					<input type="radio" name="stt" value="O"     <c:if test="${dto.prd_stt == 'O'}"> checked="checked"</c:if>>품절
					</td>
				</tr> 
				<tr height="50">
					<td>판매가</td>	
					<td align="center">
						<input type="text" name="price" value="${dto.prd_price }" >
					</td>
				</tr>
				<tr height="50">
					<td>총재고수량</td>	
					<td align="center">
						<input type="text" name="quantity" value="${dto.prd_cnt}" >
					</td>
				</tr>
				<tr height="50">
					
					<td>
						<select name="sizeList" id="sizeList" style="width:75px;height:30px;" onselect="cnt()">
							<option>사이즈</option>
							<c:forEach var="SL" items="${SIZELIST }">
								<option id="size">${SL.prd_size}</option>
							</c:forEach>
						</select>	
					</td>
					<td align="center">
						<!-- 사이즈 별로 개수  들어가야 하는 자리인데 ajax 구현해놨는데 기능 사용하면 이클립스가 튕김 ;;; -->
						<input type="text" id="sizeCnt" value=""> 
					</td>
				</tr>	
				<tr>
					<td colspan="2" align="center">
						<br>  
						<input type="submit" value="수정" style="width:80px">
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="초기화" style="width:80px">
						&nbsp;&nbsp;&nbsp;
						<input type="button" value="목록으로" style="width:80px" onclick="location.href='prdMngList'">
					</td>
				</tr>
			</table>
		</td>
	</tr>

</table>
</form>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>