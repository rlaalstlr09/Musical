//$(document).ready(
//		function() {
//	//탭 누르면 실행되는 함수 ajax로 값 받아서 탭 내용 바꿈
//	function loadTabContent(tabId) {
//		$.ajax({
//			url : '/ex/tab/' + tabId,
//			data : {
//				musical_id : '${musical.musical_id}'
//			},
//			method : 'GET',
//			success : function(data) {
//				$('#tab-content').html(data);
//			},
//			error : function(error) {
//				console.error('Error loading content:', error);
//			}
//		});
//	}
//
//	//페이지 불러오면 기본 탭으로 배우정보 뜨도록 바꾸기
//	function loadDefaultTabContent() {
//		var defaultTab = $('#myTab .nav-link.active').attr('href').substring(1);
//		loadTabContent(defaultTab);
//	}
//
//	//좋아요 토글, 누르면 버튼 바뀜
//	$('a#like-button').on('click',function() {
//		let $this = $(this);
//		let isLiked = $this.hasClass('liked');
//		let musicalId = $this.data('musical');
//		let customerId = $this.data('customer');
//
//		if (isLiked && !confirm('정말 취소하시겠습니까?')) {
//			return;
//		}
//
//		$.ajax({
//			url : '/ex/musical/like',
//			method : 'POST',
//			data : {
//				musical_id : musicalId,
//				customer_id : customerId
//			},
//			success : function(response) {
//				if (response.redirect) {
//					// 로그인 필요 시 로그인 페이지로 리다이렉트
//					window.location.href = response.redirect;
//				}
//				var currentCount = parseInt(
//						$('span#total-likes').text(), 10);
//				if (isLiked) {
//					$this.removeClass('liked').text('♡'); // 좋아요 취소
//					$('span#total-likes').text(currentCount - 1);
//				} else {
//					$this.addClass('liked').text('♥'); // 좋아요 추가
//					$('span#total-likes').text(currentCount + 1);
//
//				}
//				$('span#total-likes').text(response.total_likes);
//			},
//			error : function(error) {
//				console.error('Error loading content:', error);
//			}
//
//		});
//	});
//
//	//탭 클릭하면 함수 실행
//	$('a[data-toggle="tab"]').on('click', function(e) {
//		var tabId = $(this).attr('href').substring(1);
//		loadTabContent(tabId);
//	});
//	loadDefaultTabContent();
//	
//	$(document).ready(function() {
//	    $('#openModalLink').click(function(event) {
//	        event.preventDefault(); // 링크 클릭 시 기본 동작 방지
//	        
//	        $.ajax({
//	            url: '/ex/musical/fragments/venue.jsp', // JSP 파일의 경로
//	            method: 'GET', // GET 메서드 사용
//	            data : {
//	            	venue_id : '${musical.venue_id}',
//	            	hall_id : '${musical.hall_id}'
//	            },
//	            success: function(data) {
//	                // AJAX 요청이 성공적으로 완료되면 모달의 내용 업데이트
//	                $('#modal-body-content').html(data);
//	                
//	                // 모달 표시
//	                $('#myModal').modal('show');
//	            },
//	            error: function(jqXHR, textStatus, errorThrown) {
//	                console.error('Error fetching content:', textStatus, errorThrown);
//	                $('#modal-body-content').html('<p>An error occurred while loading the content.</p>');
//	                $('#myModal').modal('show');
//	            }
//	        });
//	    });
//	});
//});