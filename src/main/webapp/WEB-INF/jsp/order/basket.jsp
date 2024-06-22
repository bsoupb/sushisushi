<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<div id="sushisushi" class="header-font" onclick="location.href='/main/main-view'">sushisushi</div>
		</header>
		
		<nav class="nav-content d-flex justify-content-center align-items-center">
			<ul class="nav nav-fill w-100">
				<li class="nav-item nav-color"><a href="/order/basket-view?type=초밥" class="nav-link nav-font-color">초밥</a></li>
				<li class="nav-item nav-color"><a href="/order/basket-view?type=군함" class="nav-link nav-font-color">군함</a></li>
				<li class="nav-item nav-color"><a href="/order/basket-view?type=사이드" class="nav-link nav-font-color">사이드</a></li>
				<li class="nav-item nav-color"><a href="/order/basket-view?type=음료" class="nav-link nav-font-color">음료</a></li>
			</ul>
		</nav>
		
		<section>
		
		<div class="container-sb">
		<!-- 표 -->
		<c:forEach var="menu" items="${menuList}">
		<div style="border:1px solid #ccc; padding:10px; margin:10px;">
			<table class="text-left">
				<tr>
					<td class="text-center" rowspan="4"><img src="${menu.imagePath}" width=300></td>
					<td class="text-center pl-3">${menu.name}</td>
				</tr>
				<tr>
					<td class="pl-3">${menu.type}</td>
				</tr>
				<tr>
					<td class="pl-3">${menu.price}원</td>
				</tr>
				<tr>
					<td class="pl-3">${menu.dishColor}</td>
				</tr>
			</table>
			<c:if test="${userLoginId ne 'admin'}">
			<div class="d-flex justify-content-end">
				<i class="bi bi-cart-check basketBtn" style="font-size:25px" data-basket-id="${menu.id }"></i>
			</div>
			</c:if>
		</div>
		</c:forEach>
		<!-- /표 -->
		</div>
	
		</section>
		
		<hr>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" /> 
	</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>

	$(document).ready(function(){
		
		$(".basketBtn").on("click", function(){
			
			//alert("basketclick");
			
			var menuId = $(this).data("basket-id");
			
			$.ajax({
				
				type:"post"
				, url:"/order/basket"
				, data:{"menuId":menuId}
				, success:function(data){
					if(data.result == "success"){
						location.href = "/order/order-list-view"
					} else {
						alert("장바구니 추가 실패");
					}
				}
				, error:function(){
					alert("장바구니 추가 에러")
				}
				
			});
			
		});		
		
	});
</script>

</body>
</html>