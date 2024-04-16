<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<div id="sushisushi" class="header-font" onclick="location.href='/main/main-view'">sushisushi</div>
		</header>
		
		<section>
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
						<c:forEach var="shoppingbasket" items="${shoppingbasketDetailList }" >
						<!-- 메뉴 -->
							<tr>
								<td>${shoppingbasket.name }</td>
								<td>
									<i class="bi bi-plus-square plusBtn" data-plus-id="${shoppingbasket.menuId }">
									${shoppingbasket.count }
									</i>
									<i class="bi bi-dash-square minusBtn" data-minus-id="${shoppingbasket.menuId }"></i>
								</td>
								<td>7000</td>
							</tr>
						<!-- /메뉴 -->
						</c:forEach>
						</tbody>
						<tr>
							<th>총</th>
							<th>4</th>
							<th>11000</th>
						</tr>
					</table>
		
					<div class="text-right">
						9000원 이상 더 주문해 주세요.
					</div>
				</div>
				
				<div>
					<div>
						지도
					</div>
					<div>
						<div class="input-group pt-2 col-9">
							<input type="text" id="addressInput" class="form-control" placeholder="주소" readonly>
							<div class="input-group-append">
						 		<button class="btn btn-secondary" type="button" onclick="findAddr()">주소 검색</button>
							</div>
						</div>
					</div>
					<div class="text-primary">
						배달 가능한 주소입니다.
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
		$("#addressInput").val(addr);
		}	
	}).open();
	}
	
	$(document).ready(function(){
		
		$(".plusBtn").on("click", function(){
			
			var menuId = $(this).data("plus-id");
			
			$.ajax({
				
				type:"post"
				, url:"/order/plus"
				, data:{"menuId":menuId}
				, success:function(data){
					if(data.result == "success"){
						location.reload();
					} else{
						alert("플러스 실패");
					}
				}
				, error:function(){
					alert("플러스 에러")
				}
			});
			
		});
		
		$(".minusBtn").on("click", function(){
			
			var menuId = $(this).data("minus-id");
			
			$.ajax({
				
				type:"post"
				, url:"/order/minus"
				, data:{"menuId":menuId}
				, success:function(data){
					if(data.result == "success"){
						location.reload();
					} else {
						alert("마이너스 실패");
					}
				}
				, error:function(){
					alert("마이너스 에러")
				}
				
			});
		});
		
	});
	
</script>

</body>
</html>