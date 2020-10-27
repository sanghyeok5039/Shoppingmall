<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<link rel="stylesheet" type="text/css" href="css/material-kit.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<script src="js/material-kit.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function () {
	$("#openbank").hide();
	$("#bank1").prop("disabled", true);
	$("#bankcon").prop("disabled", true);
	$("#bankcon").val("cut")
    $("#card").click(function () {
    	$("#openbank").hide();
    	$("#bank1").prop("disabled", true);
    	$("#bankcon").prop("disabled", true);
    	$("#bankcon").val("cut")
        $("#opencard").show();
        $("#card1").prop("disabled", false);
    	$("#cardcon").prop("disabled", false);
    	$("#cardcon").val("");
    });
    $("#bank").click(function () {
    	$("#opencard").hide();
    	$("#card1").prop("disabled", true);
    	$("#cardcon").prop("disabled", true);
    	$("#cardcon").val("cut")
        $("#openbank").show();
        $("#bank1").prop("disabled", false);
    	$("#bankcon").prop("disabled", false);
    	$("#bankcon").val("");
    });
    
    $("#delivery").click(function(){
		if($("input:checkbox[id='delivery']").is(":checked") == true){
			$("#mbr_name").val($("#nameset").val());
			$("#mbr_adres").val($("#addressset").val());
			$("#mbr_tel").val($("#phone1set").val());
			$("#phone2get").val($("#phone2set").val());
			$("#emailget").val($("#emailset").val());
		} else {
			$("#mbr_name").val("");
			$("#mbr_adres").val("");
			$("#mbr_tel").val("");
			$("#phone2get").val("");
			$("#emailget").val("");
		}
    });
    $("#order").click(function(){
    	if($("#nameset").val() == ""){
    		alert("이름을 입력히세요");
    		$("#nameset").focus();
    		return false;
    	}
    	else if($("#addressset").val() == ""){
    		alert("주소을 입력히세요");
    		$("#addressset").focus();
    		return false;
    	}
    	else if($("#phone1set").val() == ""){
    		alert("전화번호을 입력히세요");
    		$("#phone1set").focus();
    		return false;
    	}
    	else if($("#emailset").val() == ""){
    		alert("이메일을 입력히세요");
    		$("#emailset").focus();
    		return false;
    	}
    	else if($("#mbr_name").val() == ""){
    		alert("이름을 입력히세요");
    		$("#mbr_name").focus();
    		return false;
    	}
    	else if($("#mbr_adres").val() == ""){
    		alert("주소을 입력히세요");
    		$("#mbr_adres").focus();
    		return false;
    	}
    	else if($("#mbr_tel").val() == ""){
    		alert("전화번호을 입력히세요");
    		$("#mbr_tel").focus();
    		return false;
    	}
    	else if($("#emailget").val() == ""){
    		alert("이메일을 입력히세요");
    		$("#emailget").focus();
    		return false;
    	}
    	if($("#bankcon").val() == ""){
    		if($("bankcon").val() != "cut"){
	    		alert("계좌번호를 입력하시오");
	    		$("#bankcon").focus();
	    		return false;
    		}
    	}
    	if($("#cardcon").val() == ""){
    		if($("cardcon").val() != "cut"){
	    		alert("카드번호을 입력히세요");
	    		$("#cardcon").focus();
	    		return false;
    		}
    	}
    	if($("#mbr_pw").val() != $("#re_mbr_pw").val()){
        	alert("비밀번호가 일치하지 않습니다.");
        	return false;
    	}
    })
    $("#num").change(function() {
		var num = document.getElementById("num").value;
	    document.getElementsByName("set")[0].value = ${totalprice}-num;
	    document.getElementsByName("set")[1].value = ${totalprice}-num;
	    document.getElementsByName("pointset")[0].value = num;
	    document.getElementsByName("pointin")[0].value = Math.round((${totalprice}-num)/10);
	});
});
</script>
<style type="text/css">
#alltable {
	padding: 10px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="page-header header-filter" data-parallax="true" style="background-image: url('resources/assets/img/bg3.jpg'); width: 100%; height: 450px">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>주문 정보 입력</h1>
        </div>
      </div>
    </div>
  </div> 
</div>

<div class="main main-raised">
  <div class="container"  id = "main_container">
    <div class="section text-center">
    	<div class="container" id="content">

			<h3 align="center">결제 상품 목록</h3>
<form method="post" action="order">
<div id="alltable">
<table class = "table" border="1">
	<tr>
		<td width="500px" align="center">상품정보</td>
		<td width="150px" align="center">판매가</td>
		<td width="75px" align="center">수량</td>
		<td width="150px" align="center">합계</td>
	</tr>
	<c:forEach var="dto" items="${list}">
	<tr>
		<td>
			<table>
				<tr>
					<td><img src="img/sample1.jpg" width="100px" height="100px"></td>
					<td>상품명 : ${dto.pdto.product_name}<br>
						옵션 : ${dto.pddto.product_size}</td>
				</tr>
			</table>
		</td>
		<td align="center">
			${dto.pddto.product_price}원
		</td>
		<td align="center">
			${dto.num}개
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="product_id" value="${dto.pdto.product_id}">
			<input type="hidden" name="product_detail_id" value="${dto.pddto.product_detail_id}">
		</td>
		<td align="center">
			${dto.total}원
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5" align="center">
			배송비 ${delivery}원, 총 합계 ${totalprice}원 입니다.
		</td>
	</tr>
</table>
</div>

<hr>
<h2>주문자 정보</h2>
<div id="alltable" align="right">*필수입력사항</div>

<div id="alltable">
<table class = "table" border="1">
 <tr>
 	<td width="200px">주문하시는분*
 	</td>
 	<td  width="775px"><input type="text" id="nameset" class="form-control" value="${mdto.mbr_name}">
 	</td>
 </tr>
  <tr>
 	<td>주소*
 	</td>
 	<td><input type="text" id="addressset" class="form-control" value="${mdto.mbr_adres}">
 	</td>
 </tr>
  <tr>
 	<td>전화1*
 	</td>
 	<td><input type="text" id="phone1set" class="form-control" value="${mdto.mbr_tel}">
 	</td>
 </tr>
  <tr>
 	<td>전화2
 	</td>
 	<td><input type="text" id="phone2set" class="form-control">
 	</td>
 </tr>
  <tr>
 	<td>이메일*
 	</td>
 	<td><input type="text" id="emailset" class="form-control">
 	</td>
 </tr>
<c:if test="${mdto.mbr_level eq '9'}">
 <tr>
 	<td>주문 비밀번호*<!--  (비회원 한정) -->
 	</td>
 	<td><input type="text" class="form-control" id="mbr_pw" name="mbr_pw">
 	</td>
 </tr>
 <tr>
 	<td>주문 비밀번호 재입력*<!--  (비회원 한정) 비회원일시 삭제x 및 검사해야함  -->
 	</td>
 	<td><input type="text" class="form-control" id="re_mbr_pw">
 	</td>
 </tr>
</c:if>
</table>
</div>

<hr>
<div id="alltable" align="right"><input type="checkbox" id="delivery">주문자와 같음</div>

<div id="alltable">
<table class = "table" border="1">
 <tr>
 	<td width="200px">받으시는분*
 	</td>
 	<td width="775px"><input type="text" id="mbr_name" name="mbr_name" class="form-control">
 	</td>
 </tr>
  <tr>
 	<td>주소*
 	</td>
 	<td><input type="text" id="mbr_adres" name="mbr_adres" class="form-control">
 	</td>
 </tr>
  <tr>
 	<td>전화1*
 	</td>
 	<td><input type="text" id="mbr_tel" name="mbr_tel" class="form-control">
 	</td>
 </tr>
  <tr>
 	<td>전화2
 	</td>
 	<td><input type="text" id="phone2get" class="form-control">
 	</td>
 </tr>
  <tr>
 	<td>이메일*
 	</td>
 	<td><input type="text" id="emailget" name="mbr_email" class="form-control">
 	</td>
 </tr>
</table>
</div>

<hr>

<h2>포인트 사용</h2>
<div class = "row">
	<div class = "col-md-6">	
		<table class = "table">
			<tr>
				<td>
					포인트 내역
				</td>
				<td>
					<p id="point">${mdto.mbr_point}</p>
				</td>
			</tr>
			<tr>
				<td>
					사용포인트
				</td>
				<td>
					<input type="text" class="form-control" id="num"><!-- 포인트 받은거에서 넘어가면 에러 오더들어갈때 인서트전에 확인 해서 튕굼-->
				</td>
			</tr>
		</table>
	</div>
	<div class = "col-md-6">
		<table class = "table">
			<tr>
				<td>
					총금액
				</td>
				<td>
					<p>${totalprice}</p>
				</td>
			</tr>
			<tr>
				<td>
					결제금액
				</td>
				<td>
					<input type="text" id="set"  name="set" value="${totalprice}"readonly>
				</td>
			</tr>
		</table>
	</div>
</div>
<hr>
<h2>결제</h2>
<div id="alltable" class = "row">
	<div class = "col-md-6">
			<table class = "table" >
				<tr>
					<td width="150px">결제수단
					</td>
					<td>						
						<input type="radio" name="check" checked id="card" >카드
						<input type="radio" name="check" id="bank" >무통장입금
					</td>
				</tr>
				<tr>
					<td>결제정보
					</td>
					<td>
						<div id="opencard">
							결제카드 : <select id="card1" name="card" class ="custom-select">
										<option value="대구">대구</option>
										<option value="신한">신한</option>
										<option value="하나">하나</option>
									</select>
							카드번호 : <input type="text" id="cardcon" name="card" class = "form-control">
						</div>
						<div id="openbank">
							입금은행 : <select id="bank1" name="bank" class ="custom-select">
										<option value="대구">대구</option>
										<option value="신한">신한</option>
										<option value="하나">하나</option>
									</select>
							입금자명 : <input type="text" id="bankcon" name="bank" class = "form-control">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class = "col-md-6">
			<table class = "table" >
				<tr>
					<td colspan="2" align="center">최종결제 정보
					</td>
				</tr>
				
				<tr>
					<td> 
						총 합계금액 
					</td>
					<td>
						${totalprice} <input type="hidden" value="${totalprice}" name="tp">
					</td>
				</tr>
				<tr>
					<td>
						포인트 적립
					</td>
					<td>
						  <input type="text" name="pointin" value="${point}" readonly>
					</td>
				<tr>
					<td>
						할인 내역
					</td>
					<td>
						<input type="text" name="pointset" value="0" readonly>
					</td>
				</tr>
				<tr>
					<td>
						총 결제 금액
					</td>
					<td>
						<input type="text" name="set" value="${totalprice}"readonly>
					</td>
				</tr>
			</table>
	</div>
</div>
<div id="alltable" align="right">
<input type="hidden" value="${loginUser.mbr_id}" name="mbr_id">
<input type="submit" value="결제하기" id="order" class ="btn btn-primary btn-block"> 
</div>
</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footerContainer.jsp" %>
</body>
</html>