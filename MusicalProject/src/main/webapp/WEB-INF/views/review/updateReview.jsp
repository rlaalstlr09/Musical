<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>update_rivew_page</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			 	
		 $('.star_rating .star').click(function() {
	            var value = $(this).data('value');
	            $(this).siblings().removeClass('on');
	            $(this).addClass('on').prevAll('.star').addClass('on');
	            $('#ratingValue').val(value);
	        });
		 
		
		 	
		 
	});
</script>
<style>
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
</style>
</head>
<body>
	<h1>리뷰 수정 페이지</h1>
<div class="main"> 
	
				
				<div id="updateForm">
					<form action="updateReview" method="POST">
					<div class="star_rating">
		                <span class="star" data-value="1"></span>
		                <span class="star" data-value="2"></span>
		                <span class="star" data-value="3"></span>
		                <span class="star" data-value="4"></span>
		                <span class="star" data-value="5"></span>
            		</div>
						<input type="hidden" value=${reviewDto.review_id } name="review_id" readonly>
						<input type="hidden" value=${reviewDto.customer_id } name="customer_id">
						<input type="hidden" value=${reviewDto.musical_id } name="musical_id">
						댓글 내용:<textarea  name="content">${reviewDto.content } </textarea>
						<input type="hidden" value=${reviewDto.rating } name="rating">
						<input type="date" value="<fmt:formatDate value='${reviewDto.review_date}' pattern='yyyy-MM-dd'/>" readonly>
						<input type="submit" value="수정하기">
					</form>
				</div>
				
	
			</div>
			
		
</body>
</html>