<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<section class="main">
	<div class="container-sb pt-5">
		<h2 class="text-center pb-2">로그인</h2>
		
		<div class="d-flex justify-content-center">
			<div class="pt-2 col-7">
				<input type="text" class="form-control" id="loginIdInput" placeholder="아이디">
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div class="pt-2 col-7">
				<input type="password" id="passwordInput" class="form-control" placeholder="비밀번호">
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div class="pt-4 col-7">
				<button type="button" id="loginBtn" class="btn btn-primary form-control">로그인</button>
			</div>
		</div>

		<div class="d-flex justify-content-center pt-4 col-7" style="margin:0 auto;">
			<label>회원이 아니신가요?</label> &nbsp;&nbsp;&nbsp;
			<a href="/user/join-view">회원가입</a>
		</div>
	</div>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>
	
	$(document).ready(function(){
		
		$("#loginBtn").on("click", function(){
			
			var id = $("#loginIdInput").val();
			var password = $("#passwordInput").val();

			if(id == "") {
				alert("아이디를 입력해 주세요");
				$("#loginIdInput").focus();
				return;
			}

			if(password == "") {
				alert("비밀번호를 입력해 주세요");
				$("#passwordInput").focus();
				return;
			}

			$.ajax({
				type:"post"
				, url:"/user/login"
				, data:{"loginId":id, "password":password}
				, success:function(data){
					if(data.result == "success") {
						location.href="/main/main-view";
					} else {
						alert("로그인 실패");
					}
				}
				, error:function(){
					alert("로그인 에러");
				}
			});

		});

	});

</script>

</body>
</html>