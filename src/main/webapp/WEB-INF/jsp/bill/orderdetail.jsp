<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역서</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<div id="sushisushi" class="header-font" onclick="location.href='/main/main-view'">sushisushi</div>
		</header>
		<c:if test="${not empty userId}">
		<div class="d-flex justify-content-end">
			<div class="mr-3">${userLoginId }님</div>
			<a href="/user/logout">로그아웃</a>
		</div>
		</c:if>
		<section>
			<div class="container-sb">
				<!-- 카드  -->
				<c:forEach var="bill" items="${billList }">
				<div class="card" style="border:1px solid #ccc; margin:10px;">
					<div class="d-flex justify-content-end" style="border:1px solid #ccc; padding:10px; margin:10px">
						<a href="#" type="button" class="btn btn-secondary btn-sm">주문상세</a>					
					</div>
					<div style="font-size:20px; padding:10px; margin:10px;">
						<table class="text-left" >
							<tr>
								<th class="text-center" rowspan="3"><img src="/static/img/main1.jpg" style="width:300px"></th>
								<td class="pl-3">${bill.number }</td>
							</tr>
							<tr>
								<td class="pl-3">${bill.address }</td>
							</tr>
							<tr>
								<td class="pl-3"><fmt:formatDate value="${bill.createdAt }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
							</tr>
						</table>
					</div>
				</div>
				</c:forEach>
				<!-- 카드 -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
</body>
</html>