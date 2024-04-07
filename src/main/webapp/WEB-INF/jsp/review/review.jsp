<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
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
		
		<section class="main">
		<div class="container-sb">
			<div style="border:1px solid #ccc; padding:10px; margin:10px;">
				<div class="pb-4">
					<textarea class="form-control border-0" rows="4" id="contentsInput"></textarea>
				</div>
				<div class="d-flex">
					<div class="d-flex align-items-center">
						<div class="mr-3">별점</div>
					</div>
					<div><input type="text" onkeyup="imsi(this)" class="form-control col-5" id="pointInput" maxlength=3></div>
				</div>
				<div class="d-flex justify-content-between">
					<div>
						<label for="img">
						<i class="bi bi-file-image" style="font-size:25px;"><input type="file" id="img" style="display:none"></i>
					</div>
					<button type="button" class="btn btn-primary btn-sm" id="uploadBtn">업로드</button>
				</div>
			</div>
	
			<!-- 카드 -->
			<c:forEach var="review" items="${reviewList}" >
			<div class="card">
				<div style="border:1px solid; padding:10px; margin:10px;">
					<div class="d-flex">
						<div>Hong</div>
						<i class="bi bi-three-dots font-25 moreIcon" data-review-id="${review.reviewId}" data-toggle="modal" data-target="#moreModal"></i>
					</div>
					<img src="${review.imagePath}" class="img-responsive">
					<div id="point">${review.point}</div>
					<div id="contents">${review.contents}</div>
				</div>
				<!-- /카드 -->
				</c:forEach>
				</div>
			</div>
		</section>
		
		<div class="modal fade" id="moreModal">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body text-center">
		        <a href="#" id="updateBtn">수정하기</a>
		        <a href="#" id="deleteBtn">삭제하기</a>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	
	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>
	
	var prev = "";
	var regexp = /^\d*(\.\d{0,1})?$/;
	
	function imsi(obj){
		if(obj.value.search(regexp)==-1){
			obj.value = prev;
		}
		else {
			prev = obj.value;
		}
	}


	$(document).ready(function(){
		
		$("#uploadBtn").on("click", function(){

			var contents = $("#contentsInput").val();
			var file = $("#img")[0].files[0];
			var point = $("#pointInput").val();
			
			if(contents == ""){
				alert("리뷰 내용을 입력해 주세요");
				return;
			}
			
			if(point == ""){
				alert("별점을 입력해 주세요");
				return;
			}
			
			let formData = new FormData();
			formData.append("contents", contents);
			formData.append("imagePath", file);
			formData.append("point", point);
			
			$.ajax({
				type:"post"
				, url:"/review/create"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success:function(data){
					if(data.result == "success"){
						location.reload();
					} else{
						alert("리뷰 작성 실패");
					}
				}
				, error:function(){
					alert("리뷰 작성 에러");
				}
			});
			
		});
		
		
		$("#moreIcon").on("click", function(){
		
			$("#moreIcon").click();

			var reviewId = $(this).data("review-id");

			$("#updateBtn").data("review-id", reviewId);
		
		});

		$("#updateBtn").on("click", function(){
			
			var contents = $("#contents").val();
			var point = $("#point").val();

			$.ajax({
				type:"put"
				, url:"/review/update"
				, data:{"reviewId":reviewId, "contents":contents, "point":point}
				, success:function(data){
					if(data.result=="success"){
						location.reload();
					} else{
						alert("수정 실패");
					}
				}
				, error:function(){
					alert("수정 에러");
				}
			});

		});

		$("#deleteBtn").on("click", function(){
			
			$.ajax({
				type:"delete"
				, url:"/review/delete"
				, data:{"reviewId":reviewId}
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