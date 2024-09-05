<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>my_rivew_page</title>
<style>

.main{
	margin-left: 280px;
	width: calc(100% - 280px);
	padding: 20px;
	
}

.review_content {
    margin-top: 20px; /* 여백 줄이기 */
    margin-bottom: 20px; /* 여백 줄이기 */
    background-color: #ffffff; /* 배경색 */
    padding: 20px; /* 내부 여백 */
    border: 1px solid #ddd; /* 테두리 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 */
    transition: box-shadow 0.3s ease, transform 0.3s ease; /* 부드러운 전환 효과 */
    width:500px; 
}

.review_content:hover {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 */
    transform: translateY(-5px); /* 호버 시 약간 위로 이동 */
}

/* 리뷰 제목 */
.reviw_title {
    margin-bottom: 10px; /* 제목과 내용 사이 여백 */
    font-size: 1.1em; /* 제목 폰트 크기 */
    font-weight: bold; /* 제목 굵게 */
    color: #333; /* 제목 색상 */
}
#reviewForm{
display:none;
}
 .star_rating {
        display: inline-flex;
        flex-direction: row;
    }

    .star_rating .star {
        width: 30px;
        height: 30px;
        margin-right: 5px;
        background: url('../resources/img/star.png') no-repeat;
        background-size: cover;
        cursor: pointer;
    }

    .star_rating .star.on {
        background: url('../resources/img/full_star.png') no-repeat;
        background-size: cover;
    }

	.star_rating.read-only .star {
            pointer-events: none; /* 클릭 이벤트를 비활성화합니다 */
        }
     #starstar{
     margin-top:10px;
     margin-bottom:20px;
     }
   
        
    
.pagination {
  display: inline-block;
}


.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
[id^="updateForm"]{
display:none;
}
body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
}
.sidebar{
	width: 250px;
	background-color: #fff;
	color: #000;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	padding-top: 20px;
	border-right: 1px solid #ddd;
	box-shadow: 2px 0 5px rgba(0,0,0,0.1);
}
.sidebar .mypage{
	text-align: center;
	margin-bottom: 30px;
	font-size: 1.5em;
	padding-bottom: 10px;
	color: #333;
}
.sidebar a{
	display: block;
	color: #555;
	text-decoration: none;
	padding: 15px 20px;
	font-size: 1em;
	transition: background-color 0.3s ease;
	border-bottom: 1px solid #eee;
}
.sidebar .a:hover{
	background-color: #f7f7f7;
	color: #333;
}
h{
text-align:center;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$(document).on('click', '.pagination a', function(e) {
	        e.preventDefault(); // 기본 링크 동작 방지

	        var page = $(this).data('page'); // 클릭한 페이지 번호
	        loadPage(page);
	    });
			
		 
		
		function loadPage(page) {
	        $.ajax({
	            url: '/ex/review/myReview', // 페이지 로드 요청 URL
	            type: 'GET',
	            data: {
	                page: page, // 현재 페이지 번호
	                
	                customer_id: $('#customer_id').val() // 음악 ID
	            },
	            success: function(response) {
	                $('body').html(response); // 받은 데이터를 콘텐츠에 업데이트

	               
	            },
	            error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
	            }
	        });
	    }
		
		 
		 
		 $(".updateReview").click(function() {
             var updateForm="#updateForm_"+$(this).data("id");
             
			 $(updateForm).toggle();
         });
		 
		 $(".deleteReview").click(function() {
				var review_id = $(this).data('review-id');
				if (confirm('정말로 삭제하시겠습니까?')) {
					window.location.href = "deleteReview?review_id=" + review_id;
				}
			});
		 
		 $('.star_rating.read-only .star').off('click');
		 
		 $('.star_rating .star').click(function() {
	            var value = $(this).data('value');
	            $(this).siblings().removeClass('on');
	            $(this).addClass('on').prevAll('.star').addClass('on');
	            $('#ratingValue').val(value);
	        });
		
		 	
		 $('form').on('submit', function(e) {
			    var ratingValue = $('#ratingValue').val();
			    if (ratingValue === "0") {
			        $('#ratingValue').val('1'); // 별점이 설정되지 않은 경우 기본값을 1로 설정
			    }
			});
	});
</script>
</head>
<body>
	
<div class="sidebar">
		<a href="/ex/member/myPage" class="mypage">마이페이지</a>
		<a href="/ex/member/read?customer_id=${pageContext.request.userPrincipal.name }" class="a">회원 정보</a>
		<a href="/ex/member/write" class="a">1:1문의</a>
		<a href="/ex/member/qa_list?customer_id=${pageContext.request.userPrincipal.name }" class="a">1:1문의내역</a>
		<a href="/ex/review/myReview?customer_id=${pageContext.request.userPrincipal.name }">내가 쓴 리뷰</a>
		<a href="#" class="a">장바구니</a>
		<a href="remove" class="a">회원탈퇴</a>
	</div>
<div class="main"> 
	<h1>내가 쓴 리뷰</h1>
	    <c:if test = "${boardVo.totalCount == 0 }">
	    	<p>등록된 리뷰가 없습니다.</p>
	    </c:if>
	    <c:if test="${roundRating ne 0}">
		    
		<c:forEach items="${List }" var="reviewDto">
			<div class="review_content">
				<div class="reviw_title">
					${reviewDto.musical_title}&nbsp;&nbsp;|&nbsp;&nbsp;
					<fmt:formatDate pattern="yyyy-MM-dd"
						value="${reviewDto.review_date}" />
					&nbsp;&nbsp;|&nbsp;&nbsp; 
					 <div class="star_rating read-only">
	                    <span class="star on " style="width: ${reviewDto.rating >= 1 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 2 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 3 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 4 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 5 ? '30px' : '0'};"></span>
	                </div>
	                <p class="review_text">${reviewDto.content}</p>
				</div>
				
				<div id="updateForm_${reviewDto.review_id}">
				<form action="updateReview">
				<input type="hidden" value=${reviewDto.review_id } name="review_id" >
				<input type="text" value=${reviewDto.musical_title } name="musical_title" >
				<input type="hidden" value=${reviewDto.customer_id } id="customer_id" name="customer_id">
				<input type="hidden" value=${reviewDto.musical_id } name="musical_id">
				<input type="text" value=${reviewDto.content } name="content">
				<input type="hidden" value=${reviewDto.rating } name="rating">
				<input type="date" value="<fmt:formatDate value='${reviewDto.review_date}' pattern='yyyy-MM-dd'/>" >
				</form>
				</div>
				
	
			</div>
			
		</c:forEach>
	</c:if>
	
	
	
	<div class="pagination">
    <c:if test="${boardVo.page != 1}">
        <a href="#" data-page="1">&lt;&lt;&lt;</a>
    </c:if>
    <c:if test="${boardVo.prev }">
        <a href="#" data-page="${boardVo.startPage-1}">&lt;&lt;</a>
    </c:if>
    <c:if test="${boardVo.page != 1}">
        <a href="#" data-page="${boardVo.page-1}">&lt;</a>
    </c:if>
    <c:forEach begin="${boardVo.startPage}" end="${boardVo.endPage}" var="idx">
        <a href="#" data-page="${idx}" class="${boardVo.page == idx ? 'active' : ''}">
            ${idx}
        </a>
    </c:forEach>
    <c:if test="${boardVo.page != boardVo.totalEndPage}">
        <a href="#" data-page="${boardVo.page+1}">&gt;</a>
    </c:if>
    <c:if test="${boardVo.next }">
        <a href="#" data-page="${boardVo.endPage+1}">&gt;&gt;</a>
    </c:if>
    <c:if test="${boardVo.page != boardVo.totalEndPage}">
        <a href="#" data-page="${boardVo.totalEndPage}">&gt;&gt;&gt;</a>
    </c:if>
</div>

</div>
</body>
</html>