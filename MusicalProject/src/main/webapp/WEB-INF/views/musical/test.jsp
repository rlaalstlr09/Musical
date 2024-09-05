<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
/>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style>
.swiper {
    width: 80%;
    height: 500px; /* 높이 조정 */
}

/* Swiper 슬라이드 스타일 */
.swiper-slide {
    background-color: #ddd; /* 슬라이드 배경 색상 */
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    color: #333;
}
.aa{
	display : flex;
	width:100%;
	height:100%;
}
.img{
	display:flex;
	background-image : url('/ex/resources/img/musical/cat.jpg');
	width:100%;
	height:100%;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

</style>
<script>
$(document).ready(function(){
	  var swiper = new Swiper('.musical-like', {
	    	
	        slidesPerView: 3, // 화면에 보여질 슬라이드 수
	        spaceBetween: 20,
	        loop:true, 
	        effect: 'coverflow',
	        coverflowEffect: {
	            rotate: 50, // 슬라이드 회전 각도
	            stretch: 0, // 슬라이드 간의 간격
	            depth: 100, // 슬라이드의 깊이
	            modifier: 1, // 효과 강도 조절
	            slideShadows: true, // 슬라이드에 그림자 추가
	        },
	       
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        pagination: {
	            el: '.swiper-pagination',
	            clickable: true,
	        },
	        autoplay: {
	            delay: 5000, // 자동 슬라이드 전환 간격 (밀리초 단위)
	        },
	        
	    });

});
</script>
</head>
<body>
<div class="swiper musical-like">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">
   	 <a href = "#" class = "aa">
   	 	<div class = "img"> 
   	 		<h5>test1</h5>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 	</div>
   	 </a>
	</div><div class="swiper-slide">
   	 <a href = "#" class = "aa">
   	 	<div class = "img"> 
   	 		<h5>test2</h5>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 	</div>
   	 </a>
	</div><div class="swiper-slide">
   	 <a href = "#" class = "aa">
   	 	<div class = "img"> 
   	 		<h5>test3</h5>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 	</div>
   	 </a>
	</div><div class="swiper-slide">
   	 <a href = "#" class = "aa">
   	 	<div class = "img"> 
   	 		<h5>test4</h5>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 	</div>
   	 </a>
	</div>
	<div class="swiper-slide">
   	 <a href = "#" class = "aa">
   	 	<div class = "img"> 
   	 		<h5>test5</h5>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 		<p>sex</p>
   	 	</div>
   	 </a>
	</div>
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

</div>
</body>
</html>