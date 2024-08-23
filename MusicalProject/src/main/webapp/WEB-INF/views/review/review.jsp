<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>rivew_page</title>
<style>
div{
border:1px solid black;}
body{
font-size: 25px;
}
.review_content {
	margin-top: 40px;
	margin-bottom: 40px
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
        background: url('../resources/star.png') no-repeat;
        background-size: cover;
        cursor: pointer;
    }

    .star_rating .star.on {
        background: url('../resources/full_star.png') no-repeat;
        background-size: cover;
    }

	.star_rating.read-only .star {
            pointer-events: none; /* 클릭 이벤트를 비활성화합니다 */
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
.sort-options{
margin-left:200px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#sort').change(function(){
			var sortBy=$(this).val();
			$.ajax({
				
				url:'/ex/review/review',
				type:'GET',
				data:{sort:sortBy},
				success:function(response){
					$('body').html(response);
				},
				error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
			
				}
			});
		});
		
			
		 	
		
		 $("#openReview").click(function() {
             $("#reviewForm").toggle();
         });
		 
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
	<h1>리뷰</h1>
<div class="main"> 
	<div class="sort-options">
	    <label for="sort">정렬 기준:</label>
	    <select id="sort" name="sort">
	        <option value="date" ${param.sort == 'date' ? 'selected' : ''}>최신순</option>
	        <option value="rating" ${param.sort == 'rating' ? 'selected' : ''}>평점순</option>
	    </select>
	    </div>
	    <div class="average-rating">
			<p>평균 평점:</p>
			<div class="star_rating read-only">
					
					 <span class="star on " style="width: ${roundRating >= 1 ? '30px' : '0'};"></span>
					 <span class="star on " style="width: ${roundRating >= 2 ? '30px' : '0'};"></span>
					 <span class="star on " style="width: ${roundRating >= 3 ? '30px' : '0'};"></span>
					 <span class="star on " style="width: ${roundRating >= 4 ? '30px' : '0'};"></span>
					 <span class="star on " style="width: ${roundRating >= 5 ? '30px' : '0'};"></span>
					
				
			</div>
			<p >${avgRating }</p>
		</div>
	<c:forEach items="${List }" var="reviewDto">
		<div class="review_content">
			<div class="reviw_title">
				닉네임: ${reviewDto.customer_id}&nbsp;&nbsp;|&nbsp;&nbsp;
				<fmt:formatDate pattern="yyyy-MM-dd"
					value="${reviewDto.review_date}" />
				&nbsp;&nbsp;|&nbsp;&nbsp; 평점:
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
			<input type="number" value=${reviewDto.review_id } readonly>
			<input type="text" value=${reviewDto.customer_id } >
			<input type="number" value=${reviewDto.musical_id } >
			<input type="text" value=${reviewDto.content } >
			<input type="number" value=${reviewDto.rating } >
			<input type="date" value="<fmt:formatDate value='${reviewDto.review_date}' pattern='yyyy-MM-dd'/>" >
			</form>
			</div>
			<button class="deleteReview" data-review-id="${reviewDto.review_id }">삭제</button>
			<button class="updateReview" data-id="${reviewDto.review_id}">수정하기</button>

		</div>
		
	</c:forEach>

	<div id="reviewForm">
		<form action="insertReview" method="get">
			 <div class="star_rating">
                <span class="star" data-value="1"></span>
                <span class="star" data-value="2"></span>
                <span class="star" data-value="3"></span>
                <span class="star" data-value="4"></span>
                <span class="star" data-value="5"></span>
            </div>
			
            <input type="hidden" id="ratingValue" name="rating" value="0">
			<input type="hidden" name="customer_id" value="1"> 
			
			<input type="hidden"name="musical_id" value=1>
			<textarea id="reviewContent" name="content" placeholder="댓글을 입력하세요"></textarea>


			<br> <input type="submit" value="리뷰 제출">
		</form>
	</div>
	<div><input type="button" value="리뷰작성" id="openReview"></div>
	
	<div class="pagination">
    	<c:if test="${boardVo.page !=1}">
    		<a href='review${boardVo.makeSearch(1)}'>&lt;&lt;&lt;</a>
    	</c:if>
    	<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
    	<c:if test="${boardVo.prev }">
    		<a href='review${boardVo.makeSearch(boardVo.startPage-1)}'>&lt;&lt;</a>
    	</c:if>
    	<c:if test="${boardVo.page != 1}">
    		<a href='review${boardVo.makeSearch(boardVo.page-1)}'>&lt;</a>
    	</c:if>
    	<c:forEach begin="${boardVo.startPage }" end="${ boardVo.endPage}" var="idx">
    		<a href='review${boardVo.makeSearch(idx)}' 
    		 <c:out value="${boardVo.page==idx?' class=active ':'' }"/> >
    		 ${idx}</a>
    	</c:forEach>
    	
    	
    	
    	<c:if test="${boardVo.page != boardVo.totalEndPage}">
    		<a href='review${boardVo.makeSearch(boardVo.page+1)}'>&gt;</a>
    	</c:if>
    	<c:if test="${boardVo.next }">
    		<a href='review${boardVo.makeSearch(boardVo.endPage+1)}'>&gt;&gt;</a>
    		
    	</c:if>
    	
    	
    	<c:if test="${boardVo.page != boardVo.totalEndPage}">
    		<a href='review${boardVo.makeSearch(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
    	</c:if>
    	
    </div>

</div>
</body>
</html>