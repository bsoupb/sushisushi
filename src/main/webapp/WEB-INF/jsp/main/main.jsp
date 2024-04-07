<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
	<c:if test="${not empty userId}">
		<div class="d-flex justify-content-end">
			<div class="mr-3">${userLoginId }님</div>
			<a href="/user/logout">로그아웃</a>
		</div>
	</c:if>
	
	<c:import url="/WEB-INF/jsp/include/nav.jsp" />
	<section>
		
		<div class="slider__wrap">
            <div class="slider__img">
                <div class="slider__inner">
                    <div class="slider s1"><img src="/static/img/main1.jpg" class="img-responsive"></div>
                    <div class="slider s2"><img src="/static/img/main2.jpg" class="img-responsive"></div>
                    <div class="slider s3"><img src="/static/img/main3.jpg" class="img-responsive"></div>
                    <div class="slider s4"><img src="/static/img/main4.jpg" class="img-responsive"></div>
                    <div class="slider s5"><img src="/static/img/main5.jpg" class="img-responsive"></div>
                </div>
            </div>
            <div class="slider__btn">
                <a href="#" class="prev">prev</a>
                <a href="#" class="next">next</a>
            </div>
            <div class="slider__dot">
                <!-- 
                <a href="#" class="active dot" >이미지1</a>
                <a href="#" class="dot">이미지2</a>
                <a href="#" class="dot">이미지3</a>
                <a href="#" class="dot">이미지4</a>
                <a href="#" class="dot">이미지5</a>
            	 -->
            </div>
        </div>
		
		<div class="d-flex justify-content-end">
			<i class="bi bi-cart-check" id="basket" style="font-size:50px"></i>		
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>
const sliderWrap = document.querySelector(".slider__wrap");
const sliderImg = sliderWrap.querySelector(".slider__img");         //보여지는 영역
const sliderInner = sliderWrap.querySelector(".slider__inner");     //움직이는 영역
const slider = sliderWrap.querySelectorAll(".slider");              //개별 이미지
const sliderDot = sliderWrap.querySelector(".slider__dot");         //닷 메뉴
const sliderBtn = sliderWrap.querySelectorAll(".slider__btn a");    //버튼

let currentIndex = 0;                                               //현재 보이는 이미지
let sliderCount = slider.length;                                    //이미지 갯수
let sliderInterval = 2000;                                          //이미지 변경 간격 시간
let sliderWidth = slider[0].offsetWidth;                            //이미지 가로 값
let dotIndex = "";

function init(){
    //이미지 갯수만큼 닷 메뉴 생성
    slider.forEach(() => dotIndex += "<a href ='#' class='dot'>이미지</a>");
        sliderDot.innerHTML = dotIndex;

        //첫 번째 닷 메뉴한테 활성화 표시하기
        sliderDot.firstChild.classList.add("active");

}
init();


//이미지 이동시키기
function gotoSlider(num){
    sliderInner.style.transition = "all 400ms";
    sliderInner.style.transform = "translateX("+ -sliderWidth * num +"px)";
    currentIndex = num;

    //닷 메뉴 활성화하기
    let dotActive = document.querySelectorAll(".slider__dot .dot");
    dotActive.forEach((active) => active.classList.remove("active"));
    dotActive[num].classList.add("active");
}

//버튼을 클릭했을 때
sliderBtn.forEach((btn, index) => {
    btn.addEventListener("click", () => {
        let prevIndex = (currentIndex+(sliderCount-1)) % sliderCount;
        let nextIndex = (currentIndex+1) % sliderCount;   //1 2 3 4 0 1 2 3 4

        if(btn.classList.contains("prev")){
            gotoSlider(prevIndex);
        } else {
            gotoSlider(nextIndex);
        }
    });
});

//dot 클릭
document.querySelectorAll(".slider__dot .dot").forEach((dot, index) => {
    dot.addEventListener("click", () => {
        gotoSlider(index);
    });
});


	
	
	

</script>

<script>
    $(document).ready(function(){    // "화면이 준비가 되었다. 이제 자바스크립트 실행해도 됨!"
        $(window).scroll(function(){ // "브라우저의 스크롤을 일으키면 실행시켜!!"
			$('body').removeClass('show')
        })
    })
</script>

</body>
</html>