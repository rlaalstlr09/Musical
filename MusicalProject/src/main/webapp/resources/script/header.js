document.querySelector('.search button').addEventListener('click', function () {
  alert('Search functionality is not implemented yet.');
});


const submenuItems = document.querySelectorAll('.has-submenu');

submenuItems.forEach(item => {
  const submenu = item.querySelector('.submenu');

  item.addEventListener('mouseenter', function () {
    submenu.style.display = 'block';
  });

  item.addEventListener('mouseleave', function () {
    submenu.style.display = 'none';
  });
});
document.getElementById('scroll-icon').style.display = 'none';

$(document).ready(function () {
  var $header = $('.header-background');
  var $defaultIcon = $('#default-icon');
  var $scrollIcon = $('#scroll-icon');
  var scrollTrigger = 650; // 헤더가 나타나기 시작할 스크롤 위치 (픽셀 단위)

    // 페이지 로드시 고정 상태 확인
    if ($(window).scrollTop() > scrollTrigger) {
      $header.addClass('sticky');
      changeHeaderColor(true);  // 고정된 헤더 색상 변경
    }
  

  // 스크롤 이벤트 핸들러
  $(window).on('scroll', function () {
    if ($(this).scrollTop() > scrollTrigger) {
      if (!$header.hasClass('sticky')) {
        $header.addClass('sticky');
        $defaultIcon.hide(); // 기본 검색로고 이미지 숨김
        $scrollIcon.show();  // 블랙 검색 이미지 표시

      }
    } else {
      if ($header.hasClass('sticky')) {
        $header.removeClass('sticky');
        $defaultIcon.show(); // 기본 검색로고 이미지 표시
        $scrollIcon.hide();  // 블랙 검색 이미지 숨김

        $
      }
    }
  });

  // 페이지 로드 시 헤더의 고정 상태를 설정
  $(window).trigger('scroll'); // 페이지 로드 시 스크롤 이벤트를 강제로 발생시켜 상태를 설정
});

  // 색상을 변경하는 함수
  function changeHeaderColor(isSticky) {
    if (isSticky) {
      $header.css('background-color', '#000');  // 헤더 색상을 검정으로 변경
    } else {
      $header.css('background-color', 'transparent');  // 기본 색상으로 변경
    }
  }


// 페이지가 로드될 때 스크롤 위치 복원
window.addEventListener('load', () => {
  const scrollPosition = sessionStorage.getItem('scrollPosition');
  if (scrollPosition) {
      window.scrollTo(0, parseInt(scrollPosition));
  }
});

// 스크롤 위치 저장
window.addEventListener('scroll', () => {
  sessionStorage.setItem('scrollPosition', window.scrollY);
});

  document.querySelector('.close-btn').addEventListener('click', function() {
  document.querySelector('.slidebar').classList.add('hide');
  document.getElementById('menuicon').checked = false; // 메뉴 아이콘의 체크 상태를 해제
});



let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  
  for (let i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}



document.addEventListener('scroll', function() {
  var adBanner = document.getElementById('adBanner');
  var scrollPosition = window.scrollY || window.pageYOffset; // 현재 스크롤 위치
  var triggerHeight = 400; // 배너를 표시할 스크롤 위치 (픽셀 단위)

  // 스크롤 위치가 트리거 높이보다 크면 배너를 표시, 그렇지 않으면 숨깁니다.
  if (scrollPosition > triggerHeight) {
    adBanner.style.display = 'block'; // 배너를 표시합니다.
    adBanner.style.bottom = '220px'; // 하단 여백 설정
  } else {
    adBanner.style.display = 'none'; // 배너를 숨깁니다.
  }
});
