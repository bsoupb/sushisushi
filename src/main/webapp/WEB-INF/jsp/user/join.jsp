<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="main">
			<div class="container-sb pt-5">
				<h2 class="text-center pb-2">회원가입</h2>
				<div class="d-flex justify-content-center">
					<div class="input-group pt-2 col-7">
						<input type="text" class="form-control" placeholder="아이디">
						<div class="input-group-append">
					 		<button class="btn btn-primary" type="button">중복확인</button>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="password" class="form-control" placeholder="비밀번호">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="password" class="form-control" placeholder="비밀번호 확인">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="text" class="form-control" placeholder="이름">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="input-group pt-2 col-7">
						<input type="text" id="address" class="form-control" placeholder="주소" readonly>
						<div class="input-group-append">
					 		<button class="btn btn-primary" type="button" onclick="findAddr()">주소 검색</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
	

	</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>

	// findAddr() 함수 정의
	function findAddr(){
		new daum.Postcode({
		oncomplete:function(data){
		// 사용자 주소를 받아올 변수를 정의
		var addr = '';

		// 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져옴
		if(data.userSelectedType === 'R'){ // 사용자가 도로명 주소 선택
			addr = data.roadAddress;
		} else { // 사용자가 지번 주소 선택
			addr = data.jibunAddress;
		}
		
		// 부모창의 주소칸에 받아온 주소 넣음
		$("#address").val(addr);
		}	
	}).open();
	}
	
</script>

</body>
</html>