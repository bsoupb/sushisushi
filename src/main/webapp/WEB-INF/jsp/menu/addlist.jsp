<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가</title>
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
				<div class="pt-5">
					<div class="d-flex">
						<div>
							<img src="/static/img/main1.jpg" style="width:450px; height:270px">
						</div>
						<div>
							<div class="d-flex justify-content-center">
								<div class="pt-2 pl-3 col-12">
									<input type="text" class="form-control" placeholder="초밥 이름">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<input type="text" class="form-control" placeholder="초밥 종류">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<input type="text" class="form-control" placeholder="초밥 가격">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<input type="text" class="form-control" placeholder="초밥 접시 색">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<input type="file" class="form-control">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-between pt-4">
					<button type="button" class="btn btn-primary">추가</button>
				</div>
			</div>
		</section>
		
		<hr>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>