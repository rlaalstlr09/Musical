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
    <div class="performance">
      <div class="open_performance h2">티켓오픈공연</div>
      <div class="open_performance h3">performance</div>
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
        <a href="https://www.example.com">
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

    <div class="You">
      <div class="left-content">
        <div class="text-line line-1"><br>인사이드아웃2<br></div>
        <div class="text-line line-2">디즈니·픽사의 대표작 </div>
        <div class="text-line line-3">새로운 감정과 함께 돌아오다!</div>
      </div>
      <iframe width="700" height="350" src="https://www.youtube.com/watch?v=Vf-iEgOneNs" frameborder="0"
        allowfullscreen></iframe>
    </div>

    <div class="hero">
      <div class="hero_h2">"누가 죄인인가"</div>
      <div class="hero_h3">하얼빈의 총성, 잊을수 없는 그날</div>
      <a href="#">
        <img src="<%=request.getContextPath()%>/resources/img/영웅모음.jpg" alt="hero">
      </a>
    </div>

    <div class="best">
      <h4>베스트|</h4>
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

    <div class="kids_container">
      <div class="kids_text">
        kids
      </div>
    </div>
    <div class="kids1_text">
      <a href="#">
      +
      </a>
    </div>

    <div class="kids">
      <div class="kidss">
        <div class="kids_p">
          <a href="#">
          <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="Slide 1">
        </div>
        <div class="kids_p">
          <a href="#">
          <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="Slide 2">
          <div class="kids_caption"></div>
        </div>
        <div class="kids_p">
          <a href="#">
          <img src="<%=request.getContextPath()%>/resources/img/차사 강림.jpg" alt="Slide 3">
          <div class="kids_caption"></div>
        </div>
        <div class="kids_p">
          <a href="#">
          <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="Slide 3">
          <div class="kids_caption"></div>
        </div>
        <div class="kids_p">
          <a href="#">
          <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="Slide 3">
          <div class="kids_caption"></div>
        </div>
      </div>
    </div>

    <div class="gallery_text">
      <a href="#">
      +
      </a>
    </div>

      <div class="gallery">
        <h3>상영중|</h3>
        <ul>
          <!-- 첫 번째 줄 -->
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
              <div class="image-text">써니텐</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지02">
              <div class="image-text">피겨</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="이미지03">
              <div class="image-text">시스터즈</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="이미지04">
              <div class="image-text">시스터즈</div>
            </a>
          </li>

          <!-- 두 번째 줄 -->
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
              <div class="image-text">써니텐</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지02">
              <div class="image-text">피겨</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="이미지03">
              <div class="image-text">시스터즈</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="이미지04">
              <div class="image-text">시스터즈</div>
            </a>
          </li>

        </ul>

        <ul>
          <!-- 세 번째 줄 -->
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/써니텐.jpg" alt="이미지01">
              <div class="image-text">써니텐</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/피겨.jpg" alt="이미지02">
              <div class="image-text">2019.25.20~2015.25.98</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="이미지03">
              <div class="image-text">시스터즈</div>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="<%=request.getContextPath()%>/resources/img/시스터즈.jpg" alt="이미지04">
              <div class="image-text">시스터즈</div>
            </a>
          </li>
        </ul>
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

<jsp:include page="../../resources/layout/footer.jsp"></jsp:include>

</body>
</html>
