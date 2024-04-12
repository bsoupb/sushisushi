<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
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
			<div class="container-sb" data-menu-id="${menu.id }" id="menus">
				<div class="pt-5">
					<div class="d-flex">
						<div>
							<img src="${menu.imagePath }" style="width:300px; height:220px;">
						</div>
						<div>
							<div class="d-flex justify-content-center">
								<div class="pt-2 pl-3">
									<input type="text" class="form-control" id="nameInput" placeholder="초밥 이름" value="${menu.name }">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3">
									<input type="text" class="form-control" id="typeInput" placeholder="초밥 종류" value="${menu.type }">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3">
									<input type="text" class="form-control" id="priceInput" placeholder="초밥 가격" value="${menu.price }">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<div class="pt-3 pl-3">
									<input type="text" class="form-control" id="colorInput" placeholder="초밥 접시 색" value="${menu.dishColor }">
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-end pt-4">
					<a href="/menu/list-view" type="button" class="btn btn-primary">뒤로가기</a> &nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" id="soldoutBtn">SoldOut</button> &nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" id="updateBtn">수정</button>
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
		
		$("#updateBtn").on("click", function(){
			
			var name = $("#nameInput").val();
			var type = $("#typeInput").val();
			var price = $("#priceInput").val();
			var color = $("#colorInput").val();
			var menuId = $("#menus").data("menu-id");
			

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

			if(price == ""){
				alert("초밥 가격을 입력해 주세요");
				$("#priceInput").focus();
				return;
			}

			if(color == ""){
				alert("초밥 접시 색을 선택해 주세요");
				$("#colorInput").focus();
				return;
			}
	
			
			$.ajax({
				type:"put"
				, url:"/menu/update"
				, data:{"id":menuId, "name":name, "type":type, "price":price, "dishColor":color}
				, success:function(data){
					if(data.result == "success"){
						location.href="/menu/list-view";
					} else{
						alert("메뉴 수정 실패");
					}
				}
				, error:function(){
					alert("메뉴 수정 에러");
				}
			});
			
		});
		
		
		$("#soldoutBtn").on("click", function(){
			
			var name = $("#nameInput").val();
			var type = $("#typeInput").val();
			var price = $("#priceInput").val();
			var color = $("#colorInput").val();
			var menuId = $("#menus").data("menu-id");
			
			$.ajax({
				
				type:"put"
				, url:"/menu/soldout"
				, data:{"id":menuId, "name":name, "type":type, "price":price, "dishColor":color}
				, success:function(data){
					if(data.result == "success"){
						location.href = "/menu/list-view";
					} else {
						alert("솔드아웃 입력 실패");
					}
				}
				, error:function(){
					alert("솔드아웃 입력 에러");
				}
			});
			
		});


	});

</script>




</body>
</html>