<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
								<th></th>
							</thead>
						</tr>
						<tbody>
						<c:forEach var="shoppingbasket" items="${shoppingbasketDetailMap.ShoppingbasketDetail }" >
						<!-- 메뉴 -->
							<tr>
								<td>${shoppingbasket.name }</td>
								<td>
									<i class="bi bi-plus-square plusBtn" data-plus-id="${shoppingbasket.menuId }">
									${shoppingbasket.count }
									</i>
									<i class="bi bi-dash-square minusBtn" data-minus-id="${shoppingbasket.menuId }"></i>
								</td>
								<td><fmt:formatNumber value="${shoppingbasket.price * shoppingbasket.count}" pattern="#,###"/>원</td>
								<td><button type="button" class="btn btn-danger btn-sm deleteBtn" data-delete-id="${shoppingbasket.id }">삭제</button></td>
							</tr>
						<!-- /메뉴 -->
						</c:forEach>
						</tbody>
						<c:set var="totalCount" value="${shoppingbasketDetailMap['totalCount'] }" />
						<c:set var="totalPrice" value="${shoppingbasketDetailMap['totalPrice'] }" />
						<tr>
							<th>총</th>
							<th>${totalCount }</th>
							<th>${totalPrice }원</th>
						</tr>
					</table>
		
					<div class="text-right pb-4 text-danger">
						<c:if test="${totalPrice < 18000 }" >
							${Math.abs(18000 - totalPrice) }원 이상 더 주문해 주세요.
						</c:if>
					</div>
				</div>
				
				<div>
					<div>
						<div id="map" style="width:500px;height:400px;"></div>
					</div>
					<div>
						<div class="input-group pt-3 col-9 pl-0">
							<input type="text" id="addressInput" class="form-control" placeholder="주소" readonly>
							<div class="input-group-append">
						 		<button class="btn btn-secondary" type="button" onclick="findAddr()" id="searchBtn">주소 검색</button>
							</div>
						</div>
					</div>
					<div class="text-primary pt-3 d-none" id="deliverable">
						배달 가능한 주소입니다.
					</div>
					<div class="text-danger pt-3 d-none" id="undeliverable">
						배달 불가능한 주소입니다.
					</div>
				</div>
				<div class="d-flex justify-content-end pt-5">
					<button type="button" class="btn btn-primary" id="orderBtn">주문</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1124fcd2bdd103c7c98fc955adbf0057&libraries=services,clusterer,drawing"></script>

<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	function MapAddress(address){
		
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">배달지점</div>'
	        });
	        infowindow.open(map, marker);
	
	    } 
	});    
		
	}
	
	var deliveryAddr = '';
	var isDuplicateAddr = false;
	
	// findAddr() 함수 정의
	function findAddr(){
		new daum.Postcode({
		oncomplete:function(data){
		// 사용자 주소를 받아올 변수를 정의
		var addr = '';
		
		deliveryAddr = data.sigungu;
		
		// 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져옴
		if(data.userSelectedType === 'R'){ // 사용자가 도로명 주소 선택
			addr = data.roadAddress;
		} else { // 사용자가 지번 주소 선택
			addr = data.jibunAddress;
		}
		
		// 부모창의 주소칸에 받아온 주소 넣음
		$("#addressInput").val(addr);
		
		if(deliveryAddr == "강남구"){
			$("#deliverable").removeClass("d-none");
			$("#undeliverable").addClass("d-none");
			isDuplicateAddr = true;
		} else {
			$("#undeliverable").removeClass("d-none");
			$("deliverable").addClass("d-none");
		}
		
		// 새로운 주소로 지도 업데이트
		MapAddress(addr);
		}	
	}).open();
	}
	
	
	$(document).ready(function(){
		
		$("#addressInput").on("change", function() {
	        
			MapAddress($(this).val());
			
			
	    });

		
		$("#orderBtn").on("click", function(){
			
			if($("#addressInput").val() == ""){
				alert("배달 주소를 입력해 주세요");
				return;
			}
			
			if(!isDuplicateAddr){
				alert("배달 가능한 주소인지 확인해 주세요");
			}
		
			$.ajax({
				
				type:"post"
				, url:"/order/insert"
				, data:{"menuId", "userId", "billId", "totalDish"}
				, success:function(data){
					if(data.result == "success"){
						location.href = "/bill/receipt-view";
					} else {
						alert("주문서 저장 실패");
					}
				}
				, error:function(){
					alert("주문서 저장 에러");
				}
			});

		});
		
		
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
		
		$(".deleteBtn").on("click", function(){
			
			var id = $(this).data("delete-id");
			
			$.ajax({
				
				type:"delete"
				, url:"/order/delete"
				, data:{"id":id}
				, success:function(data){
					if(data.result == "success"){
						location.reload();
					} else{
						alert("삭제 실패");
					}
				}
				, error:function(){
					alert("삭제 에러");
				}
			});
			
		});
		
	});
	
</script>

</body>
</html>