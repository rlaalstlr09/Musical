<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musical Details</title>
 <link rel="stylesheet" href="/ex/resources/css/musical_detail.css">
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <script src="/ex/resources/script/musicalDetail.js"></script>  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script>

$(document).ready(function() {
	//탭 누르면 실행되는 함수 ajax로 값 받아서 탭 내용 바꿈
	function loadTabContent(tabId) {
		$.ajax({
			url : '/ex/tab/' + tabId,
			data : {
				musical_id : '${musical.musical_id}'
			},
			method : 'GET',
			success : function(data) {
				$('.card-body').html(data);
			},
			error : function(error) {
				console.error('Error loading content:', error);
			}
		});
	}

	//페이지 불러오면 기본 탭으로 배우정보 뜨도록 바꾸기
	function loadDefaultTabContent() {
		var defaultTab = $('#myTab .nav-link.active').attr('href').substring(1);
		loadTabContent(defaultTab);
	}

	//좋아요 토글, 누르면 버튼 바뀜
	$('a#like-button').on('click',function(event) {
		event.preventDefault();
		
		let $this = $(this);
		let isLiked = $this.hasClass('liked');
		let musicalId = $this.data('musical');

		if (isLiked && !confirm('정말 취소하시겠습니까?')) {
			return;
		}

		$.ajax({
			url : '/ex/musical/like',
			method : 'POST',
			data : {
				musical_id : musicalId,
			},
			success : function(response) {
				if (response === 'redirect') {
					// 로그인 필요 시 로그인 페이지로 리다이렉트
					if(confirm('로그인이 필요합니다')){
						window.location.href = '/ex/customer/login';
					};
					
				}
				else if (response === 'failed'){
					return;
				}
				
				else if	(response === 'success'){
					var currentCount = parseInt(
							$('span#total-likes').text(), 10);
					if (isLiked) {
						$this.removeClass('liked').text('♡'); // 좋아요 취소
						$('span#total-likes').text(currentCount - 1);
					} else {
						$this.addClass('liked').text('❤'); // 좋아요 추가
						$('span#total-likes').text(currentCount + 1);

					}
				}
				
			},
			error : function(error) {
				console.error('Error loading content:', error);
			}

		});
	});

	//탭 클릭하면 함수 실행
	$('a[data-toggle="tab"]').on('click', function(e) {
		var tabId = $(this).attr('href').substring(1);
		
//		 $('html, body').animate({
//		        scrollTop: $('').offset().top - 50 
//		 }, 500);
		 
		loadTabContent(tabId);
	});
	loadDefaultTabContent();
	
	// 공연장 정보 모달
	
    $('#openModalLink').off('click').on('click',function(event) {
        event.preventDefault(); // 링크 클릭 시 기본 동작 방지
        
        $.ajax({
            url: '/ex/musical/venue', // JSP 파일의 경로
            method: 'GET', // GET 메서드 사용
            data : {
            	venue_name : '${musical.venue_name}',
            	hall_name : '${musical.hall_name}'
            },
            success: function(data) {
            	
                // AJAX 요청이 성공적으로 완료되면 모달의 내용 업데이트
                $('#venue-modal-body').html(data);
             
                $('#venue-modal').on('shown.bs.modal', function () {
	                setTimeout(function() {
	                    relayout(); // 지도 크기 변경 후 relayout 호출
	                }, 100); 
                });
                // 모달 표시
                $('#venue-modal').modal('show');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching content:', textStatus, errorThrown);
                $('#venue-modal-body').html('<p>An error occurred while loading the content.</p>');
                $('#venue-modal').modal('show');
            }
        });
    });
	
    $('#scrollToTopBtn').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 600);
    });

    $('#scrollToBottomBtn').click(function() {
        $('html, body').animate({ scrollTop: $(document).height() }, 600);
    });
    
});
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	
	<div id="container">
		<div class="info">
			<div class ="musical-poster">
				<img src="/ex/resources/img/musical/${musical.musical_poster}" alt="poster"
					class="img-fluid">
				
				<div class="like">
					<a href="#" id="like-button" class="${isLike == 1 ? 'liked' : ''}" data-musical="${musical.musical_id }"> 
						${isLike == 1 ? '❤' : '♡'}
					</a> 
					<span id="total-likes">
						${musical.total_likes }
					</span>
				</div>
			</div>
			<div class = "musical-detail-info">
				<h1>${musical.musical_title}</h1>
				
				<br> 공연 장소 :
				<!-- Link to open the modal -->
				<a href="#" class="open-venue-modal" id="openModalLink"
					data-toggle="modal" data-target="#venue-modal"><strong>${musical.venue_name }&nbsp;${musical.hall_name} ▶</strong></a>
				 
				<!-- Modal -->
				<div class="modal fade" id="venue-modal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">공연장 정보</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" id="venue-modal-body">
								<!-- Content will be loaded here -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				
				
				<br> 공연 기간 :
				<fmt:formatDate value="${musical.musical_period_start}" pattern="yyyy-MM-dd" />
				~
				<fmt:formatDate value="${musical.musical_period_end}" pattern="yyyy-MM-dd" />
				<br> 상영 시간 : ${musical.musical_runningtime}<br> 연령 제한 :
				${musical.musical_agelimit}<br>
				<table class= "seat-table">
					<tr>
						<th class = "seat-grade">좌석 등급</th>
						<th class = "seat-price">가격</th>
					</tr>
					
					<c:forEach var="seat" items="${musical.seatDtos}">
					      <tr>
					      	<td class = "seat-grade">${seat.seat_grade}</td>
					      	<td class = "seat-price">${seat.seat_price} 원</td>
					      </tr>
					</c:forEach>
					
				</table>
				
			</div>
			
			<div class = "button-container">
				<button class="btn btn-primary list" onclick="location.href='/ex/musical/listAll'">목록</button>
				<a class="btn btn-success reservation" href="${pageContext.request.contextPath}/reservation/reservation?venue_id=${musical.venue_id}&musical_id=${musical.musical_id}">예매하기</a>

				
			</div>
		</div>
		
		
		<div class = "card text-center">
			<div id="tab" class = "card-header">
				<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="chararcter-tab" data-toggle="tab" href="#character" role="tab">배우 정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="sale-tab" data-toggle="tab" href="#sale" role="tab">판매 정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab">리뷰</a></li>
					<li class="nav-item">
						<a class="nav-link" id="qna-tab" data-toggle="tab" href="#qna" role="tab">Q&A</a>
					</li>
				</ul>
			</div>
			<div class = "card-body">
			</div>
		</div>
		<div class="musiscal-detail">
			<h2>공연 상세</h2>
			<div id="notice">
				<strong>공지사항</strong>
				
				<ul>
					<li>본 공연은 <span class = "bold">${musical.musical_agelimit}세</span>부터 예약 가능합니다.</li>
					<li>서류상 나이가 확인되어야 입장 가능하오니 <span class = "bold">증빙서류</span>를 지참해주시기 바랍니다. (주민등록등본, 청소년증,
						학생증, 여권, 신분증 등)</li>
					<li>매표소 오픈은 공연 시작 기준 <span class = "bold">1시간 전</span>입니다.</li>
					<li>공연 당일에는 예매한 티켓의 취소, 변경, 환불이 <span class = "bold">불가</span>합니다.</li>
					<li><span class = "bold">공연 시작 후 입장</span>이 불가능하며, 공연 중 퇴장 시  <span class = "bold">재입장</span>이 불가능합니다.</li>
					<li>사전에 협의되지 않은 <span class = "bold">사진, 영상촬영, 녹음</span>은 절대 불가합니다.</li>
					<li>공연장 내 생수만 반입이 가능하며, 그 외 <span class = "bold">음료수, 음식물</span>은 반입 불가합니다.</li>
				</ul>
			</div>
			<div id="detail">
			</div>

			<div id="venue">
				<h4>공연장 안내</h4>
				<jsp:include page="fragments/venue.jsp">
				    <jsp:param name="venue_name" value="${musical.venue_name}" />
				    <jsp:param name="hall_name" value="${musical.hall_name}" />
				</jsp:include>
				
			</div>
			<div id = "review">
				<h4>베스트 리뷰</h4>
				<div class="review-container">
					
					<c:if test = '${empty reviews}'>
						<p>작성된 리뷰가 없습니다. 😥</p>
					</c:if>
					<c:forEach items = '${reviews}' var = 'review'>
						<div class="reviw_content">
							
							<div class="star_rating read-only sttar">
		                    	<span class="star  ${review.rating >= 1 ? 'on' : '0'}"></span>
		                    	<span class="star  ${review.rating >= 2 ? 'on' : '0'}"></span>
		                    	<span class="star  ${review.rating >= 3 ? 'on' : '0'}"></span>
		                    	<span class="star  ${review.rating >= 4 ? 'on' : '0'}"></span>
		                    	<span class="star  ${review.rating >= 5 ? 'on' : '0'}"></span>
		                	</div>
		                	<div class="review_text">${review.content}</div>
								
						</div>
					</c:forEach>
				
				</div>
			</div>
			
			<h4>등장인물 정보</h4>
			<div id="actor">
				<c:set var="previousCharacterName" value="" />
				<c:forEach var = "actor" items = "${actors }">
					<c:if test = "${previousCharacterName ne actor.character_name }">
						<div class = "actor-row">
							<p><strong>${actor.character_name}</strong></p>
						</div>
					</c:if>
					<div class = "actor-info" data-character="${actor.character_name}">
						<img src = "/ex/resources/img/actor/${actor.actor_img}">
						<p>${actor.actor_name}</p>

					</div>
					 <c:set var="previousCharacterName" value="${actor.character_name}" />
				</c:forEach>
				
			</div>
			<h4>공연 스케줄 안내</h4>
			<div class="schedule-grid">
				<c:forEach var="entry" items="${scheduleMap}">
					
				 	<table>
				 		<tr>
				 			<th>${entry.key.mu_sch_date} (${entry.key.dayOfWeekInKorean})</th>
					 		<td>
						 		<c:forEach var="time" items="${entry.value}">
					                <div>${time}</div>
					            </c:forEach>
				           	</td>
			           </tr>
					</table>
				</c:forEach>
			</div>
		</div>
		<div class="scroll-controls">
	        <button class="scroll-to-top" id="scrollToTopBtn">
		        <span class="material-symbols-outlined">
					arrow_drop_up
				</span>
			</button>
	        <button class="scroll-to-bottom" id="scrollToBottomBtn">
				<span class="material-symbols-outlined">
					arrow_drop_down
				</span>
				
			</button>
	    </div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f19069c7a5e6ecba64f00927cb2c6594&libraries=services"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
