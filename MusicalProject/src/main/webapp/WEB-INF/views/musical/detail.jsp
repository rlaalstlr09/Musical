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
<style>
 #actor {
            display: flex;
            flex-wrap: wrap;
        }
        .actor-row {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }
        .actor-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin: 0.5rem;
            width: 150px;
        }
 
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- <script src="/ex/resources/script/musicalDetail.js"></script>  -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f19069c7a5e6ecba64f00927cb2c6594&libraries=services"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var $ = jQuery.noConflict();
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
	$('a#like-button').on('click',function() {
		let $this = $(this);
		let isLiked = $this.hasClass('liked');
		let musicalId = $this.data('musical');
		let customerId = $this.data('customer');

		if (isLiked && !confirm('정말 취소하시겠습니까?')) {
			return;
		}

		$.ajax({
			url : '/ex/musical/like',
			method : 'POST',
			data : {
				musical_id : musicalId,
				customer_id : customerId
			},
			success : function(response) {
				if (response.redirect) {
					// 로그인 필요 시 로그인 페이지로 리다이렉트
					window.location.href = response.redirect;
				}
				var currentCount = parseInt(
						$('span#total-likes').text(), 10);
				if (isLiked) {
					$this.removeClass('liked').text('♡'); // 좋아요 취소
					$('span#total-likes').text(currentCount - 1);
				} else {
					$this.addClass('liked').text('♥'); // 좋아요 추가
					$('span#total-likes').text(currentCount + 1);

				}
				$('span#total-likes').text(response.total_likes);
			},
			error : function(error) {
				console.error('Error loading content:', error);
			}

		});
	});

	//탭 클릭하면 함수 실행
	$('a[data-toggle="tab"]').on('click', function(e) {
		var tabId = $(this).attr('href').substring(1);
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
    
});
</script>
</head>
<body>

	<div class="container mt-4">
		<div id="info">
			<button onclick="location.href='/ex/musical/listAll'">목록</button>
			<img src="/ex/resources/img/musical/${musical.musical_poster}" alt="poster"
				class="img-fluid">
			<h1>${musical.musical_title}</h1>
			<br> 공연 장소 :
			<!-- Link to open the modal -->
			<a href="#" class="open-venue-modal" id="openModalLink"
				data-toggle="modal" data-target="#venue-modal">${musical.venue_name }&nbsp;${musical.hall_name}</a>

			<!-- Modal -->
			<div class="modal fade" id="venue-modal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content modal-lg">
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
			<fmt:formatDate value="${musical.musical_period_start}"
				pattern="yyyy-MM-dd" />
			~
			<fmt:formatDate value="${musical.musical_period_end}"
				pattern="yyyy-MM-dd" />
			<br> 상영 시간 : ${musical.musical_runningtime}<br> 연령 제한 :
			${musical.musical_agelimit}<br>
			<table>
				<tr>
					<th>좌석 등급</th>
					<th>가격</th>
				</tr>
				
				<c:forEach var="seat" items="${musical.seatDtos}">
				      <tr>
				      	<td>${seat.seat_grade}</td>
				      	<td>${seat.seat_price} 원</td>
				      </tr>
				</c:forEach>
				
			</table>
			
		</div>
		<div id="like">
			<a href="#" id="like-button" class="${isLike == 1 ? 'liked' : ''}"
				data-customer="${customer_id }"
				data-musical="${musical.musical_id }"> ${isLike == 1 ? '♥' : '♡'}

			</a> <span id="total-likes">${musical.total_likes }</span>
		</div>
		<div>
			<a href="#">예매하기</a>
		</div>
		<div class = "card text-center">
			<div id="tab" class = "card-header">
				<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="chararcter-tab" data-toggle="tab" href="#character" role="tab">배우 정보</a>
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
		<div id="musiscal-detail">
			<h4>공연 상세</h4>
			<div id="notice">
				<strong>공지사항</strong>
				<ul>
					<li>본 공연은 ${musical.musical_agelimit}세부터 예약 가능합니다.</li>
					<li>서류상 나이가 확인되어야 입장 가능하오니 증빙서류를 지참해주시기 바랍니다. (주민등록등본, 청소년증,
						학생증, 여권, 신분증 등)</li>
					<li>매표소 오픈은 공연 시작 기준 1시간 전입니다.</li>
					<li>공연 당일에는 예매한 티켓의 취소, 변경, 환불이 불가합니다.</li>
					<li>공연 시작 후 입장이 불가능하며, 공연 중 퇴장 시 재입장이 불가능합니다.</li>
					<li>사전에 협의되지 않은 사진, 영상촬영, 녹음은 절대 불가합니다.</li>
					<li>공연장 내 생수만 반입이 가능하며, 그 외 음료수, 음식물은 반입 불가합니다.</li>
				</ul>
			</div>
			<div id="detail">포스터, 상세정보 표시</div>

			<div id="venue">
				<jsp:include page="fragments/venue.jsp">
				    <jsp:param name="venue_name" value="${musical.venue_name}" />
				    <jsp:param name="hall_name" value="${musical.hall_name}" />
				</jsp:include>
				
			</div>
			<div id="review">
				<c:forEach items = '${reviews}' var = 'review'>
					<p id="customerId">${review.customer_id } (${review.rating } 점)</p>
					<p>${review.content}</p>
				</c:forEach>
			
			</div>

			<div id="schedule">

				<c:set var="previousDate" value="" />
				<table>
					<tr>
						<th>날짜</th>
						<th>요일</th>
						<th>공연 시간</th>
					</tr>

					<c:forEach var="schedule" items="${schedules }">
						<c:if test="${schedule.mu_sch_date ne previousDate}">
							<tr>
								<td><fmt:formatDate value="${schedule.mu_sch_date}"
										pattern="yyyy-MM-dd" /></td>
								<td>${schedule.dayOfWeekInKorean}</td>
							</tr>
							<c:set var="previousDate" value="${schedule.mu_sch_date}" />
						</c:if>
						<tr>
							<td><fmt:formatDate value="${schedule.mu_sch_time}"
									pattern="HH:mm" /></td>
						</tr>
					</c:forEach>

				</table>
				<div id="actor">
					<c:set var="previousCharacterName" value="${actors[0].character_name}" />
					<c:forEach var = "actor" items = "${actors }">
						<c:if test = "${previousCharacterName ne actor.character_name }">
							
							<div class = "actor-row"></div>
						</c:if>
						<div class = "actor-info" data-character="${actor.character_name}">
							<p><img src = "/ex/resources/${actor.actor_img}"></p>
							<p>${actor.character_name}</p>
							<p>${actor.actor_name}</p>

						</div>
						 <c:set var="previousCharacterName" value="${actor.character_name}" />
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>
