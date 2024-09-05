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

  document.querySelector('.close-btn').addEventListener('click', function() {
  document.querySelector('.slidebar').classList.add('hide');
  document.getElementById('menuicon').checked = false; // 메뉴 아이콘의 체크 상태를 해제
});

  document.addEventListener('DOMContentLoaded', function() {
	  // 체크박스의 상태를 기본값으로 초기화합니다 (체크 해제 상태)
	  document.getElementById('menuicon').checked = false;
	});
  
