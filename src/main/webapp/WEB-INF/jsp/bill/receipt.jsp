<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영수증</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<div id="sushisushi" class="header-font" onclick="location.href='/main/main-view'">sushisushi</div>
		</header>
		<section class="main">
			<div class="container-sb">
				<div class="bill">
					<table class="table text-center">
						<tr>
							<thead>
								<th>초밥</th>
								<th>갯수</th>
								<th>가격</th>
							</thead>
						</tr>
						<tbody>
						<c:forEach var="shoppingbasket" items="${shoppingbasketDetailMap.ShoppingbasketDetail }" >
						<!-- 메뉴 -->
							<tr>
								<td>${shoppingbasket.name }</td>
								<td>${shoppingbasket.count }</td>
								<td><fmt:formatNumber value="${shoppingbasket.price * shoppingbasket.count}" pattern="#,###"/>원</td>
							</tr>
						<!-- /메뉴 -->
						</c:forEach>
						</tbody>
						<c:set var="totalCount" value="${shoppingbasketDetailMap['totalCount'] }" />
						<c:set var="totalPrice" value="${shoppingbasketDetailMap['totalPrice'] }" />
						<tr>
							<th>총</th>
							<th>${totalCount }</th>
							<th><fmt:formatNumber value="${totalPrice }" pattern="#,###"/>원</th>
						</tr>
					</table>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>


</body>
</html>