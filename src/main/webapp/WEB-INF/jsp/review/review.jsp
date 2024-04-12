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
<link rel="stylesheet" href="/static/css/star.css" type="text/css">
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
					<div><input type="text" onkeyup="imsi(this)" class="form-control col-5" id="pointInput" maxlength=3 value=""></div>
				</div>
				<fieldset class="rate">
                    <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                    <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                    <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                    <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                    <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                    <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                    <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                    <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                    <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                    <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
				</fieldset>
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
			<div class="card border-0">
				<div style="border:1px solid #ccc; padding:10px; margin:10px;">
					<div class="d-flex justify-content-between">
						<div class="pb-3" style="font-size:25px">${review.loginId }</div>
						<i class="bi bi-three-dots pb-3 pl-3 font-25 more-icon" data-review-id="${review.reviewId}" data-toggle="modal" data-target="#moreModal"></i>
					</div>
					<img src="${review.imagePath }" width="300">
					<div class="pt-2" id="point" style="font-size:18px">${review.point}</div>
					<c:forEach begin="1" end="${review.point}" step="1">
                        <img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="15">
                    </c:forEach>
                    <c:if test="${review.point % 1 != 0}">
                    	<img src="http://marondal.com/material/images/dulumary/web/jstl/star_half.png" width="15">
                    </c:if>
	                <c:forEach begin="1" end="${5 - review.point}" step="1">
                        <img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.png" width="15">
                    </c:forEach>
					<div class="pt-2" id="contents" style="font-size:20px">${review.contents}</div>
				</div>
			</div>
			</c:forEach>
			<!-- /카드 -->
				
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
		
		$("input[type='radio']").on("click", function(){
			
			console.log($(this).val());
			
			for(let i = 1; i <= 10; i++){
				
				if($(this).val() == i){
					$("#pointInput").val(i/2);
				}

			}
			
			let points = $(this).val();
			
			$("#pointInput").val(points / 2);
			
		});
		
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
		
		
		$(".more-icon").on("click", function(){

			var reviewId = $(this).data("review-id");

			$("#deleteBtn").data("review-id", reviewId);
		
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
			
			var reviewId = $(this).data("review-id");
		
			
			
			$.ajax({
				type:"delete"
				, url:"/review/delete"
				, data:{"id":reviewId}
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