<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css"> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
</head>

<body>

  <jsp:include page="layout/header.jsp"/>
  

 <div class="slideshow-container">
      <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="<%=request.getContextPath()%>/resources/img/임시1.jpg" style="width:100%; height: 720px;">
        <div class="text"></div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="<%=request.getContextPath()%>/resources/img/임시2.jpg" style="width:100%; height: 720px;">
        <div class="text"></div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="<%=request.getContextPath()%>/resources/img/임시3.jpg" style="width:100%; height: 720px;">
        <div class="text"></div>
      </div>

      <a class="prev" onclick="plusSlides(-1)">❮</a>
      <a class="next" onclick="plusSlides(1)">❯</a>

      <div class="dot-container">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
      </div>
    </div>

    </section>
    <div class="recommend">
      <div class="recommend_text">RECOMMENDED MUSICAL</div>
    </div>
    <div class="open_carousel">
      <div class="open_carousel-item">
        <img src="<%=request.getContextPath()%>/resources/img/차사 강림.jpg" alt="Image 1">
        <div class="overlay">
          <div class="overlay-text">Image 1 Description</div>
        </div>
      </div>
      <div class="open_carousel-item">
        <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="Image 2">
        <div class="overlay">
          <div class="overlay-text">Image 2 Description</div>
        </div>
      </div>
      <div class="open_carousel-item">
        <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="Image 3">
        <div class="overlay">
          <div class="overlay-text">Image 3 Description</div>
        </div>
      </div>
      <div class="open_carousel-item">
        <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="Image 4">
        <div class="overlay">
          <div class="overlay-text">Image 4 Description</div>
        </div>
      </div>
    </div>
    </div>


    <div class="purple_text">
      ALLTIME<br>
      LEGEND
    </div>

    <div class="purple1_text">
      "티켓보라에서 예약하면 50%할인"
    </div>

    <div class="purple">
      <div class="background"></div>
      <div class="purple_slides">
        <img src="<%=request.getContextPath()%>/resources/img/영웅.jpg" alt="Image 1">
        <img src="<%=request.getContextPath()%>/resources/img/파리.jpg" alt="Image 2">
        <img src="<%=request.getContextPath()%>/resources/img/타이타닉.jpg" alt="Image 3">
      </div>
    </div>


    <div class="concerts-container">
      <div class="openconcert1_text">
        OPEN MUSICAL
      </div>

      <div class="openconcert_text">
        <a href="#">
        +
        </a>
      </div>
      <div class="concerts">
        <img src="<%=request.getContextPath()%>/resources/img/차사 강림.jpg" alt="Image 1">
        <div class="overlay">
          <div class="overlay-text">Image 1 Description</div>
        </div>
      </div>
      <div class="concerts">
        <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="Image 2">
        <div class="overlay">
          <div class="overlay-text">Image 2 Description</div>
        </div>
      </div>
      <div class="concerts">
        <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="Image 3">
        <div class="overlay">
          <div class="overlay-text">Image 3 Description</div>
        </div>
      </div>
      <div class="concerts">
        <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="Image 4">
        <div class="overlay">
          <div class="overlay-text">Image 4 Description</div>
        </div>
      </div>
      <div class="concerts">
        <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="Image 4">
        <div class="overlay">
          <div class="overlay-text">Image 4 Description</div>
        </div>
      </div>
      <div class="concerts">
        <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="Image 4">
        <div class="overlay">
          <div class="overlay-text">Image 4 Description</div>
        </div>
      </div>
    </div>


       <div class="KIDS1_text">
        <a href="#">
        +
        </a>
      </div>
      
     <div class="KIDS1">
      <div class="KIDS_text">
        KIDS MUSICAL
      </div>
      
    <div class="KIDS">
      <div class="main-container">
        <div class="large-item">
          <a href="#">
            <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
          </a>
        </div>
        <div class="grid-container">
          <div class="top-row">
            <div class="grid-item">
              <a href="#">
                <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지02">
              </a>
            </div>
            <div class="grid-item">
              <a href="#">
                <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지03">
              </a>
            </div>
          </div>
          <div class="bottom-row">
            <div class="grid-item">
              <a href="#">
                <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지04">
              </a>
            </div>
            <div class="grid-item">
              <a href="#">
                <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지05">
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

  <div class="You">
      <div class="left-content">
        <div class="text-line line-1"><br>인사이드아웃2<br></div>
        <div class="text-line line-2">디즈니·픽사의 대표작 </div>
        <div class="text-line line-3">새로운 감정과 함께 돌아오다!</div>
      </div>
      <iframe width="700" height="350" src="https://www.youtube.com/watch?v=Vf-iEgOneNs" frameborder="0"
        allowfullscreen></iframe>
    </div>

   

    <div class="nowgallery_text">
      <a href="#">
      +
      </a>
    </div>
    
    <div class="now_gallery">
      <div class="now_text">
        NOW SHOWING
      </div>
      
      <div class="now-container">
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>황금카니발 2024</h5>
        <p>2024.09.28 - 2024.09.29<br>경주시 금리단길 일대</p>
    </a>    
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>스탠드업 코미디 MOODO</h5>
        <p>2024.09.08 - 2024.09.18<br>서울 외 3개 지역</p>
        </a>
    </div>
    <div class="now-item">
     <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>앤서니 라자로 서울 공연</h5>
        <p>2024.09.22<br>노들섬 라이브하우스</p>
        </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>Sylo 내한공연</h5>
        <p>2024.10.17 - 2024.10.17<br>KT&G 상상마당 홍대 라이브홀</p>
         </a>
    </div>
</div>

<div class="now-container-two">
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>황금카니발 2024</h5>
        <p>2024.09.28 - 2024.09.29<br>경주시 금리단길 일대</p>
          </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>스탠드업 코미디 MOODO</h5>
        <p>2024.09.08 - 2024.09.18<br>서울 외 3개 지역</p>
          </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>앤서니 라자로 서울 공연</h5>
        <p>2024.09.22<br>노들섬 라이브하우스</p>
          </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>Sylo 내한공연</h5>
        <p>2024.10.17 - 2024.10.17<br>KT&G 상상마당 홍대 라이브홀</p>  
        </a>
    </div>
</div>


<div class="now-container-three">
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>황금카니발 2024</h5>
        <p>2024.09.28 - 2024.09.29<br>경주시 금리단길 일대</p>
          </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>스탠드업 코미디 MOODO</h5>
        <p>2024.09.08 - 2024.09.18<br>서울 외 3개 지역</p>
          </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>앤서니 라자로 서울 공연</h5>
        <p>2024.09.22<br>노들섬 라이브하우스</p>
          </a>
    </div>
    <div class="now-item">
    <a href="#">
         <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
        <h5>Sylo 내한공연</h5>
        <p>2024.10.17 - 2024.10.17<br>KT&G 상상마당 홍대 라이브홀</p>
          </a>
    </div>
</div>      
      

      <div class="ad-banner" id="adBanner">
        <a href="#" target="_blank" class="banner-link">
          <div class="banner-content">
            <img src="<%=request.getContextPath()%>/resources/img/차사 강림.jpg" alt="Banner Image">
            <div class="banner-text">
              <h3>예매바로가기</h3>
            </div>
          </div>
        </a>
      </div>

<jsp:include page="layout/footer.jsp"></jsp:include>


</body>
</html>