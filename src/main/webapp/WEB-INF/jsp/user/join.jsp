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
						<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
						<div class="input-group-append">
					 		<button class="btn btn-secondary" id="isDuplicateBtn" type="button">중복확인</button>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="d-none text-primary small pt-1 col-7" id="available">
						사용 가능한 아이디 입니다.
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="d-none text-primary small pt-1 col-7" id="dis">
						사용 불가능한 아이디 입니다.
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="password" id="passwordInput" class="form-control" placeholder="비밀번호">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="password" id="passwordConfirmInput" class="form-control" placeholder="비밀번호 확인">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="text" id="nameInput" class="form-control" placeholder="이름">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="input-group pt-2 col-7">
						<input type="text" id="addressInput" class="form-control" placeholder="주소" readonly>
						<div class="input-group-append">
					 		<button class="btn btn-secondary" type="button" onclick="findAddr()">주소 검색</button>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="text" id="emailInput" class="form-control" placeholder="이메일">
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="pt-2 col-7">
						<input type="tel" id="hpInput" class="form-control" placeholder="휴대전화번호">
					</div>
				</div>
				<div class="d-flex justify-content-center align-items-center">
					<div class="pt-4 col-7">
						<button type="button" id="joinBtn" class="form-control btn btn-primary">회원가입</button>
					</div>
				</div>
				<div >
					<div class="d-flex justify-content-center pt-4 col-7" style="margin:0 auto;">
						<label>회원이신가요?</label> &nbsp;&nbsp;&nbsp;
						<a href="/user/login-view">로그인</a>
					</div>
				</div>
			</div>
		</section>
		<hr>
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
		$("#addressInput").val(addr);
		}	
	}).open();
	}
	
	function emailCheck(eVal) {    
	    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	     if(exptext.test(eVal)==false){
		 //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우         
			return false;
		}
		else
		{
			return true;
		}        
	}
	
$(document).ready(function(){
		
		var isDuplicateId = true;
		var isDuplicateCheck = false;
		
		$("#isDuplicateBtn").on("click", function(){
			
			var id = $("#loginIdInput").val();

			if(id == "") {
				alert("아이디를 입력해 주세요");
				$("#loginIdInput").focus();
				return;
			}

			$.ajax({
				type:"get"
				, url:"/user/duplicate-id"
				, data:{"loginId":id}
				, success:function(data){
					isDuplicateCheck = true;
					if(data.isDuplicate) {
						$("#dis").removeClass("d-none");
						$("#available").addClass("d-none");
						isDuplicateId = true;
					} else {
						$("#dis").addClass("d-none");
						$("#available").removeClass("d-none");
						isDuplicateId = false;
					}
				}
				, error:function(){
					alert("중복확인 에러");
				}
			});

		});

		$("#joinBtn").on("click", function(){
			
			var id = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val();
			var address = $("#addressInput").val();
			var email = $("#emailInput").val();
			var hp = $("#hpInput").val();

			if(id == "") {
				alert("아이디를 입력해 주세요");
				$("#loginIdInput").focus();
				return;
			}

			if(!isDuplicateCheck) {
				alert("아이디 중복 체크를 해주세요");
				$("#loginIdInput").focus();
				return;
			}

			if(isDuplicateId) {
				alert("아이디가 중복입니다.");
				$("#loginIdInput").focus;
				return;
			}
			
			if(password == "") {
				alert("비밀번호를 입력해 주세요");
				$("#passwordInput").focus();
				return;
			}

			if(password != passwordConfirm) {
				alert("비밀번호를 확인해 주세요");
				$("#passwordConfirmInput").focus();
				return;
			}

			if(name == "") {
				alert("이름을 입력해 주세요");
				$("#nameInput").focus();
				return;
			}

			if(address == "") {
				alert("주소를 입력해 주세요");
				$("#addressInput").focus();
				return;
			}

			if(email == "") {
				alert("이메일을 입력해 주세요");
				$("#emailInput").focus();
				return;
			}

			if (emailCheck($("#emailInput").val())==false)
			{
				alert("이메일을 확인해 주십시오");
				$("#emailInput").focus();
				return;
			}

			if(hp == "") {
				alert("휴대전화번호를 입력해 주세요");
				$("#hpInput").focus();
				return;
			}

			var regExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		
			if(!regExp.test($("#hpInput").val())){
				alert("휴대폰번호가 올바르지 않습니다.");
				$("#hpInput").focus();
				return false;
			}

			$.ajax({
				type:"post"
				, url:"/user/join"
				, data:{"loginId":id, "password":password, "name":name, "address":address, "email":email, "hp":hp}
				, success:function(data){
					if(data.result == "success"){
						location.href="/user/login-view";
					} else {
						alert("회원가입 실패");
					}
				}
				, error:function(){
					alert("회원가입 에러");
				}
			});

		});

		$("#hpInput").keyup(function(){
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});

	});
	
</script>

</body>
</html>