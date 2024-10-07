

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

      }
    }
  });

});
window.addEventListener('load', function() {
	let slideIndex = 1;
	showSlides(slideIndex);

	// 전역 함수로 바인딩
	window.plusSlides = function(n) {
		showSlides(slideIndex += n);
	}

	window.currentSlide = function(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		let slides = document.getElementsByClassName("mySlides");
		let dots = document.getElementsByClassName("dot");

		// 슬라이드 개수 확인
		if (slides.length === 0) {
			console.error("No slides found with class 'mySlides'");
			return;
		}

		if (n > slides.length) { slideIndex = 1; }
		if (n < 1) { slideIndex = slides.length; }

		// 모든 슬라이드 숨기기
		for (let i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}

		// 모든 점 비활성화
		for (let i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}

		// 현재 슬라이드와 점 활성화
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}
});
//페이지 로드 시 실행
window.addEventListener('load', function() {
	
    // 현재 페이지 URL을 가져옵니다.
    const currentPage = window.location.pathname;

    // 헤더 요소를 선택합니다.
    const header = document.querySelector('.header-background');
console.log(ContextPath);
    // 조건에 따라 헤더에 클래스 추가
    if (currentPage !== ContextPath+'/' && currentPage !== ContextPath+'/') {
        // 홈 페이지가 아닌 경우, 색상 변경
        header.classList.add('page-header-active'); // 'page-header-active' 클래스를 추가하여 색상 변경
    } else {
        // 홈 페이지인 경우, 기본 스타일 유지
        header.classList.remove('page-header-active');
    }
    
});
	 
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

document.addEventListener('DOMContentLoaded', function() {
	  const slides = document.querySelectorAll('.purple_slides img');
	  let currentIndex = 0;

	  function showSlide(index) {
	    slides.forEach((slide, i) => {
	      slide.classList.toggle('active', i === index);
	    });
	  }

	  function nextSlide() {
	    currentIndex = (currentIndex + 1) % slides.length;
	    showSlide(currentIndex);
	  }

	  showSlide(currentIndex);
	  setInterval(nextSlide, 3000); // 3초마다 슬라이드 전환
	});

