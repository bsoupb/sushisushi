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
		<c:if test="${not empty userId}">
		<div class="d-flex justify-content-end">
			<div class="mr-3">${userLoginId }님</div>
			<a href="/user/logout">로그아웃</a>
		</div>
		</c:if>
		<section>
			<div class="container-sb">
				<div class="pt-5">
					<div class="d-flex">
						<div>
							<img src="/static/img/main1.jpg" style="width:450px; height:270px">
						</div>
						<div>
							<div class="d-flex justify-content-center">
								<div class="pt-2 pl-3 col-12">
									<input type="text" class="form-control" placeholder="초밥 이름" id="nameInput">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<select class="form-control" id="typeInput">
										<option value="">초밥 종류</option>
										<option value="초밥">초밥</option>
										<option value="군함">군함</option>
										<option value="사이드">사이드</option>
										<option value="음료">음료</option>
									</select>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<select class="form-control" id="colorInput">
										<option value="">초밥 접시 색</option>
										<option value="노란색">노란색</option>
										<option value="파란색">파란색</option>
										<option value="흰색">흰색</option>
										<option value="검은색">검은색</option>
									</select>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<input type="text" class="form-control" placeholder="초밥 가격" id="priceInput">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3 col-12">
									<input type="file" class="form-control" id="img">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-between pt-4">
					<button type="button" class="btn btn-primary" id="addBtn">추가</button>
				</div>
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
		
		$("#colorInput").on("change", function(){
			
			var color = $(this).val();
			
			if(color == "노란색"){
				$("#priceInput").val("3000");
			} else if(color == "흰색") {
				$("#priceInput").val("3500");
			} else if(color == "파란색") {
				$("#priceInput").val("4000");
			} else if(color == "검은색") {
				$("#priceInput").val("4500");
			}
			
		});
		
		
		$("#addBtn").on("click", function(){
			
			var file = $("#img")[0].files[0];
			var name = $("#nameInput").val();
			var type = $("#typeInput").val();
			var price = $("#priceInput").val();
			var color = $("#colorInput").val();
			
			if(img == ""){
				alert("이미지를 선택해 주세요");
				return;
			}
			
			if(name == ""){
				alert("초밥 이름을 입력해 주세요");
				$("#nameInput").focus();
				return;
			}

			if(type == ""){
				alert("초밥 종류를 선택해 주세요");
				$("#typeInput").focus();
				return;
			}

			if(color == ""){
				alert("초밥 접시 색을 선택해 주세요");
				$("#colorInput").focus();
				return;
			}
			
			if(price == ""){
				alert("초밥 가격을 입력해 주세요");
				$("#priceInput").focus();
				return;
			}
			
			if(file == null){
				alert("이미지를 추가해 주세요");
				return;
			}


			var formData = new FormData();

			formData.append("imagePath", file);
			formData.append("name", name);
			formData.append("type", type);
			formData.append("price", price);
			formData.append("dishColor", color);

			$.ajax({
				type:"post"
				, url:"/menu/create"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success:function(data){
					if(data.result == "success"){
						location.href="/menu/list-view"
					} else{
						alert("메뉴 추가 실패");
					}
				}
				, error:function(){
					alert("메뉴 추가 에러");
				}
			});
			
		});
		
		

	});

</script>

</body>
</html>